#! /system/bin/sh

if [ -d /persist/factory/regulatory ]; then
  # upgrade products PATH
  SRC_PATH="/persist/factory/regulatory"
else
  # NPI products PATH
  SRC_PATH="/mnt/product/persist/elabel"
fi

if [ ! -f /data/misc/elabel/elabels_copied ]; then
     cp "$SRC_PATH"/* /data/misc/elabel/
     echo 1 > /data/misc/elabel/elabels_copied
     chown system.system /data/misc/elabel/*
     chmod 444 /data/misc/elabel/*
fi
