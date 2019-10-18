#!/usr/bin/env bash
#
# Actualiza el sistema
apt update
apt dist-upgrade --yes
apt full-upgrade --yes
apt autoremove --yes
apt clean --yes
