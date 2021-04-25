#!/bin/bash

function usage {
	cat <<EOF
IMPORTANT NOTE: Due to simplicity it is currently mandatory that the working directory is equal to the repository. WILL FAIL OTHERWISE!!!

This script is used to backup original dotfiles or install the ones from the repo:

	https://github.com/yschiebelhut/dotfiles

The repository is structured to represent the root directory of the target users home directory.
A backup will be made for any files that are contained both in the repo and in home.
The location of the backup will be .dot-backup unless specified differently.


Usage: setup.sh COMMAND [OPTIONS]

Available commands:
	backup:		just make sure all files are backuped
			if a different destination than .dot-backup is desired,
			this can be specified as option

	install:	install the dotfiles to the current users home directory

	restore:	restore the original dotfiles from the backup
			backup locations different than .dot-backup can be specified as option
EOF
}

function backup {
	echo -e "backing up..."

	if [[ $# -ne 0 ]]; then
		BACKUP_DIR="$1"
	else
		BACKUP_DIR=".dot-backup"
	fi

	if [[ -d "$TESTHOME/$BACKUP_DIR" ]] || [[ -f "$TESTHOME/$BACKUP_DIR" ]]; then
		echo -e "file or directory $TESTHOME/$BACKUP_DIR exists in filesystem\nDO NOT proceed if you aren't 100% confident about what you're doing!!!"
		read -p "Do you want to overwrite? [y/N]" yn
		if [[ $yn != y ]]; then
			echo "cancelling..."
			return 1
		fi
		echo "overwriting..."
	fi

	for i in $(find . -type d); do
		if [[ "$i" != "./.git"* ]] && [[ "$i" != . ]]; then
			if [[ -d "$TESTHOME/$i" ]]; then
				mkdir -p "$TESTHOME/$BACKUP_DIR/$i"
			fi
		fi
	done
	for i in $(find . -type f); do
		if [[ "$i" != ./setup.sh ]]; then
			if [[ -f "$TESTHOME/$i" ]]; then
				cp "$TESTHOME/$i" "$TESTHOME/$BACKUP_DIR/$i"
			fi
		fi
	done

	echo -e "backup done!"
}

function install {
	echo -e "installing..."

	read -p "Do you want to create a backup before proceeding? [Y/n]" yn
	if [[ "$yn" == Y ]] || [[ "$yn" == "" ]]; then
		echo -e "\n"
		backup || exit 2
		echo -e "\n"
	elif [[ "$yn" != n ]]; then
		exit
	fi

	# create non existing directories in destination
	for i in $(find . -type d); do
		if [[ "$i" != "./.git"* ]] && [[ "$i" != . ]]; then
			mkdir -p "$TESTHOME/$i"
		fi
	done
	# create a symlink to every file in the repo, overwriting previously existing files
	for i in $(find . -type f); do
		if [[ "$i" != "./.git"* ]] && [[ "$i" != ./setup.sh ]]; then
			ln -sf "$PWD/$i" "$TESTHOME/$i"
		fi
	done

	echo -e "installation done!"
}

function restore {
	echo -e "restoring..."

	if [[ $# -ne 0 ]]; then
		BACKUP_DIR="$1"
	else
		BACKUP_DIR=".dot-backup"
	fi

	if [[ ! -d "$TESTHOME/$BACKUP_DIR" ]]; then
		echo -e "$BACKUP_DIR was not found in the filesystem, aborting. Please try again with a vaild backup directory."
		exit 3
	fi

	# remove all symlinks for files in repo
	for i in $(find . -type f); do
		if [[ "$i" != "./.git"* ]] && [[ "$i" != ./setup.sh ]]; then
			rm "$TESTHOME/$i"
		fi
	done

	# remove all symlinks for files in BACKUP_DIR in case repo does not contain some anymore
	for i in $(find "$TESTHOME/$BACKUP_DIR" -type f | sed "s/$BACKUP_DIR/./"); do
		if [[ -f "$i" ]] || [[ -L "$i" ]]; then
			rm "$i"
		fi
	done

	# create directories from backup in HOME in case they were deleted
	for i in $(find "$TESTHOME/$BACKUP_DIR" -type d | sed "s/$BACKUP_DIR/./"); do
		mkdir -p "$i"
	done

	for i in $(find "$TESTHOME/$BACKUP_DIR" -type f); do
		RESTORE_PATH=$(echo "$i" | sed "s/$BACKUP_DIR/./")
		cp "$i" "$RESTORE_PATH"
	done

	echo -e "restoring complete!"
}


if [ $# -lt 1 ]; then
	usage
	exit

else
	TESTHOME="/home/sarius/dotfoo"
	case $1 in
		'backup')
			backup $2
			exit;;
		'install')
			install
			exit;;
		'restore')
			restore $2
			exit;;
		* )
			usage
			exit;;
	esac
fi


# ls foo > /dev/null 2>&1 && echo yes || echo false
