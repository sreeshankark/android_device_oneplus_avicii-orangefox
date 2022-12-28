#!/system/bin/sh
#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2022 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#

# the recovery log
LOGF=/tmp/recovery.log;

# Deal with situations where the ROM doesn't support wrappedkey encryption;
# In such cases, remove the wrappedkey flag from the fstab file

# file_getprop <file> <property>
file_getprop() {
  local F=$(grep -m1 "^$2=" "$1" | cut -d= -f2);
  echo $F | sed 's/ *$//g';
}
# NOTE: this function is hard-coded for a handful of ROMs which, at the time of writing this script, 
# did not support wrappedkey; if any of them starts supporting wrappedkey, the function will need to be amended
fix_unwrap_decryption() {
local D=/FFiles/temp/system_prop;
local S=/dev/block/bootdevice/by-name/system;
local F=/FFiles/temp/system-build.prop;
local found=0;
    cd /FFiles/temp/;
    mkdir -p $D;
    mount -r $S $D;
    cp $D/system/build.prop $F;
    umount $D;
    rmdir $D;

    [ ! -e $F ] && {
    	echo "$F does not exist. Quitting." >> $LOGF;
    	return;
    }

    # check the ROM's SDK for >= A13
    local SDK=$(file_getprop "$F" "ro.build.version.sdk");
    [ -z "$SDK" ] && SDK=$(file_getprop "$F" "ro.system.build.version.sdk");
    [ -z "$SDK" ] && SDK=$(file_getprop "$F" "ro.vendor.build.version.sdk");

    # assume for the moment that no A13 ROM supports wrappedkey
    if [ -n "$SDK" -a $SDK -ge 33 ]; then
	found=1;
	echo "I:OrangeFox: ROM SDK=$SDK" >> $LOGF;
    fi

    # avicii A12 ROMs that don't support wrappedkey (as of the date of writing this script)
    if [ -n "$(grep pixys_avicii $F)" ]; then
    	found=1;
    fi

    if [ "$found" = "1" ]; then
       local wrap0=$(grep "/userdata" "/system/etc/recovery.fstab" | grep "wrappedkey_v0"); # check for FBEv2 wrappedkey_v0, and skip, if found
       if [ -z "$wrap0" ]; then
       	  echo "I:OrangeFox: This ROM does not support wrappedkey. Removing the wrappedkey flags from the fstab" >> $LOGF;
       	  sed -i -e "s/,wrappedkey//g" /system/etc/recovery.fstab;
       fi
    elif [ "$found" = "0" ]; then
       echo "I:OrangeFox: This ROM supports wrappedkey. Continuing with the default fstab" >> $LOGF;
    fi

    # cleanup
    rm $F;
}



# ---
#echo "I:OrangeFox: running $0" >> $LOGF;
V=$(getprop "ro.orangefox.variant");

[ "$V" = "FBEv1" ];

fix_unwrap_decryption;

[ "$V" != "FBEv1" ];
exit 0;
