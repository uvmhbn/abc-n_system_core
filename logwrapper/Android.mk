LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

# ========================================================
# Static library
# ========================================================
include $(CLEAR_VARS)
LOCAL_MODULE := liblogwrap
LOCAL_SRC_FILES := logwrap.c
LOCAL_SHARED_LIBRARIES := libcutils liblog
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/include
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include
LOCAL_CFLAGS := -Werror -std=gnu99
include $(BUILD_STATIC_LIBRARY)

# ========================================================
# Shared library
# ========================================================
include $(CLEAR_VARS)
LOCAL_MODULE := liblogwrap
LOCAL_SHARED_LIBRARIES := libcutils liblog
LOCAL_WHOLE_STATIC_LIBRARIES := liblogwrap
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/include
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include
LOCAL_CFLAGS := -Werror -std=gnu99
include $(BUILD_SHARED_LIBRARY)

# ========================================================
# Executable
# ========================================================
include $(CLEAR_VARS)
LOCAL_SRC_FILES:= logwrapper.c
LOCAL_MODULE := logwrapper
LOCAL_STATIC_LIBRARIES := liblog liblogwrap libcutils
LOCAL_CFLAGS := -Werror -std=gnu99
include $(BUILD_EXECUTABLE)
