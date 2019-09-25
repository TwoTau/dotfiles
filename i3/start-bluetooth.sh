#!/bin/bash

sudo modprobe btusb && systemctl start bluetooth && bluetoothctl
