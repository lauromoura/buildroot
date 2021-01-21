################################################################################
#
# wpeframework-cdmi-playready
#
################################################################################

WPEFRAMEWORK_CDMI_PLAYREADY_VERSION = 7e545356366b0cd1a3b3d7429a9037301bf747b0
WPEFRAMEWORK_CDMI_PLAYREADY_SITE_METHOD = git
WPEFRAMEWORK_CDMI_PLAYREADY_SITE = git@github.com:rdkcentral/OCDM-Playready.git
WPEFRAMEWORK_CDMI_PLAYREADY_INSTALL_STAGING = YES
WPEFRAMEWORK_CDMI_PLAYREADY_DEPENDENCIES = wpeframework
WPEFRAMEWORK_CDMI_PLAYREADY_CONF_OPTS = -DPERSISTENT_PATH=${BR2_PACKAGE_WPEFRAMEWORK_PERSISTENT_PATH}

ifeq ($(BR2_PACKAGE_PLAYREADY4),y)
WPEFRAMEWORK_CDMI_PLAYREADY_DEPENDENCIES += playready4
WPEFRAMEWORK_CDMI_PLAYREADY_CONF_OPTS += -DNETFLIX_EXTENSION=OFF
else
WPEFRAMEWORK_CDMI_PLAYREADY_DEPENDENCIES += playready
WPEFRAMEWORK_CDMI_PLAYREADY_CONF_OPTS += -DNETFLIX_EXTENSION=ON
endif

$(eval $(cmake-package))
