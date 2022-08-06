#!/bin/bash

unset ALL_PROXY
unset HTTP_PROXY
unset HTTPS_PROXY
unset all_proxy
unset http_proxy
unset https_proxy

git config --global --unset http.proxy

sudo rm /etc/apt/apt.conf.d/proxy.conf

rm ~/.wgetrc
