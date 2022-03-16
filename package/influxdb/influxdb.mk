# wget https://dl.influxdata.com/influxdb/releases/influxdb-1.7.8_linux_armhf.tar.gz

INFLUXDB_VERSION = 1.8.10
INFLUXDB_SOURCE = influxdb-$(INFLUXDB_VERSION)_linux_armhf.tar.gz
INFLUXDB_SITE = https://dl.influxdata.com/influxdb/releases

INFLUXDB_INSTALL_STAGING = NO

define INFLUXDB_USERS
	influx 8086 influx 8086 ! /root/home/influx/ /bin/sh - Grafana
endef

define INFLUXDB_EXTRACT_CMDS
	tar xzvf $(DL_DIR)/influxdb/$(INFLUXDB_SOURCE) -C $(@D) --strip-components=2
endef

define INFLUXDB_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/usr/bin/influx $(TARGET_DIR)/usr/bin/influx
	$(INSTALL) -D -m 0755 $(@D)/usr/bin/influxd $(TARGET_DIR)/usr/bin/influxd
	$(INSTALL) -D -m 0755 $(@D)/usr/bin/influx_inspect $(TARGET_DIR)/usr/bin/influx_inspect
	$(INSTALL) -D -m 0755 $(@D)/usr/bin/influx_stress $(TARGET_DIR)/usr/bin/influx_stress
endef

$(eval $(generic-package))