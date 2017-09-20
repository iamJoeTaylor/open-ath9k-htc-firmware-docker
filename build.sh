#!/bin/bash

IMG_PFX="iamjoetaylor/open-ath9k-htc-firmware-docker"

build() {
	docker build -f ./$1/Dockerfile -t "${IMG_PFX}:$1" .
}

# build base/toolchain imgs if missing or $REBUILD is set
if [[ ("$REBUILD" != "") || ("$(docker images -q ${IMG_PFX}:base)" == "") ]]; then
	build "base"
fi

if [[ ("$REBUILD" != "") || ("$(docker images -q ${IMG_PFX}:toolchain)" == "") ]]; then
	build "toolchain"
fi

# build firmware img
docker build -f ./firmware/Dockerfile -t $IMG_PFX .
