#!/usr/bin/env bash
#
# Bash Helper functions

# auto detect extraction method
#

extract () {
   if [ -f $1 ] ; then
       case $1 in
	*.tar.bz2)	tar xvjf $1 && cd $(basename "$1" .tar.bz2) ;;
	*.tar.gz)	tar xvzf $1 && cd $(basename "$1" .tar.gz) ;;
	*.tar.xz)	tar Jxvf $1 && cd $(basename "$1" .tar.xz) ;;
	*.bz2)		bunzip2 $1 && cd $(basename "$1" /bz2) ;;
	*.rar)		unrar x $1 && cd $(basename "$1" .rar) ;;
	*.gz)		gunzip $1 && cd $(basename "$1" .gz) ;;
	*.tar)		tar xvf $1 && cd $(basename "$1" .tar) ;;
	*.tbz2)		tar xvjf $1 && cd $(basename "$1" .tbz2) ;;
	*.tgz)		tar xvzf $1 && cd $(basename "$1" .tgz) ;;
	*.zip)		unzip $1 && cd $(basename "$1" .zip) ;;
	*.Z)		uncompress $1 && cd $(basename "$1" .Z) ;;
	*.7z)		7z x $1 && cd $(basename "$1" .7z) ;;
	*)		echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }


# fix file names in current folder
# replace " " with "_"
function fixnames_fn() {
	for file in *;
		do [ -f "$file" ] && ( mv "$file" "$(echo $file | sed -e 's/ /_/g')" );
	done
}

#list largest files/folders in directory
#if no directory is specified, use PWD
#if no number is specified, use 10
function largest_files() {
	DIRECTORY=$PWD
	NUMBER=10

	while [ $# -gt "0" ]; do
		case $1 in
			-d | --directory )	shift
						if [ -d "$1" ]; then
							DIRECTORY="$1"
						else
							echo "invalid directory: $1"
						fi
						shift
						;;
			-n | --number )		shift
						if [[ "$1" =~ ^[0-9," ",.]{1,4}$ ]] ; then
							NUMBER="$1"
						else
							echo "invalid integer:$1"
						fi
						shift
						;;
			* )			shift
						;;
		esac
	done

	du -a "$DIRECTORY" | sort -n -r | head -n $NUMBER

}

# various aliases for list command options
alias ll='\ls -lh --group-directories-first'
alias ls='\ls -hF --color'  # add colors for filetype recognition
alias la='\ls -Alh'          # show hidden files
alias lx='\ls -lXBh'         # sort by extension
alias lk='\ls -lSrh'         # sort by size, biggest last
alias lc='\ls -ltcrh'        # sort by and show change time, most recent last
alias lu='\ls -lturh'        # sort by and show access time, most recent last
alias lt='\ls -ltrh'         # sort by date, most recent last
alias lm='\ls -alh |more'    # pipe through 'more'
alias lr='\ls -lRh'          # recursive ls
alias tree='\tree -Csu'     # nice alternative to 'recursive ls'

# watch progress of process
alias status="watch -n 30 kill -USR1"

# progress bar on file copy. Useful evenlocal.
alias cpProgress="rsync --progress -ravz"

# fix file names
alias fixnames=fixnames_fn

# show top 10 largest files
alias largest=largest_files

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#make mount output prettier
alias mount='mount |column -t'


