#!/bin/bash

yum install -y ntp
systemctl enable ntpd
systemctl start ntpd
