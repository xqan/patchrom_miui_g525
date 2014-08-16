#
# Makefile for g525
#


local-zip-file     := stockrom.zip

local-out-zip-file := miui_g525.zip

local-modified-apps := 

local-miui-apps     := 

local-remove-apps   := Apollo ThemeChooser 

local-density := HDPI

local-miui-removed-apps := MiuiCompass Bluetooth Stk 

local-miui-modified-apps := 

include phoneapps.mk

# To include the local targets before and after zip the final ZIP file, 
# and the local-targets should:
# (1) be defined after including porting.mk if using any global variable(see porting.mk)
# (2) the name should be leaded with local- to prevent any conflict with global targets
local-pre-zip := local-zip-misc
local-after-zip:= local-test

# The local targets after the zip file is generated, could include 'zip2sd' to 
# deliver the zip file to phone, or to customize other actions

include $(PORT_BUILD)/porting.mk

# To define any local-target
local-zip-misc:
	    cp other/build.prop $(ZIP_DIR)/system/build.prop
	    #cp other/Settings2.apk $(ZIP_DIR)/system/priv-app/Settings2.apk
	    cp other/libselinux.so $(ZIP_DIR)/system/lib/libselinux.so
