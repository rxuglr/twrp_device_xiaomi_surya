#!/system/bin/sh
#
# This script is needed to support wrappedkey and fbe v2
# Version: 1.1
# Date : 2022/12/03
# Author : brigudav
# strings fixed by rxuglr
#

reclog=/tmp/recovery.log
tmpv=/tmp/vendor_fstab
fstabd=$tmpv/etc/fstab.default
fstabq=$tmpv/etc/fstab.qcom
fstabr=/system/etc/recovery.fstab

send_log() {
	echo "I:$1" >> $reclog
}

finish() {
	sleep 1
	umount $tmpv || true
	rmdir $tmpv
	exit 1
}

patch_fstab() {
	mkdir -p $tmpv
	mount -o ro -t auto /dev/block/mapper/vendor $tmpv || true

	for i in $fstabq $fstabd; do
		if [ -f $i ]; then
		send_log "Find $i"
			if [[ ! $(grep "/userdata" $i | grep ":v2") = "" ]]; then
				send_log "FBE v2 support found..."
				finish
			else
				send_log "Enabling FBE v1 support..."
				cp $fstabr.bak $fstabr
				if [[ ! $(grep "/userdata" $i | grep wrappedkey) = "" ]]; then
					send_log "...and enabling wrappedkey."
					sed -i -e "s/formattable/formattable,wrappedkey/g" $fstabr
				fi
				finish
			fi
		fi
	done
}

n=1
while [ $n -le 2 ]; do
	patch_fstab
sleep 1
done

exit 0
