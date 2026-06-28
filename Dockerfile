FROM debian:trixie-slim

USER root
SHELL ["/bin/bash", "-c"]
ENV DEBIAN_FRONTEND=noninteractive

ARG GODOT_VERSION="4.7.0"
ARG RELEASE_NAME="stable"
ARG GODOT_PLATFORM="linux.x86_64"

ENV TEMPLATE_DIR=/root/.local/share/godot/export_templates/${GODOT_VERSION}.${RELEASE_NAME}

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    wget \
    unzip \
    zip \
    libfontconfig1 \
    && wget https://github.com/godotengine/godot-builds/releases/download/${GODOT_VERSION}-${RELEASE_NAME}/Godot_v${GODOT_VERSION}-${RELEASE_NAME}_${GODOT_PLATFORM}.zip \
    && wget https://github.com/godotengine/godot-builds/releases/download/${GODOT_VERSION}-${RELEASE_NAME}/Godot_v${GODOT_VERSION}-${RELEASE_NAME}_export_templates.tpz \
    && mkdir -p ~/.cache ~/.config/godot \
    && mkdir -p ${TEMPLATE_DIR} \
    && unzip Godot_v${GODOT_VERSION}-${RELEASE_NAME}_${GODOT_PLATFORM}.zip \
    && mv Godot_v${GODOT_VERSION}-${RELEASE_NAME}_${GODOT_PLATFORM} /usr/local/bin/godot \
    && unzip Godot_v${GODOT_VERSION}-${RELEASE_NAME}_export_templates.tpz \
    && mv templates/icudt_godot.dat ${TEMPLATE_DIR} \
    && mv templates/version.txt ${TEMPLATE_DIR} \
    && mv templates/macos.zip ${TEMPLATE_DIR} \
    && mv templates/linux_release.x86_64 ${TEMPLATE_DIR} \
    && mv templates/windows_release_x86_64.exe ${TEMPLATE_DIR} \
    && rm -f *.tpz *.zip \
    && rm -rf templates \
    && rm -rf /var/lib/apt/lists/*