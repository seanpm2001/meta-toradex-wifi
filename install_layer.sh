#!/bin/bash

echo 'BBLAYERS += " ${TOPDIR}/../layers/meta-toradex-wifi"' >> $BBPATH/conf/bblayers.conf
echo 'INHERIT += "toradex-wifi-nxp-proprietary-driver"' >> $BBPATH/conf/auto.conf
echo 'NXP_PROPRIETARY_DRIVER_LOCATION = "file:///${TOPDIR}/../wifi-archive"' >> $BBPATH/conf/auto.conf

cat << EOF >> $BBPATH/conf/auto.conf

NXP_PROPRIETARY_DRIVER_FILENAME:interface-diversity-pcie-usb = "NXP_L-PCIE-WLAN-USB-BT-8997-U16-X86-W16.88.21.p84.6-16.26.21.p84.6-MXM5X16391.p4-MGPL.zip"
NXP_PROPRIETARY_DRIVER_SHA256:interface-diversity-pcie-usb="a4a4a20d1f829950d6f83eb5ca14813ffc76ab26ef388d1692359da7147a81bf"
NXP_PROPRIETARY_DRIVER_FILENAME:interface-diversity-sd-sd= "SD-WLAN-SD-BT-8997-U16-MMC-W16.68.21.p84.6-16.26.21.p84.6-MXM5X16391.p4-MGPL.zip"
NXP_PROPRIETARY_DRIVER_SHA256:interface-diversity-sd-sd="340d25606f5cb04b33ca20f652c4ef71149efe6937504b55ad74cdc158ce8d0f"
NXP_PROPRIETARY_DRIVER_FILENAME:interface-diversity-sd-uart= "SD-WLAN-UART-BT-8997-LNX_6_1_1-IMX8-16.92.21.p76.2-16.92.21.p76.2-MM5X16368.P2-MGPL.zip"
NXP_PROPRIETARY_DRIVER_SHA256:interface-diversity-sd-uart="736cb8118f1251535e207452cde36dc581a5bdb2934581041dbf1328ec1cca1b"
NXP_PROPRIETARY_MFG_TOOL_FILENAME="MFG-W8997-MF-LABTOOL-ANDROID-1.1.0.188.0-16.80.205.p208.zip"
NXP_PROPRIETARY_MFG_TOOL_SHA256="599031b9040c3a501f656a30f85308b9a1929ed5d1f7c40f14c370298f8ba8f9"
EOF

echo 'MACHINEOVERRIDES =. "default-nxp-proprietary-driver:"' >> $BBPATH/conf/local.conf
echo '#MACHINEOVERRIDES =. "mfg-mode:"' >> $BBPATH/conf/local.conf
