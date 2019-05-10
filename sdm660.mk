#
# Copyright (C) 2018 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

COMMON_PATH := device/nokia/sdm660-common

# Get non-open-source specific aspects
$(call inherit-product, vendor/nokia/sdm660-common/sdm660-common-vendor.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(COMMON_PATH)/overlay

# AB update support
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    system

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script

# Boot control
PRODUCT_PACKAGES_DEBUG += \
    bootctl

PRODUCT_PACKAGES += \
    update_engine \
    update_verifier

PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.sdm660 \
    libcutils \
    libgptutils \
    libz \

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# ANT+
PRODUCT_PACKAGES += \
    AntHalService

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default

# Camera
PRODUCT_PACKAGES += \
    Snap

# Init
PRODUCT_PACKAGES += \
    init.recovery.qcom.rc

# Keylayout
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(COMMON_PATH)/keylayout/goodix_fp.kl:system/usr/keylayout/goodix_fp.kl

# Net
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# NFC
PRODUCT_PACKAGES += \
    NfcNci \
    Tag \
    com.android.nfc_extras

# Telephony-ext
PRODUCT_PACKAGES += \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# Whitelist
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/qti_whitelist.xml:system/etc/sysconfig/qti_whitelist.xml

# Wi-Fi
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/wifi/hostapd.accept:system/etc/hostapd/hostapd.accept \
    $(COMMON_PATH)/wifi/hostapd.deny:system/etc/hostapd/hostapd.deny \
    $(COMMON_PATH)/wifi/hostapd.conf:system/etc/hostapd/hostapd_default.conf

# Wi-Fi Display
PRODUCT_BOOT_JARS += \
    WfdCommon
