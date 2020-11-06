#! /bin/bash
set -e

# ARGS
# 1 - Relative date. E.g.: -1=yesterday, -2=two days ago, +3=three days in the future

TEMPLATE_FILE='template'
F_FORMAT='+%Y-%m-%d'

# TODO: 
### For MAC
#   "-v+1d" 
### For Ubuntu
#   "-d '+1 day'"

if [ -z "$1" ]; then
    DATE="$(date $F_FORMAT)"
else
    case uname in
    'Darwin')
        DATE="$(date "-v$1d" $F_FORMAT)"
        ;;
    'Linux')
        DATE="$(date -d "$1 day" $F_FORMAT)"
        ;;
    *)
        DATE="$(date -d "$1 day" $F_FORMAT)"
        ;;
    esac
fi

if [ -z "$DATE" ]; then
    echo "ERROR: date is empty "
    exit 102
fi

FILENAME="$DATE.md"

if [ ! -f $FILENAME ]; then
    echo "Creating new file: $FILENAME"
    cp $TEMPLATE_FILE $FILENAME
else
    echo "Editing existing file: $FILENAME"
fi

vi $FILENAME


### UBUNTU date VERSION
# date (GNU coreutils) 8.28
# Copyright (C) 2017 Free Software Foundation, Inc.
# License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
# This is free software: you are free to change and redistribute it.
# There is NO WARRANTY, to the extent permitted by law.
# 
# Written by David MacKenzie.
