#!/bin/bash

# Cleanup
rm -rf .repo/local_manifests
rm -rf prebuilts/clang/host/linux-x86
rm -rf vendor/google/sunfish
# Repo Init
repo init -u git://github.com/DotOS/manifest.git -b dot11

## Device Trees
#git clone --depth=1 -b dotos https://github.com/cordbase/local_manifest.git .repo/local_manifests

# Repo Sync
/opt/crave/resync.sh 

git clone --depth=1 https://github.com/sourajitk/vendor_google_sunfish.git vendor/google/sunfish

# Build
source build/envsetup.sh
lunch dot_sunfish-userdebug
make bacon
