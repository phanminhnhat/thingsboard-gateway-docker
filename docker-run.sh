#!/bin/bash

sudo docker run -d -v ~/.mytb-gateway-data:/etc/tb-gateway/conf -v ~/.mytb-gateway-logs:/var/log/tb-gateway/ --name tb-gateway-instance tb-gate-way

