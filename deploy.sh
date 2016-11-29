#!/bin/bash
rm -rf public
hugo -t hanbei # if using a theme, replace by `hugo -t <yourtheme>
cd public
echo ${TRAVIS_PULL_REQUEST}
if [ "${TRAVIS_PULL_REQUEST}" = "false" ]; then
    if [ "${TRAVIS_BRANCH}" != "master" ]; then
        find . -type f -exec curl --ftp-create-dirs -T {} -u $FTP_USER:$FTP_PASS ftp://ftp.hanbei.de/staging/{} \;
    fi
else
    echo "Working on master branch"
fi
