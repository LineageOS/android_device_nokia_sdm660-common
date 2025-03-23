#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)
from extract_utils.fixups_lib import (
    lib_fixup_remove,
    lib_fixups,
    lib_fixups_user_type,
)
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

import extract_utils.tools
extract_utils.tools.DEFAULT_PATCHELF_VERSION = '0_9'

namespace_imports = [
    'device/nokia/sdm660-common',
    'hardware/qcom-caf/msm8998',
    'hardware/qcom-caf/wlan',
    'vendor/qcom/opensource/dataservices',
    'vendor/qcom/opensource/data-ipa-cfg-mgr-legacy-um',
]

def lib_fixup_vendor_suffix(lib: str, partition: str, *args, **kwargs):
    return f'{lib}_{partition}' if partition == 'vendor' else None

lib_fixups: lib_fixups_user_type = {
    **lib_fixups,
    (
        'com.qualcomm.qti.dpm.api@1.0',
        'vendor.qti.hardware.fm@1.0',
        'vendor.qti.imsrtpservice@3.0',
    ): lib_fixup_vendor_suffix,
    (
	'libmm-omxcore',
	'libOmxCore',
	'libril',
	'libwpa_client',
    ): lib_fixup_remove,
}

blob_fixups: blob_fixups_user_type = {
    'vendor/lib64/libwvhidl.so': blob_fixup()
        .add_needed('libcrypto_shim.so'),
    'vendor/bin/pm-service': blob_fixup()
	.add_needed('libutils-v33.so'),
    'system_ext/lib64/lib-imsvideocodec.so': blob_fixup()
	.add_needed('libgui_shim.so')
	.replace_needed('libqdMetaData.so', 'libqdMetaData.system.so'),
}  # fmt: skip

module = ExtractUtilsModule(
    'sdm660-common',
    'nokia',
    blob_fixups=blob_fixups,
    lib_fixups=lib_fixups,
    namespace_imports=namespace_imports,
)

if __name__ == '__main__':
    utils = ExtractUtils.device(module)
    utils.run()
