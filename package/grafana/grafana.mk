GRAFANA_VERSION = 6.3.5
GRAFANA_SOURCE = grafana-$(GRAFANA_VERSION).linux-armv7.tar.gz
GRAFANA_SITE = https://dl.grafana.com/oss/release

GRAFANA_INSTALL_STAGING = NO

define GRAFANA_EXTRACT_CMDS
	tar xzvf $(DL_DIR)/grafana/$(GRAFANA_SOURCE) -C $(@D)
endef

define GRAFANA_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/grafana/
	cp -Rf $(@D)/grafana-$(GRAFANA_VERSION)/* $(TARGET_DIR)/usr/lib/grafana/
endef

$(eval $(generic-package))