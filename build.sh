#------------------------------------------------------------
# Fano Web Framework Skeleton Application (https://fanoframework.github.io)
#
# @link      https://github.com/fanoframework/fano-api
# @copyright Copyright (c) 2018 Zamrony P. Juhara
# @license   https://github.com/fanoframework/fano-api/blob/master/LICENSE (GPL 2.0)
#-------------------------------------------------------------
#!/bin/bash

#------------------------------------------------------
# Build script for Linux
#------------------------------------------------------

if [[ -z "${PRACK_DIR}" ]]; then
export PRACK_DIR="src"
fi

if [[ -z "${BUILD_TYPE}" ]]; then
export BUILD_TYPE="prod"
fi

if [[ -z "${EXEC_OUTPUT_DIR}" ]]; then
    export EXEC_OUTPUT_DIR="bin"
fi

if [[ -z "${UNIT_OUTPUT_DIR}" ]]; then
    export UNIT_OUTPUT_DIR="bin/unit"
fi

if [[ -z "${EXEC_OUTPUT_NAME}" ]]; then
export EXEC_OUTPUT_NAME="Prack"
fi

if [[ -z "${SOURCE_PROGRAM_NAME}" ]]; then
export SOURCE_PROGRAM_NAME="Prack.lpr"
fi

if [[ -z "${FPC_BIN}" ]]; then
export FPC_BIN="fpc"
fi

${FPC_BIN} @Prack.cfg @build.cfg ${PRACK_DIR}/${SOURCE_PROGRAM_NAME}
