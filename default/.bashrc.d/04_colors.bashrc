#!/usr/bin/env bash
#
# function to set terminal colors


#
# Colorcodes
#

__COLOR() {
	# Set terminal colors
	#
	# Given a color name and modifiers, build color_cmd
	# starting from the 8 basic colors
	#   - add 60 for bright/high intensity

	local arg_bg=false
	local arg_bright=false
	local arg_class=0
	local arg_color
	local fg_color_cmd=""
	local bg_color_cmd=""
	local color_cmd=""
	local arg_message=""

	# Reset
	local reset="0"

	# Regular Colors
	local black="30"
	local red="31"
	local green="32"
	local yellow="33"
	local blue="34"
	local purple="35"
	local cyan="36"
	local gray="37"
	local white="37"

	while (( $# )) ; do
		case $1 in
			normal)
				arg_class="0"
				;;
			bold)
				arg_class="1"
				;;
			underline)
				arg_class="4"
				;;
			bg)
				arg_bg=true
				;;
			bright)
				arg_bright=true
				;;
			-m | --message)
				shift
				arg_message+="$1"
				;;
			*)
				if [[ ${!1-notset} = notset ]] ; then
					echo "Invalid color '$1'" >&2
				else
					arg_color="${!1}"
				fi
				;;
		esac
		shift

		# build command if $arg_color is set
		if [[ ${arg_color-""} != "" ]] ; then
			if ${arg_bg-false} ; then
				(( arg_color += 10 ))
				bg_color_cmd="$arg_color"
			else
				${arg_bright-false} && (( arg_color += 60 ))
				fg_color_cmd=""
				[[ "${arg_class-}" != "" ]] && fg_color_cmd+="${arg_class};"
				fg_color_cmd+="$arg_color"
			fi

			# Reset flags
			arg_bg=false
			arg_bright=false
			arg_class=""
			arg_color=""
			arg_color_cmd=""
		fi
	done
	color_cmd=""
	[[ "${bg_color_cmd-}" != "" ]] && color_cmd+="$bg_color_cmd"

	if [[ "${fg_color_cmd-}" != "" ]] ; then
		[[ "${color_cmd}" != "" ]] && color_cmd+=";"
		color_cmd+="$fg_color_cmd"
	fi

	echo -ne "\033[${color_cmd}m"

	if [[ ${arg_message-} != "" ]] ; then
		echo "$arg_message"
		echo -ne "\033[${reset}m"
	fi
}

