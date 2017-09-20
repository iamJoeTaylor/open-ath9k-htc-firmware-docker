# open-ath9k-htc-firmware-docker
**Dockerfile for building the firmware for QCA AR7010/AR9271 802.11n USB NICs**
It uses [qca/open-ath9k-htc-firmware](https://github.com/qca/open-ath9k-htc-firmware) exclusively.

## Usage
`docker run -it -v /LOCAL/PATH/TO/open-ath9k-htc-firmware:/source iamjoetaylor/open-ath9k-htc-firmware-docker /bin/bash`

When in the prompt you can navigate to `/source` and;
- build `make -C target_firmware`
- force clean rebuild `make -C target_firmware clean`

Once built the files should be available in the host path you past in `target_firmware` directory.
