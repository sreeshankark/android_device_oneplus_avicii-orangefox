#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 OrangeFox Recovery Project 
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/oneplus/avicii

# A/B support
AB_OTA_UPDATER := true

# fscrypt policy
TW_USE_FSCRYPT_POLICY := 1

# A/B updater updatable partitions list. Keep in sync with the partition list
# with "_a" and "_b" variants in the device. Note that the vendor can add more
# more partitions to this list for the bootloader and radio.
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    recovery \
    product \
    system \
    system_ext \
    vendor \
    vbmeta \
    vbmeta_system

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    checkpoint_gc \
    update_engine_sideload

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true
    
# API
PRODUCT_SHIPPING_API_LEVEL := 29

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-service \
    android.hardware.boot@1.2-impl-wrapper.recovery \
    android.hardware.boot@1.2-impl-wrapper \
    android.hardware.boot@1.2-impl.recovery \
    bootctrl.$(PRODUCT_PLATFORM) \
    bootctrl.$(PRODUCT_PLATFORM).recovery
    
PRODUCT_PACKAGES_DEBUG += \
    bootctl
        
# Health HAL
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl.recovery


# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd \
    resetprop

# Hidl Service
PRODUCT_ENFORCE_VINTF_MANIFEST := true

# tzdata
PRODUCT_PACKAGES_ENG += \
    tzdata_twrp

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    vendor/qcom/opensource/commonsys-intf/display

# qcom encryption
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe 

ifeq ($(FOX_VARIANT),FBEv2)
# fscrypt policy
TW_USE_FSCRYPT_POLICY := 2

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
        ro.crypto.allow_encrypt_override=true \
	ro.crypto.dm_default_key.options_format.version=2 \
	ro.crypto.volume.filenames_mode=aes-256-cts \
	ro.crypto.volume.metadata.method=dm-default-key \
	ro.crypto.volume.options=::v2
endif

# Recovery Modules
TARGET_RECOVERY_DEVICE_MODULES += \
    libion \
    vendor.display.config@1.0 \
    vendor.display.config@2.0 \
    libdisplayconfig.qti
        
RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@1.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@2.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/libdisplayconfig.qti.so
    
# OEM otacert
PRODUCT_EXTRA_RECOVERY_KEYS += \
    $(LOCAL_PATH)/security/oneplus
