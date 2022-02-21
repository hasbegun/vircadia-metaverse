# Dockerfile for building a runable version of the Iamus metaverse-server
FROM node:14 as iamus-build

ARG REPO=vircadia
ARG BRANCH=master
ARG COMMIT=""

ENV METAVERSE_HOME=/usr/local/src/vircadia-metaverse

RUN mkdir -p /usr/local/src \
    && cd /usr/local/src

# ADD Iamus /usr/local/src/Iamus
RUN mkdir -p /usr/local/src \
    && cd /usr/local/src && \
    git clone --depth 1 --branch ${BRANCH} https://github.com/${REPO}/vircadia-metaverse.git

RUN cd ${METAVERSE_HOME} \
    && npm install

# Build the application into the 'dist' directory
RUN cd ${METAVERSE_HOME} \
    && npm run build

# ==================================================
# FROM node:14-slim as iamus-run    # 'slim' works so consider using it after debugging
FROM node:14 as iamus-run

RUN apt-get update && apt-get install -y netcat
# DEV pkgs. Not necessary for prod.
RUN apt-get install -y sudo vim git curl

ENV USER=cadia
ENV METAVERSE_DIR=vircadia-metaverse

# Add a user for the server to run under
RUN adduser --disabled-password --gecos 'metaverse-server user' ${USER}

WORKDIR /home/${USER}
USER ${USER}:${USER}

RUN mkdir -p /home/${USER}/${METAVERSE_DIR}/dist \
    mkdir -p /home/${USER}/config

# Copy over the built files
COPY --from=iamus-build --chown=${USER}:${USER} /usr/local/src/${METAVERSE_DIR}/package*.json /home/${USER}/${METAVERSE_DIR}/
COPY --from=iamus-build --chown=${USER}:${USER} /usr/local/src/${METAVERSE_DIR}/dist /home/${USER}/${METAVERSE_DIR}/dist

# Install the production NPM packages
RUN cd /home/${USER}/${METAVERSE_DIR} \
    && npm install --production

# The startup scripts
COPY --chown=${USER}:${USER} ./files/run-metaverse.sh /home/${USER}
COPY --chown=${USER}:${USER} ./files/GetVersion.sh /home/${USER}

# directory created so caller can mount and use a config file from here
VOLUME /home/${USER}/config

# Copy key and cert
COPY --chown=${USER}:${USER} ./files/*.key /home/${USER}/config
COPY --chown=${USER}:${USER} ./files/*.crt /home/${USER}/config
COPY --chown=${USER}:${USER} ./config/iamus.json /home/${USER}/config

EXPOSE 9400

ENTRYPOINT [ "/home/cadia/run-metaverse.sh" ]
