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


# Must have `argbash` installed
base_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
usr="${base_dir}/../../usr"

echo "*** Parsing custom OptArgs library"
argbash --type=bash-script --strip=user-content --commented \
        --output="${usr}/lib/justdo/cli_args.sh"\
        cli_args.sh.in

