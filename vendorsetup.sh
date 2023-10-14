#
# Copyright (C) 2022 The OrangeFox Recovery Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
	export FDEVICE="avicii"
   	export TW_DEFAULT_LANGUAGE="en"
	export LC_ALL="C"
	export FOX_DEVICE="avicii"
	export FOF_AB_DEVICE_WITH_RECOVERY_PARTITION=1
 	export ALLOW_MISSING_DEPENDENCIES=true
	export FOF_AB_DEVICE=1
	export TARGET_DEVICE_ALT="Nord,oneplusnord,OnePlusNord,OneplusNord,OnePlusnord,Oneplusnord,nord,AC2001,AC2003,OnePlus Nord"
	export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
	export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"
	export OF_USE_GREEN_LED=0
	export OF_IGNORE_LOGICAL_MOUNT_ERRORS=1
	export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
	export FOX_REPLACE_TOOLBOX_GETPROP=1
	export OF_FBE_METADATA_MOUNT_IGNORE=1

	export OF_USE_MAGISKBOOT=1
	export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
	export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
	export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
	export OF_NO_MIUI_PATCH_WARNING=1
	export FOX_USE_BASH_SHELL=1
	export OF_PATCH_AVB20=1
	export FOX_ASH_IS_BASH=1
	export FOX_USE_TAR_BINARY=1
	export FOX_USE_SED_BINARY=1
	export FOX_USE_XZ_UTILS=1
    	export OF_QUICK_BACKUP_LIST="/boot;/data;"
    	export FOX_DELETE_AROMAFM=1
    	export FOX_USE_BASH_SHELL=1
	export FOX_ASH_IS_BASH=1
	export FOX_USE_TAR_BINARY=1
	export FOX_USE_SED_BINARY=1
	export FOX_USE_XZ_UTILS=1
	export OF_ENABLE_LPTOOLS=1
    	export FOX_BUGGED_AOSP_ARB_WORKAROUND="1601559499"
    	export FOX_ENABLE_APP_MANAGER=1
    	export FOX_USE_NANO_EDITOR=1
    	
    	# ensure that /sdcard is bind-unmounted before f2fs data repair or format (required for FBE v1)
	export OF_UNBIND_SDCARD_F2FS=1
         
	# OTA
	export OF_KEEP_DM_VERITY=1
	export OF_SUPPORT_ALL_BLOCK_OTA_UPDATES=1
	export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1
	export OF_DISABLE_MIUI_OTA_BY_DEFAULT=1
	export OF_SUPPORT_ALL_BLOCK_OTA_UPDATES=0
    	
    	# OTA for custom ROMs
	export OF_SUPPORT_ALL_PAYLOAD_OTA_UPDATES=1
	export OF_SUPPORT_ALL_BLOCK_OTA_UPDATES=1
	export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1

	# Screen Settings
	export OF_SCREEN_H=2400
	export OF_STATUS_H=144
	export OF_STATUS_INDENT_LEFT=275
	export OF_STATUS_INDENT_RIGHT=48
	export OF_ALLOW_DISABLE_NAVBAR=0
	export OF_CLOCK_POS=1
	
	# R11.1 Settings
	export FOX_VERSION="R12.1_1"
	export OF_MAINTAINER="Gonçalo Duarye"	  
