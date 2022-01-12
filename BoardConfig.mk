#
# Copyright (C) 2021 The Android Open Source Project
# Copyright (C) 2021 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/askey/sti6140d360

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a53
TARGET_CPU_SMP := true
TARGET_USES_64_BIT_BINDER := true
ENABLE_CPUSETS := true

# Platform
BOARD_VENDOR := amlogic
TARGET_SOC := s905x2
TARGET_BOARD_HARDWARE := amlogic
TARGET_BOARD_PLATFORM := g12a
#TARGET_BOARD_PLATFORM := sti6140d360
TARGET_BOARD_PLATFORM_GPU := mali-g31mp2
TARGET_BOOTLOADER_BOARD_NAME := u212
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Graphics
BOARD_EGL_CFG := $(DEVICE_FOLDER)/egl.cfg
USE_OPENGL_RENDERER := true

# Assert
TARGET_OTA_ASSERT_DEVICE := sti6140d360

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 25165824 # This is the maximum known partition size, but it can be higher, so we just omit it
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 26464256
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_COPY_OUT_VENDOR := vendor

# Metadata
BOARD_USES_METADATA_PARTITION := true

# NTFS Support
TW_INCLUDE_FUSE_NTFS := true
TW_INCLUDE_NTFS_3G := true

# Dynamic Partition
BOARD_ONN_DYNAMIC_PARTITIONS_SIZE := 1677721600
BOARD_SUPER_PARTITION_GROUPS := onn_dynamic_partitions
BOARD_ONN_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    system \
    vendor \
		product \
		odm

# Kernel
BOARD_KERNEL_CMDLINE := androidboot.dynamic_partitions=true androidboot.dtbo_idx=0 androidboot.boot_devices=ffe07000.emmc buildvariant=user
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/zImage
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x01078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0xfff88000
BOARD_KERNEL_TAGS_OFFSET := 0xfef88100
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_KERNEL_IMAGE_NAME := zImage
TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_HEADER_ARCH := arm
TARGET_KERNEL_SOURCE := kernel/askey/sti6140d360
TARGET_KERNEL_CONFIG := sti6140d360_defconfig

# Android Verified Boot
#BOARD_AVB_ENABLE := false
# Avb
#BOARD_AVB_ENABLE := true
#BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
#BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA2048
#BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
#BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1
#BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 2


# Recovery
# auto copy files placed in device/$VENDOR/$DEVICENAME/recovery/root inside recovery ramdisk (e.g. init.recivery*.rc which get removed from recoveryramdisk by default).
# example: for Onn Android TV Box ( set your device tree's location )
TARGET_RECOVERY_DEVICE_DIRS += device/askey/sti6140d360

# Misc
TW_MTP_DEVICE := /dev/mtp_usb
TW_HAS_MTP := true
#TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true

# Debug
TARGET_USES_LOGD := true
# include Logcat daemon for help in debugging
TWRP_INCLUDE_LOGCAT := true
TWRP_EVENT_LOGGING := false

# remove TrueType fonts
#TW_DISABLE_TTF:= true

# building of an OEM friendly TWRP. excludes SuperSu, uses Toolbox instead busybox, disables themeing
#TW_OEM_BUILD := true

# TWRP recovery.fstab
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab

# Supply a custom init.rc for the recovery
TARGET_RECOVERY_INITRC := $(DEVICE_PATH)/recovery/init.recovery.amlogic.rc

# TWRP Theme BOARD_SUPER_PARTITION_GROUPS
TW_THEME := landscape_hdpi

# Set the default language, if not english
TW_DEFAULT_LANGUAGE := en

# disables things like sdcard partitioning and may save you some space if TWRP isn't fitting in your recovery patition
BOARD_HAS_NO_REAL_SDCARD := true

BOARD_HAS_SDCARD_INTERNAL := true

# Set the path to the sysfs entry which controls the brightness
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"

# Max brightness to prevent display damage
TW_MAX_BRIGHTNESS := 255

# Default brightness for TWRP
TW_DEFAULT_BRIGHTNESS := 150

# Disable/enable SELinux. Only suggested when you want to enable SELinux support
#TWHAVE_SELINUX := true

# TWRP specific build flags
RECOVERY_VARIANT := twrp
RECOVERY_SDCARD_ON_DATA := false
#TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888
TARGET_RECOVERY_FORCE_PIXEL_FORMAT := "RGB_565"
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_TOUCH_RECOVERY :=
BOARD_RECOVERY_SWIPE := true
BOARD_SUPPRESS_SECURE_ERASE := true
TW_USE_NEW_MINADBD := true
TW_USE_TOOLBOX := true
TW_INCLUDE_NTFS_3G := true

TW_INCLUDE_LOGICAL := product odm
TW_EXTRA_LANGUAGES := false
TW_SCREEN_BLANK_ON_BOOT := false
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_DEVICE_VERSION := $(shell date '+%Y%m%d') by Eliminater74

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# Decryption support for /data
TW_INCLUDE_CRYPTO := false
TW_INCLUDE_CRYPTO_FBE := false
TW_INCLUDE_FBE_METADATA_DECRYPT := false
BOARD_USES_METADATA_PARTITION := false

# Tool
#TW_INCLUDE_REPACKTOOLS := true
#TW_INCLUDE_RESETPROP := true
#TW_INCLUDE_LIBRESETPROP :=true

### ----------------------------------- ###
### TW NO'S ###
TW_NO_SCREEN_TIMEOUT := true
TW_NO_HAPTICS := true
TW_NO_LEGACY_PROPS := true
# Disable the battery percentage for devices where it doesn't work properly
TW_NO_BATT_PERCENT := true
# Remove exFAT formatting binaries
TW_NO_EXFAT := true
### ----------------------------------- ###
