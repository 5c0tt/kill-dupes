#!/bin/bash
# Will remove duplicate files from a directory based on cksum
cd /Volumes/vorbis/images
pwd
ls -la | wc -l 
rm /tmp/filelist
find . -maxdepth 1 -type f | xargs -n 100 cksum > /tmp/filelist
rm -v `cat /tmp/filelist | sort | awk 'BEGIN {c=0} {if ($1 == c) print $3; c=$1}'`
rm /tmp/filelist
ls -la | wc -l
