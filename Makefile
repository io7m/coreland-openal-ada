# auto generated - do not edit

default: all

all:\
openal-buffer.ali openal-buffer.o openal-error.ali openal-error.o \
openal-thin.ali openal-thin.o openal-types.ali openal-types.o openal.ali \
openal.o

ada-bind:\
conf-adabind conf-systype conf-adatype

ada-compile:\
conf-adacomp conf-adatype conf-systype conf-adacflags

ada-link:\
conf-adalink conf-adatype conf-systype

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

openal-buffer.ads:\
openal.ali openal-thin.ali openal-types.ali

openal-buffer.o openal-buffer.ali:\
ada-compile openal-buffer.adb openal.ali openal-buffer.ads
	./ada-compile openal-buffer.adb

openal-error.ads:\
openal.ali

openal-error.o openal-error.ali:\
ada-compile openal-error.adb openal.ali openal-error.ads openal-thin.ali
	./ada-compile openal-error.adb

openal-thin.o openal-thin.ali:\
ada-compile openal-thin.ads openal.ali openal-thin.ads
	./ada-compile openal-thin.ads

openal-types.o openal-types.ali:\
ada-compile openal-types.ads openal.ali openal-types.ads openal-thin.ali
	./ada-compile openal-types.ads

openal.o openal.ali:\
ada-compile openal.ads openal.ads
	./ada-compile openal.ads

clean-all: obj_clean ext_clean
clean: obj_clean
obj_clean:
	rm -f openal-buffer.ali openal-buffer.o openal-error.ali openal-error.o \
	openal-thin.ali openal-thin.o openal-types.ali openal-types.o openal.ali \
	openal.o
ext_clean:
	rm -f conf-adatype conf-cctype conf-ldtype conf-systype mk-ctxt

regen:\
ada-srcmap ada-srcmap-all
	./ada-srcmap-all
	cpj-genmk > Makefile.tmp && mv Makefile.tmp Makefile
