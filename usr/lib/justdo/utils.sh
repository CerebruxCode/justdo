#!/usr/bin/env bash
#
#    justdo - A simple pomodoro timer for the terminal
#    Copyright:
#       2020 Ioannis Tsagatakis <tsagatakis@protonmail.com>
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, version 3 of the License.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

set -e

# Gets a name and a width
# Return string padding with '.'
# up to terminal_width-20
function get_pomodoro_name_dot() {
    local t_cols m_cols width pomodoro_name
    pomodoro_name="$1"
    width="$2"

    # Limit width to terminal
    t_cols=$(tput cols)
    m_cols=$(( t_cols - 20 ))
    (( width > m_cols )) && width=m_cols

    # Fit string addind dot at the end
    # pomodoro_name=$(printf "%-$((width))s"  "${pomodoro_name}" | tr " " ".")
    pomodoro_name=$(printf "%-$((width))s"   "${pomodoro_name}")
    # Ensure max length
    pomodoro_name=${pomodoro_name:0:width}

    # Return
    echo "${pomodoro_name}"
}

# Print string, Start with color1
# change to normal after split chars
function color_print() {
    local msg="$1"
    local split="$2"
    local colorA
    shopt -s extglob
    colorA="${3%%*( )}"
    shopt -u extglob

    declare -A color_table=(
        [Red]="$(tput setab 1)"
        [Green]="$(tput setab 2)"
        [Yellow]="$(tput setab 3)"
        [Blue]="$(tput setab 4)"
        [None]="$(tput sgr0)"
    )

    echo -ne "${color_table["$colorA"]}"
    local i
    for (( i=0; i<${#msg}; i++ )); do
        echo -ne "${msg:$i:1}"
        if (( i == split )); then
          echo -ne "${color_table[None]}"
        fi
    done
    echo -ne "${color_table[None]}"
}

# Format time left
# Usage var=$(do_time_fmt time total)
do_time_fmt() {
    local time=$1
    local total=$2
    local minS="$(( (total - time) / 60 ))"
    local secS="$(( (total - time) % 60 ))"
    echo "${minS}:${secS}"
}
