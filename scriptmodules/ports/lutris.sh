#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="lutris"
rp_module_desc="lutris - Game engine for linux"
rp_module_licence="GGPL https://github.com/lutris/lutris/blob/master/LICENSE"
rp_module_section="exp"
rp_module_flags="!mali !x86"

function depends_lutris() {
        getDepends git matchbox xorg
}

function sources_lutris() {
    apt-get install lutris
}

function configure_lutris() {
    mkRomDir "ports"
    mkdir -p "$md_inst"
    moveConfigDir "$home/.config/$md_id" "$md_conf_root/$md_id"
    cat >"$md_inst/lutris.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager -use_titlebar no &
/usr/bin/lutris
_EOF_