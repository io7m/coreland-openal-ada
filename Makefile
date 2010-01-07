# auto generated - do not edit

default: all

all:\
UNIT_TESTS/buffers_001 UNIT_TESTS/buffers_001.ali UNIT_TESTS/buffers_001.o \
UNIT_TESTS/init_001 UNIT_TESTS/init_001.ali UNIT_TESTS/init_001.o \
UNIT_TESTS/init_002 UNIT_TESTS/init_002.ali UNIT_TESTS/init_002.o \
UNIT_TESTS/init_003 UNIT_TESTS/init_003.ali UNIT_TESTS/init_003.o \
UNIT_TESTS/sources_001 UNIT_TESTS/sources_001.ali UNIT_TESTS/sources_001.o \
UNIT_TESTS/test.a UNIT_TESTS/test.ali UNIT_TESTS/test.o openal-alc_thin.ali \
openal-alc_thin.o openal-buffer.ali openal-buffer.o openal-context-capture.ali \
openal-context-capture.o openal-context-error.ali openal-context-error.o \
openal-context.ali openal-context.o openal-error.ali openal-error.o \
openal-global.ali openal-global.o openal-listener.ali openal-listener.o \
openal-source.ali openal-source.o openal-thin.ali openal-thin.o \
openal-types.ali openal-types.o openal.a openal.ali openal.o

# Mkf-test
tests:
	(cd UNIT_TESTS && make)
tests_clean:
	(cd UNIT_TESTS && make clean)

UNIT_TESTS/buffers_001:\
ada-bind ada-link UNIT_TESTS/buffers_001.ald UNIT_TESTS/buffers_001.ali \
UNIT_TESTS/test.ali openal.a
	./ada-bind UNIT_TESTS/buffers_001.ali
	./ada-link UNIT_TESTS/buffers_001 UNIT_TESTS/buffers_001.ali openal.a

UNIT_TESTS/buffers_001.o UNIT_TESTS/buffers_001.ali:\
ada-compile UNIT_TESTS/buffers_001.adb openal-buffer.ali \
openal-context-error.ali openal-context.ali UNIT_TESTS/test.ali
	./ada-compile UNIT_TESTS/buffers_001.adb

UNIT_TESTS/init_001:\
ada-bind ada-link UNIT_TESTS/init_001.ald UNIT_TESTS/init_001.ali \
UNIT_TESTS/test.ali openal.a
	./ada-bind UNIT_TESTS/init_001.ali
	./ada-link UNIT_TESTS/init_001 UNIT_TESTS/init_001.ali openal.a

UNIT_TESTS/init_001.o UNIT_TESTS/init_001.ali:\
ada-compile UNIT_TESTS/init_001.adb UNIT_TESTS/test.ali openal-context.ali \
openal-context-error.ali
	./ada-compile UNIT_TESTS/init_001.adb

UNIT_TESTS/init_002:\
ada-bind ada-link UNIT_TESTS/init_002.ald UNIT_TESTS/init_002.ali \
UNIT_TESTS/test.ali openal.a
	./ada-bind UNIT_TESTS/init_002.ali
	./ada-link UNIT_TESTS/init_002 UNIT_TESTS/init_002.ali openal.a

UNIT_TESTS/init_002.o UNIT_TESTS/init_002.ali:\
ada-compile UNIT_TESTS/init_002.adb UNIT_TESTS/test.ali openal-context.ali \
openal-context-error.ali
	./ada-compile UNIT_TESTS/init_002.adb

UNIT_TESTS/init_003:\
ada-bind ada-link UNIT_TESTS/init_003.ald UNIT_TESTS/init_003.ali \
UNIT_TESTS/test.ali openal.a
	./ada-bind UNIT_TESTS/init_003.ali
	./ada-link UNIT_TESTS/init_003 UNIT_TESTS/init_003.ali openal.a

UNIT_TESTS/init_003.o UNIT_TESTS/init_003.ali:\
ada-compile UNIT_TESTS/init_003.adb UNIT_TESTS/test.ali openal-context.ali \
openal-context-error.ali
	./ada-compile UNIT_TESTS/init_003.adb

UNIT_TESTS/sources_001:\
ada-bind ada-link UNIT_TESTS/sources_001.ald UNIT_TESTS/sources_001.ali \
UNIT_TESTS/test.ali openal.a
	./ada-bind UNIT_TESTS/sources_001.ali
	./ada-link UNIT_TESTS/sources_001 UNIT_TESTS/sources_001.ali openal.a

UNIT_TESTS/sources_001.o UNIT_TESTS/sources_001.ali:\
ada-compile UNIT_TESTS/sources_001.adb openal-buffer.ali \
openal-context-error.ali openal-context.ali UNIT_TESTS/test.ali
	./ada-compile UNIT_TESTS/sources_001.adb

UNIT_TESTS/test.a:\
cc-slib UNIT_TESTS/test.sld UNIT_TESTS/test.o
	./cc-slib UNIT_TESTS/test UNIT_TESTS/test.o

UNIT_TESTS/test.o UNIT_TESTS/test.ali:\
ada-compile UNIT_TESTS/test.adb UNIT_TESTS/test.ads
	./ada-compile UNIT_TESTS/test.adb

ada-bind:\
conf-adabind conf-systype conf-adatype conf-adafflist flags-cwd

ada-compile:\
conf-adacomp conf-adatype conf-systype conf-adacflags conf-adafflist flags-cwd

ada-link:\
conf-adalink conf-adatype conf-systype conf-aldfflist libs-openal

ada-srcmap:\
conf-adacomp conf-adatype conf-systype

ada-srcmap-all:\
ada-srcmap conf-adacomp conf-adatype conf-systype

cc-compile:\
conf-cc conf-cctype conf-systype

cc-link:\
conf-ld conf-ldtype conf-systype

cc-slib:\
conf-systype

conf-adatype:\
mk-adatype
	./mk-adatype > conf-adatype.tmp && mv conf-adatype.tmp conf-adatype

conf-cctype:\
conf-cc mk-cctype
	./mk-cctype > conf-cctype.tmp && mv conf-cctype.tmp conf-cctype

conf-ldtype:\
conf-ld mk-ldtype
	./mk-ldtype > conf-ldtype.tmp && mv conf-ldtype.tmp conf-ldtype

conf-systype:\
mk-systype
	./mk-systype > conf-systype.tmp && mv conf-systype.tmp conf-systype

mk-adatype:\
conf-adacomp conf-systype

mk-cctype:\
conf-cc conf-systype

mk-ctxt:\
mk-mk-ctxt
	./mk-mk-ctxt

mk-ldtype:\
conf-ld conf-systype conf-cctype

mk-mk-ctxt:\
conf-cc conf-ld

mk-systype:\
conf-cc conf-ld

openal-alc_thin.o openal-alc_thin.ali:\
ada-compile openal-alc_thin.ads openal-alc_thin.ads
	./ada-compile openal-alc_thin.ads

openal-buffer.ads:\
openal.ali openal-thin.ali openal-types.ali

openal-buffer.o openal-buffer.ali:\
ada-compile openal-buffer.adb openal.ali openal-buffer.ads
	./ada-compile openal-buffer.adb

openal-context-capture.ads:\
openal-context.ali openal-buffer.ali

openal-context-capture.o openal-context-capture.ali:\
ada-compile openal-context-capture.adb openal-context.ali \
openal-context-capture.ads openal-alc_thin.ali openal-thin.ali
	./ada-compile openal-context-capture.adb

openal-context-error.ads:\
openal-context.ali

openal-context-error.o openal-context-error.ali:\
ada-compile openal-context-error.adb openal-context.ali \
openal-context-error.ads openal-alc_thin.ali
	./ada-compile openal-context-error.adb

openal-context.ads:\
openal.ali openal-alc_thin.ali

openal-context.o openal-context.ali:\
ada-compile openal-context.adb openal.ali openal-context.ads
	./ada-compile openal-context.adb

openal-error.ads:\
openal.ali

openal-error.o openal-error.ali:\
ada-compile openal-error.adb openal.ali openal-error.ads openal-thin.ali
	./ada-compile openal-error.adb

openal-global.ads:\
openal.ali

openal-global.o openal-global.ali:\
ada-compile openal-global.adb openal.ali openal-global.ads
	./ada-compile openal-global.adb

openal-listener.ads:\
openal.ali openal-types.ali

openal-listener.o openal-listener.ali:\
ada-compile openal-listener.adb openal.ali openal-listener.ads openal-thin.ali
	./ada-compile openal-listener.adb

openal-source.ads:\
openal.ali openal-buffer.ali openal-types.ali

openal-source.o openal-source.ali:\
ada-compile openal-source.adb openal.ali openal-source.ads openal-thin.ali
	./ada-compile openal-source.adb

openal-thin.o openal-thin.ali:\
ada-compile openal-thin.ads openal.ali openal-thin.ads
	./ada-compile openal-thin.ads

openal-types.o openal-types.ali:\
ada-compile openal-types.ads openal.ali openal-types.ads openal-thin.ali
	./ada-compile openal-types.ads

openal.a:\
cc-slib openal.sld openal-alc_thin.o openal-buffer.o openal-context-capture.o \
openal-context-error.o openal-context.o openal-error.o openal-global.o \
openal-listener.o openal-source.o openal-thin.o openal-types.o openal.o
	./cc-slib openal openal-alc_thin.o openal-buffer.o openal-context-capture.o \
	openal-context-error.o openal-context.o openal-error.o openal-global.o \
	openal-listener.o openal-source.o openal-thin.o openal-types.o openal.o

openal.o openal.ali:\
ada-compile openal.ads openal.ads
	./ada-compile openal.ads

clean-all: tests_clean obj_clean ext_clean
clean: obj_clean
obj_clean:
	rm -f UNIT_TESTS/buffers_001 UNIT_TESTS/buffers_001.ali \
	UNIT_TESTS/buffers_001.o UNIT_TESTS/init_001 UNIT_TESTS/init_001.ali \
	UNIT_TESTS/init_001.o UNIT_TESTS/init_002 UNIT_TESTS/init_002.ali \
	UNIT_TESTS/init_002.o UNIT_TESTS/init_003 UNIT_TESTS/init_003.ali \
	UNIT_TESTS/init_003.o UNIT_TESTS/sources_001 UNIT_TESTS/sources_001.ali \
	UNIT_TESTS/sources_001.o UNIT_TESTS/test.a UNIT_TESTS/test.ali \
	UNIT_TESTS/test.o openal-alc_thin.ali openal-alc_thin.o openal-buffer.ali \
	openal-buffer.o openal-context-capture.ali openal-context-capture.o \
	openal-context-error.ali openal-context-error.o openal-context.ali \
	openal-context.o openal-error.ali openal-error.o openal-global.ali \
	openal-global.o openal-listener.ali openal-listener.o openal-source.ali \
	openal-source.o openal-thin.ali openal-thin.o openal-types.ali openal-types.o \
	openal.a openal.ali openal.o
ext_clean:
	rm -f conf-adatype conf-cctype conf-ldtype conf-systype mk-ctxt

regen:\
ada-srcmap ada-srcmap-all
	./ada-srcmap-all
	cpj-genmk > Makefile.tmp && mv Makefile.tmp Makefile
