#!/vendor/bin/sh

echo "Set dwc3 controller on"
echo on > /sys/devices/platform/simple_usb_bus/a200000.usb3/power/control
cat /sys/devices/platform/simple_usb_bus/a200000.usb3/power/control

echo "Dump dwc3 controller registers"
mount -t debugfs none /d
cat /d/usb/a210000.dwc3/regdump

echo auto > /sys/devices/platform/simple_usb_bus/a200000.usb3/power/control