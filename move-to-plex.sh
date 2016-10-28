#!/usr/bin/env bash

##################################################################################
## Change extension to .command to allow execution by double-clicking in Finder ##
##################################################################################

# activate debugging
set -x	

# fail on any errors
set -e


# Initialize profiling
exec 3>&2 2>>/usr/local/var/log/deluge/execute_script.log

PLEX_MEDIA_ROOT=/usr/local/var/plex/mediaroot

torrentid=$1
torrentname=$2
torrentpath=$3

mkdir -p /usr/local/var/log/deluge


echo "$(date)" 2>&1 >>/usr/local/var/log/deluge/execute_script.log
echo "Completed Torrent Details:" 2>&1 >>/usr/local/var/log/deluge/execute_script.log
echo "Name: $torrentname" 2>&1 >>/usr/local/var/log/deluge/execute_script.log
echo "Path: $torrentpath" 2>&1 >>/usr/local/var/log/deluge/execute_script.log
echo "Id: $torrentid" 2>&1 >>/usr/local/var/log/deluge/execute_script.log
echo "PLEX_MEDIA_ROOT: $PLEX_MEDIA_ROOT" 2>&1 >>/usr/local/var/log/deluge/execute_script.log
    

cp -Rf \
    "${torrentpath}/${torrentname}" \
    "${PLEX_MEDIA_ROOT}/Just Downloaded/" \
    2>&1 >>/usr/local/var/log/deluge/execute_script.log


/usr/local/bin/trash "${torrentpath}/${torrentname}" 2>&1 >>/usr/local/var/log/deluge/execute_script.log


# Turn off profiling
exec 2>&3 3>&-

