DIR='./single-stream/'
STREAMS=$(ls -1D ${DIR}*)

# NOTE: I don't think these actually do anything...
# This info is in the stream file
STREAM_BRIGHTNESS="100"
PARAM="--led-cols=64 --led-rows=64 --led-gpio-mapping=adafruit-hat "
NUM_LOOPS="5000"
# 3 mins = 180
# 5 mins = 300
# 10 mins = 600
#TIMEOUT="300" # Seconds
TIMEOUT="15" # Seconds
 
 

# Make sure we can access shit
sudo chmod 777 $DIR -R
 
# See how many files there are
NUM_FILES=$(ls -1 ${DIR}* | wc -l)
NUM_SECS=$(($TIMEOUT * $NUM_FILES))
NUM_MINS=$(($NUM_SECS / 60))
echo "These images will loop after $NUM_MINS minutes"
echo "Playing..."
echo ""
 
sudo ./led-image-viewer $PARAM -l $NUM_LOOPS --led-brightness=${STREAM_BRIGHTNESS} -t ${TIMEOUT} -f -s $STREAMS >/dev/n    ull 2>&1
