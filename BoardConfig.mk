#
# Copyright (C) 2015 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

-include device/cyanogen/msm8939-common/BoardConfigCommon.mk

DEVICE_PATH := device/wileyfox/kipper

TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

# Asserts
TARGET_OTA_ASSERT_DEVICE := kipper,tod

# Kernel
TARGET_KERNEL_CONFIG := cyanogenmod_kipper-64_defconfig

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Camera
BOARD_CAMERA_SENSORS := imx220 imx230 ov8858_q8v19w_spirit
TARGET_USE_VENDOR_CAMERA_EXT := true
USE_DEVICE_SPECIFIC_CAMERA := true

# Charger
BOARD_CHARGER_DISABLE_INIT_BLANK := true

# CMHW
BOARD_HARDWARE_CLASS += $(DEVICE_PATH)/cmhw

# Dexopt
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),user)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif
WITH_DEXPREOPT_BOOT_IMG_ONLY ?= true

# GPS
TARGET_GPS_HAL_PATH := $(DEVICE_PATH)/gps
TARGET_NO_RPC := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE := 29018209280 # 29018225664 - 16384

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Recovery
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
TARGET_USERIMAGES_USE_EXT4 := true

# SELinux
BOARD_SEPOLICY_DIRS += \
    device/wileyfox/kipper/sepolicy

BOARD_SEPOLICY_UNION += \
    cktnv.te \
    file.te \
    file_contexts \
    property.te \
    property_contexts \
    system_server.te

# Wifi
CONFIG_EAP_PROXY := qmi
CONFIG_EAP_PROXY_DUAL_SIM := true
TARGET_USES_QCOM_WCNSS_QMI := true

DEVICE_RESOLUTION := 1080x1920
TW_NEW_ION_HEAP := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/twrp.fstab
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
#TW_TARGET_USES_QCOM_BSP := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_INCLUDE_CRYPTO := true

# inherit from the proprietary version
-include vendor/wileyfox/kipper/BoardConfigVendor.mk
