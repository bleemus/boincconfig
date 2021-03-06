#!/bin/bash
apt-get -y update \
&& apt-get -y install boinc-client xmlstarlet unattended-upgrades \
&& sudo -u boinc xmlstarlet ed --inplace -s /cc_config -t elem -n options /etc/boinc-client/cc_config.xml \
&& sudo -u boinc xmlstarlet ed --inplace -s /cc_config/options -t elem -n process_priority -v 4 /etc/boinc-client/cc_config.xml \
&& sudo -u boinc boinccmd --project_attach http://www.worldcommunitygrid.org 499540_82dce48c62a8fb0de7ab4c248db6ef0b \
&& sudo -u boinc boinccmd --read_cc_config
&& echo 'APT::Periodic::Download-Upgradeable-Packages "1";' | sudo tee -a /etc/apt/apt.conf.d/20auto-upgrades
&& echo 'APT::Periodic::AutocleanInterval "7";' | sudo tee -a /etc/apt/apt.conf.d/20auto-upgrades
