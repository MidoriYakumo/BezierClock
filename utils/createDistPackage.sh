#!/bin/bash
#######################################################################################
## The MIT License (MIT)
##
## Copyright (c) 2016 Serg "EXL" Koles <exlmotodev@gmail.com>
##
## Permission is hereby granted, free of charge, to any person obtaining a copy
## of this software and associated documentation files (the "Software"), to deal
## in the Software without restriction, including without limitation the rights
## to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
## copies of the Software, and to permit persons to whom the Software is
## furnished to do so, subject to the following conditions:
##
## The above copyright notice and this permission notice shall be included in all
## copies or substantial portions of the Software.
##
## THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
## IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
## FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
## AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
## LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
## OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
## SOFTWARE.
#######################################################################################

# Name
VERSION=v1.0
PACKAGE_NAME=bezier-clock-$VERSION.tar.xz

# Dirs
CURRENT_DIR=`pwd`
PACKAGE_DIR=$CURRENT_DIR/ru.exlmoto.bezierclock
UI_DIR=$PACKAGE_DIR/contents/ui
ICON_DIR=$PACKAGE_DIR/contents/icon
CONFIG_DIR=$PACKAGE_DIR/contents/config

# Create dirs
mkdir -p $PACKAGE_DIR
mkdir -p $UI_DIR
mkdir -p $ICON_DIR
mkdir -p $CONFIG_DIR

# Copy package files
cp metadata.desktop $PACKAGE_DIR
cp ../qml/{*.qml,*.js} $UI_DIR
cp ../images/BC_icon.png $ICON_DIR
cp ../xml/main.xml $CONFIG_DIR

# Archive files
tar -cJf $PACKAGE_NAME ru.exlmoto.bezierclock

# Clean
rm -Rf $PACKAGE_DIR