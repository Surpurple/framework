Target = tplayer

include ../makefile_cfg

SDK_PATH = ../../sdk_lib

CXXFLAGS = -I$(SDK_PATH)/cedarx/include/libcedarc/include
CXXFLAGS += -I$(SDK_PATH)/
CXXFLAGS += -L$(SDK_PATH)/libs
CXXFLAGS += -I$(SDK_PATH)/include
CXXFLAGS += -I$(SDK_PATH)/include/cutils
CXXFLAGS += -I$(SDK_PATH)/include/camera
CXXFLAGS += -I$(SDK_PATH)/include/disp2
CXXFLAGS += -I$(SDK_PATH)/memory

LDFLAGS = -L$(SDK_PATH) -L$(SDK_PATH)/libs/ -L$(SDK_PATH)/cedarx/lib/ 


CEDAR_LINK_NEW = -L$(SDK_PATH)/cedarx/lib/ -Wl,--no-undefined -ladecoder -laencoder -lcdx_base -lcdx_common \
	-lcdx_muxer -lcdx_parser -lcdx_playback -lcdx_stream -lMemAdapter -lcdc_base -lsubdecoder -lvdecoder \
	-lvencoder -lVE -lvideoengine -lxmetadataretriever -lxplayer -lvenc_base -lvenc_codec -lcdx_ion -lasound \
	-lsbm -laftertreatment -lscaledown -lfbm -lvenc_common -lvenc_h264 -lvenc_h265 -lvenc_jpeg
	
CEDAR_MACORS = -D_GNU_SOURCE -DCONFIG_CHIP=7 -DCONFIG_TARGET_PRODUCT= -DCONFIG_PRODUCT=2 \
				-DCONFIG_VE_IPC=1 -DROTATE_PIC_HW=0 -DVE_PHY_OFFSET=0x40000000 -DCONFIG_LOG_LEVEL=0 

ANDROID_UTILS_DEF = -DHAVE_PTHREADS -DHAVE_SYS_UIO_H -DANDROID_SMP=1 -D__ARM_HAVE_DMB -D__ARM_HAVE_LDREX_STREX -DHAVE_POSIX_CLOCKS -DHAVE_PRCTL
SDKLIB_DEF = -DWATERMARK -DCDX_V27 -DSUPPORT_NEW_DRIVER -DSDKLIB_TEST -DXPLAYDEMO
DEFINES += $(ANDROID_UTILS_DEF) $(SDKLIB_DEF) $(CEDAR_MACORS)

LIBS += -lMemAdapter -lvdecoder -lVE -lcdc_base -lvideoengine -lcdx_common -lcdx_base -lsdk_memory -lsdk_disp -lsdk_log -lsdk_camera
LIBS += -L$(SDK_PATH)/libs -lsdk_compose -lsdk_disp -lsdk_g2d -lsdk_dvr -lsdk_player \
		 -lsdk_log -lsdk_camera -lsdk_memory -lsdk_sound -lsdk_storage -lsdk_audenc -lsdk_cfg -lsdk_ctrl -lsdk_misc 
#LIBS +=  $(LICHEE_BR_OUT)/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libmali.so

all: $(Target)

$(Target): tplayer.cpp
	$(CPP) tplayer.cpp -o $(Target) $(CXXFLAGS) $(LIBS) $(LDFLAGS) $(DEFINES) $(CEDAR_LINK_NEW) -lsdk_audenc -lpthread -lz -lcrypto -lssl
	@echo "generate $(Target) success!!!"
	@cp -f $(Target) $(INSTATLL_PATH)
	@cp -f aw_player_lcd.sh aw_player_lcd_tv.sh aw_player_tv.sh $(INSTATLL_PATH) 
	@echo -e '\e[1;33m cp -f $(Target) $(INSTATLL_PATH) \e[0m'

	
.PHONY:clean cleanall

clean: 
	@rm -f $(Target)
cleanall:clean
	-rm -f $(INSTATLL_PATH)/$(Target) 

distclean:cleanall 
	
install:
	-cp $(Target) $(INSTATLL_PATH)	
