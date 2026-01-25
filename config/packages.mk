# APN list
PRODUCT_PACKAGES += \
    apns-conf.xml

# Binaries
PRODUCT_PACKAGES += \
    bash \
    nano \
	zstd

PRODUCT_PACKAGES += \
    nano_recovery

# Camera
ifneq ($(PRODUCT_NO_CAMERA),true)
PRODUCT_PACKAGES += \
    Aperture
endif

# Component overrides
PRODUCT_PACKAGES += \
    halcyon-component-overrides.xml

# Credential storage
PRODUCT_PACKAGES += \
    android.software.credentials.prebuilt.xml

# Filesystems tools
PRODUCT_PACKAGES += \
    fsck.ntfs \
    mkfs.ntfs \
    mount.ntfs

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/bin/fsck.ntfs \
    system/bin/mkfs.ntfs \
    system/bin/mount.ntfs \
    system/%/libfuse-lite.so \
    system/%/libntfs-3g.so

# Face Unlock
ifneq ($(TARGET_FACE_UNLOCK_SUPPORTED),false)
PRODUCT_PACKAGES += \
    FaceUnlock

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.face.sense_service=true

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.biometrics.face.xml
endif

# FRP
PRODUCT_COPY_FILES += \
    vendor/halcyon/prebuilt/common/bin/wipe-frp.sh:$(TARGET_COPY_OUT_RECOVERY)/root/system/bin/wipe-frp

# LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/halcyon/overlay/dictionaries
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/halcyon/overlay/dictionaries

# LMO Freeform
PRODUCT_PACKAGES += \
    LMOFreeform \
    LMOFreeformSidebar

# Nest Launcher
ifeq ($(PRODUCT_TYPE), go)
PRODUCT_PACKAGES += \
    NestQuickStepGo

PRODUCT_DEXPREOPT_SPEED_APPS += \
    NestQuickStepGo
else
PRODUCT_PACKAGES += \
    NestQuickStep

PRODUCT_DEXPREOPT_SPEED_APPS += \
    NestQuickStep
endif

# Overlays
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/halcyon/overlay/no-rro
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/halcyon/overlay/common \
    vendor/halcyon/overlay/no-rro

PRODUCT_PACKAGES += \
    DocumentsUIOverlay \
    NetworkStackOverlay \
    PermissionControllerOverlay

# Procmem
PRODUCT_PACKAGES_DEBUG += \
    procmem

ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/bin/procmem
endif

# Root
PRODUCT_PACKAGES += \
    adb_root
ifneq ($(TARGET_BUILD_VARIANT),user)
ifeq ($(WITH_SU),true)
PRODUCT_PACKAGES += \
    su

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/xbin/su
endif
endif

# Sensitive Phone Numbers list
PRODUCT_PACKAGES += \
    sensitive_pn.xml

# SetupWizard
#PRODUCT_PACKAGES += \
#    Updater

PRODUCT_COPY_FILES += \
    vendor/halcyon/prebuilt/common/etc/init/init.halcyon-updater.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.halcyon-updater.rc

PRODUCT_PRODUCT_PROPERTIES += \
    setupwizard.theme=glif_expressive \
    setupwizard.feature.day_night_mode_enabled=true

# SystemUI
PRODUCT_DEXPREOPT_SPEED_APPS += \
    CarSystemUI \
    SystemUI

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    dalvik.vm.systemuicompilerfilter=speed

ifeq ($(TARGET_BUILD_VARIANT),userdebug)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    debug.sf.enable_transaction_tracing=false
endif

# System applications
PRODUCT_PACKAGES += \
    AvatarPicker \
    LatinIME \
    Etar \
    ExactCalculator \
    SetupWizard

ifneq ($(WITH_GMS),true)
    PRODUCT_PACKAGES += \
        Etar \
        ExactCalculator \
        Glimpse
endif

# Telephony packages
PRODUCT_PACKAGES += \
    messaging \
    Stk

# TextClassifier
PRODUCT_PACKAGES += \
    libtextclassifier_annotator_en_model \
    libtextclassifier_annotator_universal_model \
    libtextclassifier_actions_suggestions_universal_model \
    libtextclassifier_lang_id_model

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/etc/textclassifier/actions_suggestions.universal.model \
    system/etc/textclassifier/lang_id.model \
    system/etc/textclassifier/textclassifier.en.model \
    system/etc/textclassifier/textclassifier.universal.model

# TouchGestures
PRODUCT_PACKAGES += \
    TouchGestures

# Include GMS If exist
ifeq ($(WITH_GMS),true)
    $(call inherit-product-if-exists, vendor/gms/config.mk)
endif
