#!/system/bin/sh

# List of potential paths for the ufs_internal partition across different devices
PARTITION_PATHS="
/dev/block/bootdevice/by-name/ufs_internal
/dev/block/bootdevice/by-name/fips
"

UFS_PARTITION=""

# Find the valid partition path by checking if it exists
for path in $PARTITION_PATHS; do
    if [ -b "$path" ]; then
        UFS_PARTITION="$path"
        break
    fi
done

# If a valid partition path was found, execute the backup
if [ -n "$UFS_PARTITION" ]; then
    /system/bin/tar -czf - /data/misc/update_engine_log | /system/bin/dd of="$UFS_PARTITION" bs=1024 seek=4
fi
