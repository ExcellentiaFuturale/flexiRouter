#!/bin/bash

SCRIPTS_PATH=vpp/extras/vpp_config/scripts

/sbin/modprobe uio_pci_generic

ip link set dev enp0s3 down
ip link set dev enp0s8 down
ip link set dev enp0s9 down

cd vpp

gdb --args ./build-root/build-vpp_debug-native/vpp/bin/vpp -c ../scripts/startup.conf

cd -

python $SCRIPTS_PATH/dpdk-devbind.py -b e1000 00:03.0 00:08.0 00:09.0

netplan apply
