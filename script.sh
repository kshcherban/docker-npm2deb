#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <packagename=version>"
    exit 0
fi

PACKAGE="$(echo $1 | cut -d'=' -f1)"
VERSION="$(echo $1 | cut -d'=' -f2)"
BUILDROOT="/opt/buildroot"

mkdir -vp $BUILDROOT
cd $BUILDROOT

echo "*** Producing deb package of $PACKAGE"
if [ $VERSION == $PACKAGE ]; then
    fpm -s npm -t deb --verbose $PACKAGE
else
    fpm -s npm -t deb -v $VERSION --verbose $PACKAGE
fi
pwd
ls -la /opt/buildroot
