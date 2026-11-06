#!/bin/bash
set -euo pipefail

REPO="https://github.com/elikk-cpu/shvirtd-example-python.git"
DIR="/opt/shvirtd-example-python"

if [ ! -d "$DIR/.git" ]; then
    sudo git clone "$REPO" "$DIR"
else
    sudo git -C "$DIR" pull --ff-only
fi

cd "$DIR"
sudo docker compose up -d --build
sudo docker compose ps
