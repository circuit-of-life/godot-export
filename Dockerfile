# to update version, change all references to 4.6.1
FROM barichello/godot-ci:4.6.1

USER root
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    libfontconfig1 \
    && rm -rf /var/lib/apt/lists/*

LABEL org.opencontainers.image.source="https://github.com/circuit-of-life/godot-export"
LABEL org.opencontainers.image.description="Godot CI image with fontconfig"

RUN apt-get update && apt-get install -y --no-install-recommends \
    libfontconfig1 \
    && mkdir -p /root/.local/share/godot/export_templates \
    && mkdir -p /root/.config \
    && if [ -d /root/.config/godot ]; then mv /root/.config/godot /root/.config/godot.bak || true; fi \
    && rm -rf /var/lib/apt/lists/*
