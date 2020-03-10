# ARGS
# NONE
# TODO: Add today [default], tomorrow, +N

TEMPLATE='template.txt'
F_FORMAT='+%Y-%m-%d'

# TODO: 
### For MAC
#   "-v+1d" 
### For Ubuntu
#   "-d '+1 day'"
if [ -z $1 ] || [ $1 == 'today' ]; then
    DATE="$(date $F_FORMAT)"
elif [ $1 == 'tomorrow' ]; then
    if [ $(uname) == 'Darwin' ]; then
        DATE="$(date -v+1d $F_FORMAT)"
    else
        DATE="$(date -d '+1 day' $F_FORMAT)"
    fi
elif [ $1 == 'yesterday' ]; then
    if [ $(uname) == 'Darwin' ]; then
        DATE="$(date -v-1d $F_FORMAT)"
    else
        DATE="$(date -d '-1 day' $F_FORMAT)"
    fi
else
    echo 'ERROR: input not understood'
    exit 100
fi

if [ $? != 0 ] ; then
    echo "ERROR: date command exited with code $?"
    exit 101
fi

if [ -z $DATE ]; then
    echo "ERROR: date is empty "
    exit 102
fi

DATE="$DATE.txt"

if [ ! -f $DATE ]; then
    cat $TEMPLATE >> $DATE
    echo "Creating new file: $DATE"
else
    echo "Editing existing file: $DATE"
fi

vi $DATE


### UBUNTU date VERSION
# date (GNU coreutils) 8.28
# Copyright (C) 2017 Free Software Foundation, Inc.
# License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
# This is free software: you are free to change and redistribute it.
# There is NO WARRANTY, to the extent permitted by law.
# 
# Written by David MacKenzie.
