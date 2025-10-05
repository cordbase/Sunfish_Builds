#!/bin/bash

# Cleanup
rm -rf .repo/local_manifests
rm -rf prebuilts/clang/host/linux-x86
rm -rf device/google/sunfish
rm -rf vendor/google/sunfish
rm -rf kernel/google/sunfish

# Repo Init
repo init -u https://github.com/DotOS/manifest.git -b dot11

# Device Trees
git clone --depth=1 -b dotos https://github.com/cordbase/local_manifest.git .repo/local_manifests

# Repo Sync
repo sync -c -j$(nproc --all) --fail-fast --force-sync --no-clone-bundle --no-tags --optimized-fetch --prune

# Build
source build/envsetup.sh
lunch dot_sunfish-userdebug
make bacon
