#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)
DIR_NAME=`echo "$SCRIPT_DIR" | sed -e 's/.*\/\([^\/]*\)$/\1/'`

if [ $DIR_NAME -eq "05m" || $DIR_NAME -eq "10m" ]
then
	mkdir -p ./first/left ./first/center ./first/right
	mkdir -p ./second/left ./second/center ./second/right
	mkdir -p ./third/left ./third/center ./third/right
else
	echo "plz move dir"
	exit 0
fi

for th in "first" "seconde" "third"
do
	for where in "left" "center" "right"
	do
		for num in 1 2 3 4 5 6 7 8 9 10 11 12
		do
			flag=0
			until [ $flag -eq 0 ]
			do
				echo "wait enter key..."
				read Wait
				printf '\a' # arert!
				# timeout -sKILL 2 rosbag record /canera1/image_color /camera2/image_color /k4a/body_tracking_data_sync /k4a/depth_to_rgb/image_raw /k4a/rgb/image_raw /tf /tf_static -O ./${th}/${where}/${num}.bag
			
				echo "Snap done"
				echo "next snap ok? y/n"
				read NEXT
				
				if [ $NEXT -eq "y" ]
				then
					echo "OK! next!"
					flag=0
				elif [ $NEXT -eq "n"]
					echo "ok one more"
					$flag=1
				fi
			done
		done
	done
done

echo "all snap end! ty"
