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

# AB OTA
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cp_system_other_odex=1

# Audio
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.config.vc_call_vol_steps=7 \
    ro.config.media_vol_steps=25

PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.audio.sdk.fluencetype=fluence \
    persist.vendor.audio.fluence.voicecall=true \
    persist.vendor.audio.fluence.voicerec=false \
    persist.vendor.audio.fluence.speaker=true \
    persist.sys.smartamp=1 \
    audio.offload.min.duration.secs=30 \
    audio.offload.video=false \
    audio.deep_buffer.media=true \
    ro.af.client_heap_size_kbyte=7168 \
    af.fast_track_multiplier=1

PRODUCT_PROPERTY_OVERRIDES += \
    vendor.audio_hal.period_size=192 \
    vendor.audio.tunnel.encode=false \
    persist.vendor.audio.ras.enabled=false \
    vendor.audio.offload.buffer.size.kb=64 \
    vendor.audio.offload.track.enable=true \
    vendor.voice.path.for.pcm.voip=true \
    vendor.audio.offload.multiaac.enable=true \
    vendor.audio.dolby.ds2.enabled=false \
    vendor.audio.dolby.ds2.hardbypass=false \
    vendor.audio.offload.multiple.enabled=false \
    vendor.audio.offload.passthrough=false \
    ro.vendor.audio.sdk.ssr=false \
    vendor.audio.offload.gapless.enabled=true \
    vendor.audio.safx.pbe.enabled=true \
    vendor.audio.parser.ip.buffer.size=262144 \
    vendor.audio.flac.sw.decoder.24bit=true \
    persist.vendor.bt.a2dp_offload_cap=sbc \
    vendor.audio.use.sw.alac.decoder=true \
    vendor.audio.use.sw.ape.decoder=true \
    vendor.audio.hw.aac.encoder=true \
    vendor.audio.noisy.broadcast.delay=600 \
    persist.vendor.audio.hifi.int_codec=true \
    vendor.audio.offload.pstimeout.secs=3 \
    persist.vendor.audio.hw.binder.size_kbyte=1024

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.bt_debug_log_enable=false \
    bt.max.hfpclient.connections=1 \
    persist.bt.a2dp.aac_disable=true \
    ro.bluetooth.emb_wp_mode=true \
    vendor.bluetooth.soc=cherokee \
    vendor.qcom.bluetooth.soc=cherokee \
    persist.vendor.btstack.enable.splita2dp=true \
    persist.vendor.btstack.a2dp_offload_cap=sbc-aptx-aptxhd-aac

PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.bt.splita2dp.44_1_war=false \
    persist.bt.enable.splita2dp=false \
    persist.vendor.bt.enable.splita2dp=true \
    persist.vendor.btstack.enable.splita2dp=true

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    camera.aux.packagelist=com.hmdglobal.camera2,cameratest,com.evenwell.fqc,com.tools.alt,com.siui.android.camera \
    camera.hal1.packagelist=com.dw.btime \
    persist.vendor.camera.preview.ubwc=0 \
    ro.camera.switch.anim.delay=300 \
    ro.camera.record.anim.delay=200 \
    persist.vendor.camera.fdvideo=1 \
    camera.panorama.quality=middle \
    vendor.camera.c2d.rotation=1 \
    persist.vendor.camera.ven_hdr=0 \
    camera.disable_zsl_mode=0 \
    vendor.camera.aux.packagelist=com.hmdglobal.camera2,com.evenwell.fqc,com.tools.alt,com.fihtdc.fap,org.codeaurora.snapcam

# CNE
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.cne.feature=1

# CPU
PRODUCT_PROPERTY_OVERRIDES += \
    dev.pm.dyn_samplingrate=1 \
    ro.vendor.qti.core_ctl_min_cpu=2 \
    ro.vendor.qti.core_ctl_max_cpu=4

# Display
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.recomputecrop=0 \
    debug.sf.enable_hwc_vds=1 \
    debug.sf.hw=1 \
    debug.sf.latch_unsignaled=1 \
    debug.gralloc.enable_fb_ubwc=1 \
    dalvik.vm.heapsize=36m \
    persist.demo.hdmirotationlock \
    vendor.display.enable_default_color_mode=1 \
    vendor.gralloc.enable_fb_ubwc=1 \
    sdm.debug.disable_skip_validate=1 \
    vendor.display.disable_skip_validate=1 \
    ro.qualcomm.cabl=2 \
    ro.vendor.display.cabl=2 \
    ro.opengles.version=196610

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapgrowthlimit=256m \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heapsize=512m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=512k \
    dalvik.vm.heapmaxfree=8m \
    ro.dalvik.vm.native.bridge=0

# DPM
PRODUCT_PROPERTY_OVERRIDES += \
    persist.env.fastdorm.enabled=true

# DRM
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true \
    ro.com.widevine.cachesize=16777216

# FRP
PRODUCT_PROPERTY_OVERRIDES += \
    ro.frp.pst=/dev/block/bootdevice/by-name/frp

# IMS
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.dbg.volte_avail_ovr=1 \
    persist.dbg.vt_avail_ovr=1 \
    persist.dbg.wfc_avail_ovr=1

PRODUCT_PROPERTY_OVERRIDES += \
    persist.ims.enableADBLogs=1 \
    persist.ims.enableDebugLogs=1 \
    persist.data.iwlan.enable=true

# Media
#PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
#     media.settings.xml=/system/etc/media_profiles_vendor.xml

PRODUCT_PROPERTY_OVERRIDES += \
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
    vidc.enc.target_support_bframe=1 \
    vendor.vidc.enc.disable_bframes=1 \
    vendor.vidc.dec.enable.downscalar=0 \
    vendor.vidc.enc.disable.pq=false \
    vidc.enc.dcvs.extra-buff-count=2 \

# Memory optimizations
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.vendor.qti.sys.fw.bservice_enable=true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.qti.sys.fw.bg_apps_limit=60

# Netflix
PRODUCT_PROPERTY_OVERRIDES += \
    ro.netflix.bsp_rev=Q660-13149-1

# NFC
PRODUCT_PROPERTY_OVERRIDES += \
    ro.nfc.port=I2C \
    persist.nfc.smartcard.config=SIM1

# OTG
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.sys.oem.otg_support=true

# Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.at_library=libqti-at.so \
    ro.vendor.extension_library=libqti-perfd-client.so

# Radio
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.radio.add_power_save=1

PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.radio.oem_socket=true \
    persist.data.tcp_rst_drop=true \
    persist.radio.flexmap_type=nw_mode \
    ro.telephony.default_network=22,22 \
    persist.vendor.radio.lte_vrte_ltd=1 \
    persist.vendor.radio.cs_srv_type=1 \
    persist.radio.apm_sim_not_pwdn=1 \
    persist.vendor.radio.report_codec=1 \
    rild.libpath=/system/vendor/lib64/libril-qc-qmi-1.so \
    ril.subscription.types=NV,RUIM \
    DEVICE_PROVISIONED=1 \
    ro.vendor.use_data_netmgrd=true \
    persist.vendor.data.mode=concurrent \
    telephony.lteOnCdmaDevice=1 \
    persist.data.df.dev_name=rmnet_usb0 \
    persist.radio.VT_CAM_INTERFACE=2 \
    persist.vendor.radio.atfwd.start=true

PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.radio.apm_sim_not_pwdn=1 \
    persist.vendor.radio.sib16_support=1 \
    persist.vendor.radio.custom_ecc=1 \
    persist.vendor.radio.rat_on=combine \
    persist.radio.multisim.config=dsds

# Sensors
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qti.sensors.dev_ori=false \
    ro.vendor.sensors.dev_ori=true \
    ro.vendor.sensors.pmd=true \
    ro.vendor.sensors.sta_detect=true \
    ro.vendor.sensors.mot_detect=true \
    ro.vendor.sensors.facing=false \
    ro.vendor.sensors.cmc=false \
    ro.vendor.sdk.sensors.gestures=false

# Shutdown
PRODUCT_PROPERTY_OVERRIDES += \
    sys.vendor.shutdown.waittime=500 \
    ro.build.shutdown_timeout=0

# UI
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    sys.use_fifo_ui=1

# WiFi
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.wifi_log_enable=false \
    ro.wifi.power.reduction=1

# WiFi Display
PRODUCT_PROPERTY_OVERRIDES += \
    persist.debug.wfd.enable=1 \
    persist.sys.wfd.virtual=0 \
    persist.hwc.enable_vds=1

# GOD KNOWS ABOUT THESE ONE
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.wbg.bt.service=false \
    persist.sys.wbg.bt=btstop \
    persist.timed.enable=true \
    persist.vendor.overlay.izat.optin=rro \
    vendor.video.disable.ubwc=1
