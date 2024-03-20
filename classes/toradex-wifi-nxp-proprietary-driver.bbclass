#
# Settings for using the NXP proprietary driver with Toradex BSP builds.
#
# Usage:
#   Inherit this class
#   Add overrides to add features:
#       MACHINEOVERRIDES =. "mfg-mode:"
#       MACHINEOVERRIDES =. "default-nxp-proprietary-driver:"
#


MACHINEOVERRIDES:prepend:colibri-imx6ull = "interface-diversity-sd-sd:"
MACHINEOVERRIDES:prepend:colibri-imx8x = "interface-diversity-pcie-usb:"
MACHINEOVERRIDES:prepend:verdin-imx8mm = "interface-diversity-sd-sd:"
MACHINEOVERRIDES:prepend:verdin-imx8mp = "interface-diversity-sd-uart:"
MACHINEOVERRIDES:prepend:apalis-imx8 = "interface-diversity-pcie-usb:"

MACHINE_EXTRA_RDEPENDS:append:interface-diversity-sd-uart = " \
    kernel-module-mlan \
    kernel-module-moal \
    kernel-module-wifimrvl \
    nxp-wifi-bt-firmware \
    toradex-wifi-config \
"

MACHINE_EXTRA_RDEPENDS:append:interface-diversity-sd-sd = " \
    kernel-module-mlan \
    kernel-module-btmrvl \
    kernel-module-btxxx \
    kernel-module-sdxxx \
    kernel-module-wifimrvl \
    nxp-wifi-bt-firmware \
    toradex-wifi-config \
"

MACHINE_EXTRA_RDEPENDS:append:interface-diversity-pcie-usb = " \
    kernel-module-mlan \
    kernel-module-pciexxx \
    kernel-module-btxxx \
    kernel-module-wifimrvl \
    kernel-module-btmrvl \
    nxp-wifi-bt-firmware \
    toradex-wifi-config \
"

IMAGE_INSTALL:append:mfg-mode = " labtool "

addhandler toradex_wifi_sanity_handler
toradex_wifi_sanity_handler[eventmask] = "bb.event.ParseCompleted"
python toradex_wifi_sanity_handler() {
  if "mfg-mode:" in d.getVar('OVERRIDES') and "default-nxp-proprietary-driver:" not in d.getVar('OVERRIDES'):
    bb.fatal("Building for Wi-Fi manufacturing mode requires using the NXP proprietary driver as the default.")
}

# Default value for parsing. This will need to be overridden by the user.
NXP_PROPRIETARY_DRIVER_LOCATION ??= "http://example.com"
