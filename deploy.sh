#!/bin/bash
rm -rf public
hugo -t casper # if using a theme, replace by `hugo -t <yourtheme>
cd public
find . -type f -exec curl --ftp-create-dirs -T {} -u $FTP_USER:$FTP_PASS ftp://ftp.hanbei.de/staging/{} \;
