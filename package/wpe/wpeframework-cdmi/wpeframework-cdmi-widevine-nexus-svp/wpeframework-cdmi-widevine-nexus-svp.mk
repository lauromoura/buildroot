################################################################################
#
# wpeframework-cdmi-widevine-nexus-svp
#
################################################################################

WPEFRAMEWORK_CDMI_WIDEVINE_NEXUS_SVP_VERSION = b2d1b59c333b9c7d244a9cc3b87fd896a1dcbf95
WPEFRAMEWORK_CDMI_WIDEVINE_NEXUS_SVP_SITE_METHOD = git
WPEFRAMEWORK_CDMI_WIDEVINE_NEXUS_SVP_SITE = git@github.com:WebPlatformForEmbedded/OCDM-Widevine-Nexus-SVP.git
WPEFRAMEWORK_CDMI_WIDEVINE_NEXUS_SVP_INSTALL_STAGING = NO
WPEFRAMEWORK_CDMI_WIDEVINE_NEXUS_SVP_DEPENDENCIES = wpeframework-clientlibraries

ifeq ($(BR2_PACKAGE_BCM_REFSW),y)
WPEFRAMEWORK_CDMI_WIDEVINE_NEXUS_SVP_DEPENDENCIES += bcm-refsw
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_CDMI_WIDEVINE_NEW_CENC_INTERFACE),y)
WPEFRAMEWORK_CDMI_WIDEVINE_NEXUS_SVP_CONF_OPTS = -DCENC_VERSION=14
endif

$(eval $(cmake-package))
