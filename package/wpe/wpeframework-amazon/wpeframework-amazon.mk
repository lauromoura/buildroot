
################################################################################
#
# wpeframework-amazon
#
################################################################################

WPEFRAMEWORK_AMAZON_VERSION = e56581ff051e7070379e1c512b56abdcc686e5c5
WPEFRAMEWORK_AMAZON_SITE_METHOD = git
WPEFRAMEWORK_AMAZON_SITE = git@github.com:Metrological/WPEPluginAmazon.git
WPEFRAMEWORK_AMAZON_INSTALL_STAGING = YES
WPEFRAMEWORK_AMAZON_DEPENDENCIES = wpeframework amazon-ignition

WPEFRAMEWORK_AMAZON_SUPPORTS_IN_SOURCE_BUILD = NO

WPEFRAMEWORK_AMAZON_CONF_OPTS += \
    -DBUILD_REFERENCE=${WPEFRAMEWORK_AMAZON_VERSION} \
    -DPLUGIN_AMAZON_PRIME_DTID=${BR2_PACKAGE_WPEFRAMEWORK_AMAZON_DTID} \
    -DPLUGIN_AMAZON_PRIME_MANUFACTURER=${BR2_PACKAGE_WPEFRAMEWORK_AMAZON_MANUFACTURER} \
    -DPLUGIN_AMAZON_PRIME_MODEL_NAME=${BR2_PACKAGE_WPEFRAMEWORK_AMAZON_MODEL} \
    -DPLUGIN_AMAZON_PRIME_CHIPSET_NAME=${BR2_PACKAGE_WPEFRAMEWORK_AMAZON_CHIPSET}

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_AUTOSTART),y)
WPEFRAMEWORK_AMAZON_CONF_OPTS += -DPLUGIN_AMAZON_PRIME_AUTOSTART=ON
endif

ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_USER),)
WPEFRAMEWORK_AMAZON_CONF_OPTS += -DPLUGIN_AMAZON_PRIME_NAME=$(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_USER)
endif

ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_GROUP),)
WPEFRAMEWORK_AMAZON_CONF_OPTS += -DPLUGIN_AMAZON_PRIME_GROUP=$(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_GROUP)
endif

ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_CA_BUNDLE_PATH),)
WPEFRAMEWORK_AMAZON_CONF_OPTS += -DPLUGIN_AMAZON_PRIME_CA_BUNDLE_PATH=$(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_CA_BUNDLE_PATH)
endif

ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_FRAGMENT_CACHE_SIZE),)
WPEFRAMEWORK_AMAZON_CONF_OPTS += -DPLUGIN_AMAZON_PRIME_FRAGMENT_CACHE_SIZE=$(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_FRAGMENT_CACHE_SIZE)
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_DEBUG),y)
WPEFRAMEWORK_AMAZON_CONF_OPTS += -DCMAKE_BUILD_TYPE=Debug
endif

$(eval $(cmake-package))
