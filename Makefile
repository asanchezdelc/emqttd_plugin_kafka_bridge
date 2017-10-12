PROJECT = emqttd_plugin_kafka_bridge
PROJECT_DESCRIPTION = emq and kafka bridge
PROJECT_VERSION = 2.2

BUILD_DEPS = emqttd cuttlefish
dep_emqttd = git https://github.com/emqtt/emqttd master
dep_cuttlefish = git https://github.com/emqtt/cuttlefish

NO_AUTOPATCH = cuttlefish

ERLC_OPTS += +debug_info
ERLC_OPTS += +'{parse_transform, lager_transform}'

COVER = true

include erlang.mk

app:: rebar.config

app.config::
	deps/cuttlefish/cuttlefish -l info -e etc/ -c etc/emq_auth_mongo.conf -i priv/emq_auth_mongo.schema -d data

