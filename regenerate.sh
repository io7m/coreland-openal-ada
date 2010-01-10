#!/bin/sh

./openal-alc_thin.sh               || exit 1
./openal-extension-efx_thin.sh     || exit 1
./openal-extension-float32_thin.sh || exit 1
./openal-thin.sh                   || exit 1
