#!/bin/bash

if [[ ${CDPATH-} = "" ]] ; then
	export CDPATH=.
fi

CD_PATHS=()
CD_PATHS+=($HOME/git)
CD_PATHS+=($HOME/local)
CD_PATHS+=($HOME/local/git)

for CD_PATH in "${CD_PATHS[@]}" ; do
	CD_PATH_REGEX="(^|:)$CD_PATH(:|$)"
	if [[ -d "$CD_PATH" ]] && [[ ! ${CDPATH-} =~ $CD_PATH_REGEX ]] ; then
		# Add CD_PATH to CDPATH
		export CDPATH+=:${CD_PATH// /\\ }
	fi
done


# Some ENV variables for useful paths
WINDOWS_TERMINAL_PROFILES_JSON="/mnt/c/Users/$USER/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState"

