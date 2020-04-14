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
    ro.config.media_vol_steps=25 \
    audio.offload.video=false \
    persist.sys.smartamp=1

# Bluetooth
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.bt.a2dp.aac_disable=true \
    vendor.bluetooth.soc=cherokee \
    persist.vendor.btstack.enable.splita2dp=true \
    persist.vendor.btstack.a2dp_offload_cap=sbc-aptx-aptxhd-aac

# CNE
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.vendor.cne.feature=1

# Camera
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    vendor.camera.aux.packagelist=org.codeaurora.snapcam \
    persist.vendor.camera.privapp.list=org.codeaurora.snapcam \
    persist.camera.privapp.list=org.codeaurora.snapcam \
    persist.vendor.camera.preview.ubwc=0 \
    camera.aux.packagelist=com.hmdglobal.camera2,cameratest,com.evenwell.fqc,com.tools.alt,com.siui.android.camera \
    camera.hal1.packagelist=com.dw.btime \
    persist.camera.debug_img_exif=1 \
    persist.camera.awbdefine=1 \
    persist.vendor.camera.mctstuck.enable=1

# Data
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.vendor.use_data_netmgrd=true \
    persist.vendor.data.mode=concurrent \
    persist.data.df.dev_name=rmnet_usb0 \
    persist.data.tcp_rst_drop=true

# Display
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    debug.sf.recomputecrop=0
    debug.sf.enable_hwc_vds=1 \
    debug.sf.hw=1 \
    debug.sf.latch_unsignaled=1 \
    debug.gralloc.enable_fb_ubwc=1 \
    dalvik.vm.heapsize=36m \
    dev.pm.dyn_samplingrate=1 \
    persist.demo.hdmirotationlock=false \
    sdm.debug.disable_skip_validate=1 \
    vendor.display.enable_default_color_mode=1 \
    vendor.gralloc.enable_fb_ubwc=1 \
    vendor.display.disable_skip_validate=1

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.qualcomm.cabl=2 \
    ro.vendor.display.cabl=2 \
    debug.sf.disable_backpressure=1 \
    ro.surface_flinger.has_wide_color_display=false \
    ro.surface_flinger.has_HDR_display=false \
    ro.surface_flinger.use_color_management=false

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.hwui.texture_cache_size=72 \
    ro.hwui.layer_cache_size=48 \
    ro.hwui.r_buffer_cache_size=8 \
    ro.hwui.path_cache_size=32 \
    ro.hwui.gradient_cache_size=1 \
    ro.hwui.drop_shadow_cache_size=6 \
    ro.hwui.texture_cache_flushrate=0.4 \
    ro.hwui.text_small_cache_width=1024 \
    ro.hwui.text_small_cache_height=1024 \
    ro.hwui.text_large_cache_width=2048 \
    ro.hwui.text_large_cache_height=2048

# GPS
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.backup.ntpServer="0.pool.ntp.org" \
    persist.vendor.overlay.izat.optin=rro

# IMS
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.dbg.volte_avail_ovr=1 \
    persist.dbg.vt_avail_ovr=1 \
    persist.dbg.wfc_avail_ovr=1

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.stagefright.enable-player=true \
    media.stagefright.enable-http=true \
    media.stagefright.enable-aac=true \
    media.stagefright.enable-qcp=true \
    media.stagefright.enable-scan=true \
    mmp.enable.3g2=true \
    media.aac_51_output_enabled=true \
    mm.enable.smoothstreaming=true \
    vendor.mm.enable.qcom_parser=13623022 \
    persist.mm.enable.prefetch=true \
    media.stagefright.thumbnail.prefer_hw_codecs=true \
    vidc.enc.target_support_bframe=1 \
    vendor.vidc.enc.disable_bframes=1 \
    vendor.vidc.dec.enable.downscalar=0 \
    vidc.enc.dcvs.extra-buff-count=2

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
     media.settings.xml=/system/etc/media_profiles_vendor.xml

# Memory optimizations
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.vendor.qti.sys.fw.bservice_enable=true

# Netflix
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.netflix.bsp_rev=Q660-13149-1

# NFC
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.nfc.port=I2C

# OTG
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.sys.oem.otg_support=true

# Radio
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.radio.add_power_save=1 \
    ril.subscription.types=NV,RUIM \
    DEVICE_PROVISIONED=1 \
    ro.telephony.default_network=22,20 \
    telephony.lteOnCdmaDevice=1 \
    persist.radio.VT_CAM_INTERFACE=2 \
    persist.vendor.radio.atfwd.start=true \
    persist.vendor.radio.oem_socket=true \
    persist.radio.flexmap_type=nw_mode \
    persist.vendor.radio.lte_vrte_ltd=1 \
    persist.vendor.radio.cs_srv_type=1 \
    persist.radio.apm_sim_not_pwdn=1 \
    persist.vendor.radio.report_codec=1 \
    persist.radio.VT_HYBRID_ENABLE=1 \
    persist.rcs.supported=0 \
    persist.radio.qcom_ext_enable=true

# Sensors
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.vendor.sensors.dev_ori=false \
    ro.qti.sensors.dev_ori=false \
    ro.vendor.sensors.pmd=true \
    ro.vendor.sensors.sta_detect=true \
    ro.vendor.sensors.mot_detect=true

# Time
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.timed.enable=true

# UI
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    sys.use_fifo_ui=1

# WFD/WiFi
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.debug.wfd.enable=1 \
    persist.debug.coresight.config=stm-events \
    persist.sys.wfd.virtual=0 \
    persist.hwc.enable_vds=1 \
    ro.wifi.power.reduction=1
