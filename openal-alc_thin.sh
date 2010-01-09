#!/bin/sh -x

rm -f openal-alc_thin.ads.tmp || exit 1

cat openal-alc_thin.ads.0 >> openal-alc_thin.ads.tmp || exit 1
./openal-mkconst.lua openalc_const.dat >> openal-alc_thin.ads.tmp || exit 1
cat openal-alc_thin.ads.1 >> openal-alc_thin.ads.tmp || exit 1

./block-comment 'OpenALC 1.1' >> openal-alc_thin.ads.tmp || exit 1
./openal-mkapi.lua      \
  "alc"                 \
  openalc_1_1_types.dat \
  openalc_1_1_names.dat \
  openalc_types.dat     \
  "imports" >> openal-alc_thin.ads.tmp || exit 1

cat openal-alc_thin.ads.N >> openal-alc_thin.ads.tmp || exit 1
mv openal-alc_thin.ads.tmp openal-alc_thin.ads || exit 1
