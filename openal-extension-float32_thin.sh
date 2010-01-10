#!/bin/sh -x

SPEC="openal-extension-float32_thin.ads"

rm -f ${SPEC}.tmp || exit 1

cat ${SPEC}.0 >> ${SPEC}.tmp || exit 1
./openal-mkconst.lua openal_float32_1_1_const.dat >> ${SPEC}.tmp || exit 1

cat ${SPEC}.N >> ${SPEC}.tmp || exit 1
mv ${SPEC}.tmp ${SPEC} || exit 1
