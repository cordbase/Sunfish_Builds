#!/bin/bash

# Cleanup
rm -rf .repo/local_manifests
rm -rf prebuilts/clang/host/linux-x86

# Repo Init
repo init -u git://github.com/DotOS/manifest.git -b dot11

# Gapps
git clone --depth 1 --branch gapps https://github.com/cordbase/local_manifest.git .repo/local_manifests

# Repo Sync
/opt/crave/resync.sh 

# Device tree
git clone --depth=1 -b lineage-18.1 https://github.com/LineageOS/android_device_google_sunfish.git device/google/sunfish

# Vendor tree
git clone --depth=1 https://github.com/sourajitk/vendor_google_sunfish.git vendor/google/sunfish

# Kernel tree
git clone --depth=1 https://github.com/LineageOS/android_kernel_google_sunfish.git kernel/google/sunfish

# Build
source build/envsetup.sh
lunch dot_sunfish-userdebug
make bacon
