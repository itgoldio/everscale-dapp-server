#!/bin/bash -eEx

TON_NODE_ROOT_DIR="/ton-node"
TON_NODE_CONFIGS_DIR="${TON_NODE_ROOT_DIR}/configs"
TON_NODE_SCRIPTS_DIR="${TON_NODE_ROOT_DIR}/scripts"
TON_NODE_LOGS_DIR="${TON_NODE_ROOT_DIR}/logs"

echo "INFO: R-Node startup..."

echo "INFO: NETWORK_TYPE = ${NETWORK_TYPE}"
echo "INFO: DEPLOY_TYPE = ${DEPLOY_TYPE}"
echo "INFO: CONFIGS_PATH = ${CONFIGS_PATH}"
echo "INFO: \$1 = $1"
echo "INFO: \$2 = $2"

NODE_EXEC="${TON_NODE_ROOT_DIR}/ton_node"
if [ "${TON_NODE_ENABLE_KAFKA}" -ne 1 ]; then
    echo "INFO: Kafka disabled"
    NODE_EXEC="${TON_NODE_ROOT_DIR}/ton_node"
else
    echo "INFO: Kafka enabled"
fi

function f_get_ton_global_config_json() {
    curl -sS "https://raw.githubusercontent.com/tonlabs/main.ton.dev/master/configs/ton-global.config.json" -o "${TON_NODE_CONFIGS_DIR}/ton-global.config.json"
}

f_get_ton_global_config_json

cd ${TON_NODE_ROOT_DIR}
# shellcheck disable=SC2086
exec ${NODE_EXEC} --configs "${CONFIGS_PATH}" ${TON_NODE_EXTRA_ARGS} >>${TON_NODE_LOGS_DIR}/stdout.log 2>>${TON_NODE_LOGS_DIR}/stderr.log
