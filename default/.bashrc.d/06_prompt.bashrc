#!/usr/bin/env bash
#
# customized command prompt
#
# ┌[<day>  <month> <HH:mm:ss>]
# ├[<user>@<host>:<current dir>]
# └[<line #>]:
#

if [[ -x ~/.bashrc.d/bash_completion.d ]] ; then
	. ~/.bashrc.d/bash_completion.d/git-prompt.sh
fi

# Ensure function __git_ps1() exists
if ! [[ $( type -t __git_ps1 ) =~ function ]] ; then
	# stub __git_ps1 so bash prompt doesn't throw a bunch of errors
	__git_ps() { return 0; }
fi

PS1_BORDER_COLOR="bright bold white"
PS1_TIMESTAMP_COLOR="bold cyan"
PS1_USER_COLOR="green"
PS1_WORKDIR_COLOR="cyan"
PS1_CMDNUMBER_COLOR="bright red"
PS1_SEPARATOR_COLOR="bright bold green"
PS1_TEXT_COLOR="reset"

PS1_BACK=''
PS1_DATELINE="\[`__COLOR $PS1_BORDER_COLOR`\]┌[\[`__COLOR $PS1_TIMESTAMP_COLOR`\]\D{%F} \T\[`__COLOR $PS1_BORDER_COLOR`\]]"
PS1_HOST_DIR="\[`__COLOR $PS1_BORDER_COLOR`\]├[\[`__COLOR $PS1_USER_COLOR`\]\u@\h\[`__COLOR $PS1_SEPARATOR_COLOR`\]:\[`__COLOR $PS1_WORKDIR_COLOR`\]\w\[`__COLOR $PS1_BORDER_COLOR`\]]"
PS1_PROMPT="\[`__COLOR $PS1_BORDER_COLOR`\]└[\[`__COLOR $PS1_CMDNUMBER_COLOR`\]\!\[`__COLOR $PS1_BORDER_COLOR`\]]\[`__COLOR $PS1_TEXT_COLOR`\]:\$ "

PS1=\
${PS1_BACK}'\n'\
${PS1_DATELINE}' $(__git_ps1 " (%s)")\n'\
${PS1_HOST_DIR}'\n'\
${PS1_PROMPT}


