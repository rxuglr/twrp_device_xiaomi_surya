#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2020-2021 The OrangeFox Recovery Project
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
    export FOX_VARIANT="A12"
    export FOX_REPLACE_BUSYBOX_PS=1
    export FOX_USE_TAR_BINARY=1
    export FOX_REPLACE_TOOLBOX_GETPROP=1
    export FOX_USE_NANO_EDITOR=1
    export OF_USE_MAGISKBOOT=1
    export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
    export OF_KEEP_DM_VERITY_FORCED_ENCRYPTION=1
    export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
    export FOX_DELETE_AROMAFM=1
    export OF_FLASHLIGHT_ENABLE=1
    export OF_MAINTAINER="rxuglr"
    export OF_SCREEN_H=2400
    export OF_STATUS_INDENT_LEFT=48
    export OF_STATUS_INDENT_RIGHT=48
    export OF_CLOCK_POS=1
    export OF_ALLOW_DISABLE_NAVBAR=0
    export FOX_BUGGED_AOSP_ARB_WORKAROUND="1546300800"; # Tuesday, January 1, 2019 12:00:00 AM GMT+00:00
    export TARGET_DEVICE_ALT="karna"
    export OF_TARGET_DEVICES="surya,karna"
    export FOX_REMOVE_AAPT=1
    export OF_CHECK_OVERWRITE_ATTEMPTS=1
    export OF_FBE_METADATA_MOUNT_IGNORE=0
    export OF_PATCH_AVB20=1
    export OF_SKIP_MULTIUSER_FOLDERS_BACKUP=1
    export OF_SUPPORT_ALL_BLOCK_OTA_UPDATES=1
    export OF_DISABLE_MIUI_OTA_BY_DEFAULT=1
    export FOX_DISABLE_APP_MANAGER=1
    export FOX_USE_XZ_UTILS=1
    export OF_IGNORE_LOGICAL_MOUNT_ERRORS=1
    export TW_DEFAULT_LANGUAGE="en"
    export LC_ALL="C"
    export ALLOW_MISSING_DEPENDENCIES=true
    export OF_NO_MIUI_PATCH_WARNING=1
    export OF_NO_SAMSUNG_SPECIAL=1
    export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
    export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
    export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
    export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"
    export OF_QUICK_BACKUP_LIST="/boot;/data;"

    # OTA
    export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1

	# maximum permissible splash image size (in kilobytes); do *NOT* increase!
	export OF_SPLASH_MAX_SIZE=130

	# run a process after formatting data to recreate /data/media/0 (only when forced-encryption is being disabled)
	export OF_RUN_POST_FORMAT_PROCESS=1

	# ensure that /sdcard is bind-unmounted before f2fs data repair or format (required for FBE v1)
	export OF_UNBIND_SDCARD_F2FS=1

	# let's see what are our build VARs
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
  	   export | grep "FOX" >> $FOX_BUILD_LOG_FILE
  	   export | grep "OF_" >> $FOX_BUILD_LOG_FILE
   	   export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TW_" >> $FOX_BUILD_LOG_FILE
 	fi