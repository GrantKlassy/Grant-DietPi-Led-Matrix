#!/bin/bash

STREAM_BRIGHTNESS="100"
PARAM="--led-cols=64 --led-rows=64 --led-gpio-mapping=adafruit-hat "
NUM_LOOPS="5"
TIMEOUT="5" # Minutes

DIR='./NEW_GIFS/'
SELECTED=$(ls -1D ${DIR}*)

sudo rm /tmp/*.stream

for FILE in $SELECTED; do


	echo $FILE
	BASENAME=$(basename $FILE)
	STREAMNAME=$(basename $FILE .gif)

	echo "Converting $STREAMNAME..."
	sudo ./led-image-viewer --led-brightness=${STREAM_BRIGHTNESS} -l ${NUM_LOOPS} $PARAM ${FILE} \
		-O /tmp/$STREAMNAME.stream >/dev/null 2>&1



done

sudo mv /tmp/*.stream ./streams-100/
