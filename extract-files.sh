#!/bin/bash
#
# SPDX-FileCopyrightText: 2016 The CyanogenMod Project
# SPDX-FileCopyrightText: 2017-2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

ANDROID_ROOT="${MY_DIR}/../../.."

export TARGET_ENABLE_CHECKELF=false

HELPER="${ANDROID_ROOT}/tools/extract-utils/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

# Default to sanitizing the vendor folder before extraction
CLEAN_VENDOR=true

ONLY_COMMON=
ONLY_FIRMWARE=
ONLY_TARGET=
KANG=
SECTION=

while [ "${#}" -gt 0 ]; do
    case "${1}" in
        --only-common )
                ONLY_COMMON=true
                ;;
        --only-firmware )
                ONLY_FIRMWARE=true
                ;;
        --only-target )
                ONLY_TARGET=true
                ;;
        -n | --no-cleanup )
                CLEAN_VENDOR=false
                ;;
        -k | --kang )
                KANG="--kang"
                ;;
        -s | --section )
                SECTION="${2}"
                shift
                CLEAN_VENDOR=false
                ;;
        * )
                SRC="${1}"
                ;;
    esac
    shift
done

if [ -z "${SRC}" ]; then
    SRC="adb"
fi

function blob_fixup() {
    case "${1}" in
        system_ext/lib64/libdpmframework.so)
            [ "$2" = "" ] && return 0
            for  LIBCUTILS_SHIM in $(grep -L "libcutils_shim.so" "${2}"); do
                "${PATCHELF}" --add-needed "libcutils_shim.so" "${2}"
            done
            ;;
        system_ext/etc/permissions/qcrilhook.xml|system_ext/etc/permissions/telephonyservice.xml|system_ext/etc/permissions/com.qti.dpmframework.xml|system_ext/etc/permissions/dpmapi.xml)
            [ "$2" = "" ] && return 0
            sed -i "s/\/product\/framework\//\/system_ext\/framework\//g" "${2}"
            ;;
        # Fix missing symbols
        system_ext/lib64/lib-imscamera.so | system_ext/lib64/lib-imsvideocodec.so | system_ext/lib/lib-imscamera.so | system_ext/lib/lib-imsvideocodec.so)
            [ "$2" = "" ] && return 0
            for LIBGUI_SHIM in $(grep -L "libgui_shim.so" "${2}"); do
                "${PATCHELF}" --add-needed "libgui_shim.so" "${LIBGUI_SHIM}"
            done
            ;;
        vendor/etc/nfcee_access.xml)
            [ "$2" = "" ] && return 0
            sed -i 's|xliff="urn:oasis:names:tc:xliff:document:1.2"|android="http://schemas.android.com/apk/res/android"|' "${2}"
            ;;
        vendor/bin/pm-service)
            [ "$2" = "" ] && return 0
            grep -q libutils-v33.so "${2}" || "${PATCHELF}" --add-needed "libutils-v33.so" "${2}"
            ;;
        system_ext/etc/permissions/com.qualcomm.qti.imscmservice-V2.0-java.xml | system_ext/etc/permissions/com.qualcomm.qti.imscmservice-V2.1-java.xml | system_ext/etc/permissions/com.qualcomm.qti.imscmservice-V2.2-java.xml)
            [ "$2" = "" ] && return 0
            sed -i "s/\/product\/framework\//\/system_ext\/framework\//g" "${2}"
            ;;
        # Fix missing symbols
        vendor/lib/libgui_vendor.so)
            [ "$2" = "" ] && return 0
            for LIBGUI_SHIM in $(grep -L "libgui_shim_vendor.so" "${2}"); do
                "${PATCHELF}" --add-needed "libgui_shim_vendor.so" "${LIBGUI_SHIM}"
            done
            ;;
        vendor/lib/hw/camera.sdm660.so)
            [ "$2" = "" ] && return 0
            for  MEGVII_SHIM in $(grep -L "libshim_megvii.so" "${2}"); do
                "${PATCHELF}" --remove-needed "libMegviiFacepp.so" "$MEGVII_SHIM"
                "${PATCHELF}" --remove-needed "libmegface-new.so" "$MEGVII_SHIM"
                "${PATCHELF}" --add-needed "libshim_megvii.so" "$MEGVII_SHIM"
            done
            ;;
        vendor/lib*/libwvhidl.so)
            [ "$2" = "" ] && return 0
            grep -q libcrypto_shim.so "${2}" || "${PATCHELF}" --add-needed "libcrypto_shim.so" "${2}"
            ;;
        *)
            return 1
            ;;
    esac

    return 0
}

function blob_fixup_dry() {
    blob_fixup "$1" ""
}

if [ -z "${ONLY_FIRMWARE}" ] && [ -z "${ONLY_TARGET}" ]; then
    # Initialize the helper for common device
    setup_vendor "${DEVICE_COMMON}" "${VENDOR}" "${ANDROID_ROOT}" true "${CLEAN_VENDOR}"

    extract "${MY_DIR}/proprietary-files.txt" "${SRC}" "${KANG}" --section "${SECTION}"
fi

if [ -z "${ONLY_COMMON}" ] && [ -s "${MY_DIR}/../${DEVICE}/proprietary-files.txt" ]; then
    # Reinitialize the helper for device
    source "${MY_DIR}/../${DEVICE}/extract-files.sh"
    setup_vendor "${DEVICE}" "${VENDOR}" "${ANDROID_ROOT}" false "${CLEAN_VENDOR}"

    if [ -z "${ONLY_FIRMWARE}" ]; then
        extract "${MY_DIR}/../${DEVICE}/proprietary-files.txt" "${SRC}" "${KANG}" --section "${SECTION}"
    fi

    if [ -z "${SECTION}" ] && [ -f "${MY_DIR}/../../${VENDOR}/${DEVICE}/proprietary-firmware.txt" ]; then
        extract_firmware "${MY_DIR}/../../${VENDOR}/${DEVICE}/proprietary-firmware.txt" "${SRC}"
    fi
fi

"${MY_DIR}/setup-makefiles.sh"
