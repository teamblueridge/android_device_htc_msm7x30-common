ifeq ($(BOARD_USES_HTC_CAMERA),true)

$(shell mkdir -p $(OUT)/obj/SHARED_LIBRARIES/libcamera_intermediates/)
$(shell touch $(OUT)/obj/SHARED_LIBRARIES/libcamera_intermediates/export_includes)
$(shell mkdir -p $(OUT)/obj/SHARED_LIBRARIES/camera.msm7x30_intermediates/)
$(shell touch $(OUT)/obj/SHARED_LIBRARIES/camera.msm7x30_intermediates/export_includes)

LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE := camera.$(TARGET_BOARD_PLATFORM)

LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := cameraHAL.cpp
LOCAL_C_INCLUDES := $(TOP)/frameworks/native/include

LOCAL_SHARED_LIBRARIES := liblog libutils libcutils
LOCAL_SHARED_LIBRARIES += libui libhardware libcamera_client
LOCAL_SHARED_LIBRARIES += libcamera
LOCAL_PRELINK_MODULE := false

ifeq ($(BOARD_HAVE_HTC_FFC), true)
    LOCAL_CFLAGS += -DHTC_FFC
endif
ifeq ($(BOARD_USE_REVERSE_FFC), true)
    LOCAL_CFLAGS += -DREVERSE_FFC
endif

include $(BUILD_SHARED_LIBRARY)

endif
