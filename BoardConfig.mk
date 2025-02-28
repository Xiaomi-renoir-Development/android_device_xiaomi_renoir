#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/renoir

# Inherit from sm8350-common
include device/xiaomi/sm8350-common/BoardConfigCommon.mk

# Assert
TARGET_OTA_ASSERT_DEVICE := renoir,renoir_global,renoir_jp,renoir_ru,renoir_eea_global

# Board
TARGET_BOOTLOADER_BOARD_NAME := renoir

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/hidl/manifest.xml

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_renoir
TARGET_RECOVERY_DEVICE_MODULES := libinit_renoir

# Kernel
TARGET_KERNEL_CONFIG += vendor/renoir_QGKI.config

# Kernel modules
BOOT_KERNEL_MODULES := \
    focaltech_touch.ko \
    goodix_core.ko \
    hwid.ko \
    msm_drm.ko \
    xiaomi_touch.ko
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(BOOT_KERNEL_MODULES)

# Partitions
BOARD_DTBOIMG_PARTITION_SIZE := 25165824

# Vibrator
TARGET_QTI_VIBRATOR_EFFECT_LIB := libqtivibratoreffect.xiaomi
TARGET_QTI_VIBRATOR_USE_EFFECT_STREAM := true

# Include proprietary files
include vendor/xiaomi/renoir/BoardConfigVendor.mk
