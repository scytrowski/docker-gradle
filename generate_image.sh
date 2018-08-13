#!/bin/bash
REPO_URL="https://github.com/vdrake6/docker-gradle.git"
REPO_BRANCH="master"
CODE_DIR="code"
IMAGE_NAME="vdrake6/dockergradle"

PROJECT_NAME=`basename ${CODE_DIR}`
MASTER_DIR=`pwd`

git clone --single-branch -b ${REPO_BRANCH} ${REPO_URL} "./repo" && \
cd "./repo/${CODE_DIR}" && \
gradle jar && \
cp "./build/libs/${PROJECT_NAME}.jar" "${MASTER_DIR}/app.jar" && \
docker build . -t ${IMAGE_NAME}
