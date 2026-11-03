#!/usr/bin/env bash

date_time="`date +%Y%m%d%H%M`"

sudo nixos-rebuild switch

cd ~/moley-os
git add .
git commit -m "$date_time"
git push origin main

echo "Rebuilt Nix and pushed changes to GitHub..."

