#
# Copyright (C) 2019 The LineageOS Project
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

# Audio
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.config.vc_call_vol_steps=7 \
    ro.config.media_vol_steps=25

# IMS
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.dbg.volte_avail_ovr=1 \
    persist.dbg.vt_avail_ovr=1 \
    persist.dbg.wfc_avail_ovr=1

# Memory optimizations
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.vendor.qti.sys.fw.bservice_enable=true

# OTG
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.sys.oem.otg_support=true

# Radio
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.radio.add_power_save=1

# UI
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    sys.use_fifo_ui=1
