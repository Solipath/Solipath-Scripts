#!/usr/bin/env bash

get_solipath_for_each_operating_system(){

	local uname_m_output=$(uname -m)
	echo "$uname_m_output"
	case "$uname_m_output" in
		aarch64) local architecture="aarch64"
			;;
		arm64) local architecture="aarch64"
			;;
		x86_64) local architecture="x86_64"
			;;
		amd64) local architecture="x86_64"
			;;
		*) local architecture="UNKNOWN"
	esac


	local uname_s_output=$(uname -s)
	echo "$uname_s_output"
	case "$uname_s_output $architecture" in
		Linux*x86_64) local operating_system="https://github.com/Solipath/Solipath/releases/download/latest-linux_x86_64/solipath"
			;;
		Linux*aarch64) local operating_system="https://github.com/Solipath/Solipath/releases/download/latest-linux_aarch64/solipath"
			;;
		Darwin*x86_64) local operating_system="https://github.com/Solipath/Solipath/releases/download/latest-macos_x86_64/solipath"
			;;
		Darwin*aarch64) local operating_system="https://github.com/Solipath/Solipath/releases/download/latest-macos_aarch64/solipath"
			;;
		CYGWIN*x86_64) local operating_system="https://github.com/Solipath/Solipath/releases/download/latest-windows_x86_64/solipath.exe"
			;;
		MINGW64*x86_64) local operating_system="https://github.com/Solipath/Solipath/releases/download/latest-windows_x86_64/solipath.exe"
			;;
		*)	local operating_system="UNKNOWN:${unameOut}"
	esac
}

if [ ! -f ~/solipath/solipath ]; then
	curl -L "$(get_solipath_for_each_operating_system)" -o ~/solipath/solipath
	chmod +x ~/solipath/solipath
fi
~/solipath/solipath "$@"
