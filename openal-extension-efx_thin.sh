#!/bin/sh -x

rm -f openal-extension-efx_thin.ads.tmp || exit 1

cat openal-extension-efx_thin.ads.0 >> openal-extension-efx_thin.ads.tmp || exit 1

./openal-mkconst.lua openal_efx_1_1_const.dat >> openal-extension-efx_thin.ads.tmp || exit 1

echo >> openal-extension-efx_thin.ads.tmp || exit 1
./block-comment 'OpenAL EFX' >> openal-extension-efx_thin.ads.tmp || exit 1
./openal-mkapi.lua "al" openal_efx_1_1_types.dat openal_efx_1_1_names.dat openal_types.dat >> openal-extension-efx_thin.ads.tmp || exit 1

cat openal-extension-efx_thin.ads.N >> openal-extension-efx_thin.ads.tmp || exit 1

mv openal-extension-efx_thin.ads.tmp openal-extension-efx_thin.ads || exit 1
