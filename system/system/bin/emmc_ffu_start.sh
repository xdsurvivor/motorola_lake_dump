#!/system/bin/sh
#
# Copyright (c) 2013-2015, Motorola LLC  All rights reserved.
#

SCRIPT=${0#/system/bin/}

# Flash the firmware
echo "Starting upgrade..." > /dev/kmsg
sync
/system/bin/emmc_ffu -yR

STATUS=$?

if [ "$STATUS" != "0" ] ; then
  echo "Result: FAIL"
  echo "$SCRIPT: firmware update failed ($STATUS)" > /dev/kmsg
  exit
fi

echo "Result: PASS"
echo "$SCRIPT: firmware updated successfully" > /dev/kmsg
