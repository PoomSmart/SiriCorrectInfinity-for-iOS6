include theos/makefiles/common.mk
export ARCHS = armv7
TWEAK_NAME = SCI6
SCI6_FILES = Tweak.xm
include $(THEOS_MAKE_PATH)/tweak.mk
