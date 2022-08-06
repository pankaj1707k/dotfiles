#!/bin/bash

export ALL_PROXY='http://{server_address}:{port}'
export HTTP_PROXY='http://{server_address}:{port}'
export HTTPS_PROXY='https://{server_address}:{port}'
export all_proxy='http://{server_address}:{port}'
export http_proxy='http://{server_address}:{port}'
export https_proxy='https://{server_address}:{port}'

git config --global http.proxy http://{server_address}:{port}

sudo cp ~/proxy.conf /etc/apt/apt.conf.d/

cp ~/.wgetconfig/.wgetrc ~/
