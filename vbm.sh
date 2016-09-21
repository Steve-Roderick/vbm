#!/bin/bash
# vbm.sh - minimal wrapper for VBoxManager
#
# Copyright (C) 2016 Steve Hayes
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
set -e 

usage() {
    cat <<EOF
USAGE:
   vm.sh [start|stop] <Virtual Box Name> # Start or stop a vm.
   vm.sh status # List running VMS.
   vm.sh ls # List available VMS.
   vm.sh [-h|--help]
EOF
}

# Require number of argument is 1 or 2.
case $# in
    1)
	;;
    2)
	;;
    *)
	>&2 usage; exit 1; ;;
esac

action="$1"
vm_name="$2"

case "$action" in
    'start')
	! test -z "$vm_name"
	VBoxManage startvm "$vm_name" --type headless; ;;
    'stop')
	! test -z "$vm_name"
	VBoxManage controlvm "$vm_name" poweroff; ;;
    'status')
	VBoxManage list runningvms; ;;
    'ls')
	VBoxManage list vms; ;;
    '-h'|'--help')
	usage
	exit 0; ;;
    *)
	>&2 usage
	exit 1; ;;
esac


