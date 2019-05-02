################################################################################
#
# WPEFramework Provisioning
#
################################################################################

WPEFRAMEWORK_PROVISIONING_VERSION = 8165a14b5d7ae89141517bba5e9eb85a647fdb94
WPEFRAMEWORK_PROVISIONING_SITE_METHOD = git
WPEFRAMEWORK_PROVISIONING_SITE = git@github.com:WebPlatformForEmbedded/WPEPluginProvisioning.git
WPEFRAMEWORK_PROVISIONING_INSTALL_STAGING = YES
WPEFRAMEWORK_PROVISIONING_DEPENDENCIES = wpeframework libprovision

WPEFRAMEWORK_PROVISIONING_CONF_OPTS += -DBUILD_REFERENCE=${WPEFRAMEWORK_PROVISIONING_VERSION}

WPEFRAMEWORK_PROVISIONING_CONF_OPTS += -DWPEFRAMEWORK_PROVISIONING_URI=${BR2_PACKAGE_WPEFRAMEWORK_PROVISIONING_URI}
WPEFRAMEWORK_PROVISIONING_CONF_OPTS += -DPLUGIN_PROVISIONING_OPERATOR=${BR2_PACKAGE_WPEFRAMEWORK_PROVISIONING_OPERATOR}


$(eval $(cmake-package))
