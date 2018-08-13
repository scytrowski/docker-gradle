#!/bin/bash
REPO_URL="https://github.com/vdrake6/docker-gradle.git"
REPO_BRANCH="master"
CLONE_DIR="repo"
CODE_DIR="code"
IMAGE_NAME="vdrake6/dockergradle"

PROJECT_NAME=`basename ${CODE_DIR}`
MASTER_DIR=`pwd`

rm -rf ${CLONE_DIR} && \
git clone --single-branch -b ${REPO_BRANCH} ${REPO_URL} ${CLONE_DIR} && \
cd "${CLONE_DIR}/${CODE_DIR}" && \
gradle jar && \
cp "./build/libs/${PROJECT_NAME}.jar" "${MASTER_DIR}/app.jar" && \
cd ${MASTER_DIR} && \
docker build . -t ${IMAGE_NAME} && \
rm -rf ${CLONE_DIR}
