# wget https://github.com/traefik/traefik/releases/download/v2.6.0/traefik_v2.6.0_linux_armv7.tar.gz

TRAEFIK_VERSION = v2.6.0
TRAEFIK_SOURCE = traefik_$(TRAEFIK_VERSION)_linux_armv7.tar.gz
TRAEFIK_SITE = https://github.com/traefik/traefik/releases/download/$(TRAEFIK_VERSION)

TRAEFIK_INSTALL_STAGING = NO

define TRAEFIK_EXTRACT_CMDS
	tar xzvf $(DL_DIR)/traefik/$(TRAEFIK_SOURCE) -C $(@D)
endef

define TRAEFIK_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/traefik $(TARGET_DIR)/usr/bin/traefik
endef

$(eval $(generic-package))