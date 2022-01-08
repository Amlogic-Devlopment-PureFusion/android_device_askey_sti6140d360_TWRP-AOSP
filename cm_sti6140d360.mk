#
# Copyright (C) 2021 The Android Open Source Project
# Copyright (C) 2021 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.

$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/aosp_base.mk)
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/embedded.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Inherit from sti6140d360 device
$(call inherit-product, device/askey/sti6140d360/device.mk)

# Inherit some common twrp stuff.
$(call inherit-product, vendor/cm/config/common.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := sti6140d360
PRODUCT_NAME := cm_sti6140d360
PRODUCT_BRAND := Onn
PRODUCT_MODEL := sti6140d360
PRODUCT_MANUFACTURER := askey
