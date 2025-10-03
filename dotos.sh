

# Cleanup
rm -rf .repo/local_manifests
rm -rf prebuilts/clang/host/linux-x86

# Repo Init
repo init -u git://github.com/DotOS/manifest.git -b dot11

# Repo Sync
/opt/crave/resync.sh 

# Build
source build/envsetup.sh
lunch dot_sunfish-user
make bacon
