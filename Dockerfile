FROM barichello/godot-ci:4.6.1

USER root
ENV DEBIAN_FRONTEND=noninteractive

LABEL org.opencontainers.image.source="https://github.com/circuit-of-life/godot-export"
LABEL org.opencontainers.image.description="Godot CI image with fontconfig"

RUN apt-get update && apt-get install -y --no-install-recommends \
    libfontconfig1 \
    && mkdir -p /root/.local/share/godot/export_templates \
    && mkdir -p /root/.config \
    && rm -rf /var/lib/apt/lists/*