#!/usr/bin/env bash

get_solipath_for_each_operating_system(){
	local uname_s_output=$(uname -s)
	case "$uname_s_output" in
		Linux*) local operating_system="https://github.com/Solipath/Solipath/releases/download/latest-ubuntu_x86_64/solipath"
			;;
		Darwin*) local operating_system="https://github.com/Solipath/Solipath/releases/download/latest-macos_x86_64/solipath"
			;;
		CYGWIN*) local operating_system="https://github.com/Solipath/Solipath/releases/download/latest-windows_x86_64/solipath.exe"
			;;
		*)	local operating_system="UNKNOWN:${unameOut}"
	esac
	echo "$operating_system"
}

curl --url "$(get_solipath_for_each_operating_system)" -o ~/solipath/solipath