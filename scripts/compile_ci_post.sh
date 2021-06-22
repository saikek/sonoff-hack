#!/bin/bash

#
#  This file is part of sonoff-hack.
#  Copyright (c) 2018-2019 Davide Maggioni.
#  Copyright (c) 2020 roleo.
# 
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, version 3.
# 
#  This program is distributed in the hope that it will be useful, but
#  WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
#  General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program. If not, see <http://www.gnu.org/licenses/>.
#

get_script_dir()
{
    echo "$(cd `dirname $0` && pwd)"
}

source "$(get_script_dir)/common.sh"

# this is needed because with sudo the PATH apparently doesn't contain it. Idk why
# Hisilicon Linux, Cross-Toolchain PATH
for SUB_DIR in $SRC_DIR/* ; do
    if [ -d ${SUB_DIR} ]; then # Will not run if no directories are available
        compile_module $(normalize_path "$SUB_DIR") || exit 1
    fi
done

BIN_DIR=$(get_script_dir)/../bin
BUILD_DIR=$(get_script_dir)/../build

if [ -d "$BIN_DIR" ]; then
    cp -R $BIN_DIR/* $BUILD_DIR/
fi