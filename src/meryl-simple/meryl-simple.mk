TARGET   := meryl-simple
SOURCES  := meryl-simple.C

SRC_INCDIRS  := . ../utility/src/utility

#  If we're part of Canu, build with canu support and use Canu's copy of
#  meryl-utility.  Otherwise, don't.

ifneq ($(wildcard stores/sqStore.H), )

SRC_CXXFLAGS := -DCANU

SRC_INCDIRS  := . ../../../utility/src/utility ../../../stores

TGT_LDFLAGS := -L${TARGET_DIR}/lib
TGT_LDLIBS  := -lcanu
TGT_PREREQS := libcanu.a

else

TGT_LDFLAGS := -L${TARGET_DIR}/lib
TGT_LDLIBS  := -lmeryl
TGT_PREREQS := libmeryl.a

endif

SUBMAKEFILES :=