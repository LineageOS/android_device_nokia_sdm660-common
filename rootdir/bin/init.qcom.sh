#! /vendor/bin/sh

# Copyright (c) 2009-2016, The Linux Foundation. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of The Linux Foundation nor
#       the names of its contributors may be used to endorse or promote
#       products derived from this software without specific prior written
#       permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NON-INFRINGEMENT ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

target=`getprop ro.board.platform`
start_msm_irqbalance660()
{
	if [ -f /vendor/bin/msm_irqbalance ]; then
		case "$platformid" in
		    "317" | "321" | "324" | "325" | "326" | "336" | "345" | "346" | "360" | "393")
			start vendor.msm_irqbalance;;
		    "318" | "327" | "385")
			start vendor.msm_irqbl_sdm630;;
		esac
	fi
}

case "$target" in
    "sdm660")
        if [ -f /sys/devices/soc0/soc_id ]; then
             soc_id=`cat /sys/devices/soc0/soc_id`
        else
             soc_id=`cat /sys/devices/system/soc/soc0/id`
        fi

        if [ -f /sys/devices/soc0/hw_platform ]; then
             hw_platform=`cat /sys/devices/soc0/hw_platform`
        else
             hw_platform=`cat /sys/devices/system/soc/soc0/hw_platform`
        fi
        start_msm_irqbalance660
        ;;
esac

#
# Make modem config folder and copy firmware config to that folder for RIL
#
if [ -f /data/vendor/modem_config/ver_info.txt ]; then
    prev_version_info=`cat /data/vendor/modem_config/ver_info.txt`
else
    prev_version_info=""
fi

chmod g+w -R /data/vendor/fih_atl/*
chmod g+w -R /data/vendor/fih_mcfg/*

cur_version_info=`cat /vendor/firmware_mnt/verinfo/ver_info.txt`
if [ ! -f /vendor/firmware_mnt/verinfo/ver_info.txt -o "$prev_version_info" != "$cur_version_info" ]; then
    # add W for group recursively before delete
    chmod g+w -R /data/vendor/modem_config/*
    rm -rf /data/vendor/modem_config/*
    # preserve the read only mode for all subdir and files
    cp --preserve=m -dr /vendor/firmware_mnt/image/modem_pr/mcfg/configs/* /data/vendor/modem_config
    cp --preserve=m -d /vendor/firmware_mnt/verinfo/ver_info.txt /data/vendor/modem_config/
    cp --preserve=m -d /vendor/firmware_mnt/image/modem_pr/mbn_ota.txt /data/vendor/modem_config/
    # the group must be root, otherwise this script could not add "W" for group recursively
    chown -hR radio.root /data/vendor/modem_config/*
    # add W for group recursively before delete
    setprop persist.vendor.radio.nokia_fih_mcfg 0
    chmod g+w -R /data/vendor/fih_atl/modem_config/*
    rm -rf /data/vendor/fih_atl/modem_config/*
    # preserve the read only mode for all subdir and files
    cp -dr /vendor/firmware_mnt/image/modem_pr/mcfg/configs/* /data/vendor/fih_atl/modem_config
    cp -d /vendor/firmware_mnt/verinfo/ver_info.txt /data/vendor/fih_mcfg/ver_info.txt
    cp -d /vendor/firmware_mnt/image/modem_pr/mbn_ota.txt /data/vendor/fih_mcfg/modem_config/
fi
chmod g-w /data/vendor/modem_config
setprop ro.vendor.ril.mbn_copy_completed 1

setprop persist.vendor.radio.nokia_fih_mcfg 1

# FIH ATL
chmod 776 -R /data/vendor/fih_atl
chown system.vendor_rfs -R /data/vendor/fih_atl
chown radio.vendor_rfs /data/vendor/fih_mcfg/ver_info.txt
chown system.vendor_rfs /data/vendor/fih_mcfg
