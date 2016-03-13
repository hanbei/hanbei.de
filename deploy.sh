#!/bin/bash

cd public
find . -type f -exec curl --ftp-create-dirs -T {} -u $FTP_USER:$FTP_PASS ftp://ftp.hanbei.de/staging/{} \;
