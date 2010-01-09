#!/bin/sh -x

rm -f openal-thin.ads.tmp || exit 1

cat openal-thin.ads.0 >> openal-thin.ads.tmp || exit 1
./openal-mkconst.lua openal_const.dat >> openal-thin.ads.tmp || exit 1

echo >> openal-thin.ads.tmp || exit 1
./block-comment 'OpenAL 1.1' >> openal-thin.ads.tmp || exit 1
./openal-mkapi.lua     \
  "al"                 \
  openal_1_1_types.dat \
  openal_1_1_names.dat \
  openal_types.dat     \
  "imports" >> openal-thin.ads.tmp || exit 1

cat openal-thin.ads.N >> openal-thin.ads.tmp || exit 1
mv openal-thin.ads.tmp openal-thin.ads || exit 1
