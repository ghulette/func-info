FRAMAC_SHARE := $(shell frama-c-config -print-share-path)
FRAMAC_LIBDIR := $(shell frama-c-config -print-libpath)
PLUGIN_NAME = FuncInfo
PLUGIN_CMO = func_info
include $(FRAMAC_SHARE)/Makefile.dynamic
