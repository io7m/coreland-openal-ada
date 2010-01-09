#!/bin/sh -x

SPEC="openal-extension-efx_thin.ads"
BODY="openal-extension-efx_thin.adb"

#
# Generate spec.
#

rm -f "${SPEC}".tmp || exit 1

cat "${SPEC}".0 >> "${SPEC}".tmp || exit 1
./openal-mkconst.lua openal_efx_1_1_const.dat >> "${SPEC}".tmp || exit 1

echo >> "${SPEC}".tmp || exit 1
./block-comment 'OpenAL EFX' >> "${SPEC}".tmp || exit 1
./openal-mkapi.lua         \
  "al"                     \
  openal_efx_1_1_types.dat \
  openal_efx_1_1_names.dat \
  openal_types.dat         \
  "dynamic" >> "${SPEC}".tmp || exit 1

./block-comment 'Record type for API pointers' >> "${SPEC}".tmp || exit 1
./openal-mkapi.lua         \
  "al"                     \
  openal_efx_1_1_types.dat \
  openal_efx_1_1_names.dat \
  openal_types.dat         \
  "api_record" >> "${SPEC}".tmp || exit 1

cat "${SPEC}".N >> "${SPEC}".tmp || exit 1
mv "${SPEC}".tmp "${SPEC}" || exit 1

#
# Generate body.
#

rm -f "${BODY}".tmp || exit 1

cat "${BODY}".0 >> "${BODY}".tmp || exit 1

./block-comment 'Load function for API pointers' >> "${BODY}".tmp || exit 1
./openal-mkapi.lua         \
  "al"                     \
  openal_efx_1_1_types.dat \
  openal_efx_1_1_names.dat \
  openal_types.dat         \
  "api_load" >> "${BODY}".tmp || exit 1

cat "${BODY}".N >> "${BODY}".tmp || exit 1
mv "${BODY}".tmp "${BODY}" || exit 1
