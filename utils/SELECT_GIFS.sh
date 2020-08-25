#!/bin/bash
#DIR='/home/dietpi/src/rpi-rgb-led-matrix/utils/gifs/64x64/'
DIR='/home/dietpi/customgifs2/'
PARAM="--led-cols=64 --led-rows=64 --led-gpio-mapping=adafruit-hat "
GIFS=$(ls -1 ${DIR})
STREAM_PARAMS="--led-brightness=100 -l 1"

rm SELECTED_GIFS

for FILE in ${GIFS//\\n/ }; do
	echo $FILE
	echo "Playing ${DIR}${FILE}..."
	sudo ./led-image-viewer -l 2 $PARAM ${DIR}${FILE} >/dev/null 2>&1


	read -p "Select this gif to convert later (y/n)?" CONT
	if [ "$CONT" = "y" ]; then
		echo 'Selecting!'
		echo ${DIR}${FILE} >> ./SELECTED_GIFS
		sudo ./led-image-viewer $PARAM $STREAM_PARAMS ${DIR}${FILE} -O /tmp/${FILE}.stream
	fi

	echo
	echo
done
