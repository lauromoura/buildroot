################################################################################
#
# wpeframework-provisioning
#
################################################################################

WPEFRAMEWORK_PROVISIONING_VERSION = R3
WPEFRAMEWORK_PROVISIONING_SITE_METHOD = git
WPEFRAMEWORK_PROVISIONING_SITE = git@github.com:WebPlatformForEmbedded/WPEPluginProvisioning.git
WPEFRAMEWORK_PROVISIONING_INSTALL_STAGING = YES
WPEFRAMEWORK_PROVISIONING_DEPENDENCIES = wpeframework libprovision

WPEFRAMEWORK_PROVISIONING_CONF_OPTS += -DBUILD_REFERENCE=${WPEFRAMEWORK_PROVISIONING_VERSION}

ifeq ($(BR2_CMAKE_HOST_DEPENDENCY),)
WPEFRAMEWORK_PROVISIONING_CONF_OPTS += -DCMAKE_MODULE_PATH=$(HOST_DIR)/share/cmake/Modules
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_PROVISIONING),y)
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_PROVISIONING_CLOUD),y)
WPEFRAMEWORK_PROVISIONING_CONF_OPTS += -DENABLE_METROLOGICAL_CLOUD=ON

WPEFRAMEWORK_PROVISIONING_CONF_OPTS += -DWPEFRAMEWORK_PROVISIONING_URI=${BR2_PACKAGE_WPEFRAMEWORK_PROVISIONING_URI}
WPEFRAMEWORK_PROVISIONING_CONF_OPTS += -DPLUGIN_PROVISIONING_OPERATOR=${BR2_PACKAGE_WPEFRAMEWORK_PROVISIONING_OPERATOR}

ifeq ($(shell expr $(BR2_PACKAGE_WPEFRAMEWORK_PROVISIONING_PROVISIONING_CACHE_PERIODE) \> 0),1)
WPEFRAMEWORK_PROVISIONING_CONF_OPTS += -DPLUGIN_PROVISIONING_CACHE=$(call qstrip,$(BR2_PACKAGE_WPEFRAMEWORK_PROVISIONING_PROVISIONING_CACHE_PERIODE)) 
endif
endif # BR2_PACKAGE_WPEFRAMEWORK_PROVISIONING_CLOUD

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_PROVISIONING_FILES),y)
WPEFRAMEWORK_PROVISIONING_CONF_OPTS += -DENABLE_METROLOGICAL_FILES=ON

ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_PROVISIONING_VAULT_LOCATION),"")
WPEFRAMEWORK_PROVISIONING_CONF_OPTS += -DPLUGIN_PROVISIONING_VAULT_LOCATION="$(call qstrip,$(BR2_PACKAGE_WPEFRAMEWORK_PROVISIONING_VAULT_LOCATION))"
endif
endif # BR2_PACKAGE_WPEFRAMEWORK_PROVISIONING_FILES

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_PROVISIONING_WIDEVINE),y)
WPEFRAMEWORK_PROVISIONING_CONF_OPTS += -DENABLE_WIDEVINE_PROVIONING=ON

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_PROVISIONING_WIDEVINE_LOG_LEVEL_0),y)
  WPEFRAMEWORK_PROVISIONING_CONF_OPTS += -DPLUGIN_PROVISIONING_WV_LOGLEVEL=0
else ifeq ($( BR2_PACKAGE_WPEFRAMEWORK_PROVISIONING_WIDEVINE_LOG_LEVEL_1),y)
  WPEFRAMEWORK_PROVISIONING_CONF_OPTS += -DPLUGIN_PROVISIONING_WV_LOGLEVEL=1
else ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_PROVISIONING_WIDEVINE_LOG_LEVEL_2),y)
  WPEFRAMEWORK_PROVISIONING_CONF_OPTS += -DPLUGIN_PROVISIONING_WV_LOGLEVEL=2
else ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_PROVISIONING_WIDEVINE_LOG_LEVEL_3),y)
  WPEFRAMEWORK_PROVISIONING_CONF_OPTS += -DPLUGIN_PROVISIONING_WV_LOGLEVEL=3
else ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_PROVISIONING_WIDEVINE_LOG_LEVEL_4),y)
  WPEFRAMEWORK_PROVISIONING_CONF_OPTS += -DPLUGIN_PROVISIONING_WV_LOGLEVEL=4
endif
endif # BR2_PACKAGE_WPEFRAMEWORK_PROVISIONING_WIDEVINE
endif # BR2_PACKAGE_WPEFRAMEWORK_PROVISIONING

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_PROVISIONING_BLOBWRITER),y)
WPEFRAMEWORK_PROVISIONING_CONF_OPTS += -DPLUGIN_BLOBWRITER=ON

ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_PROVISIONING_BLOBWRITER_BLOBS),)
WPEFRAMEWORK_PROVISIONING_CONF_OPTS += -DPLUGIN_BLOBWRITER_BLOBS="$(call qstrip,$(BR2_PACKAGE_WPEFRAMEWORK_PROVISIONING_BLOBWRITER_BLOBS))"
endif
endif # BR2_PACKAGE_WPEFRAMEWORK_PROVISIONING_BLOBWRITER

$(eval $(cmake-package))
