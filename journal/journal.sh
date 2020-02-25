# ARGS
# NONE
# TODO: Add today [default], tomorrow, +N

TEMPLATE='template.txt'
F_FORMAT='+%Y-%m-%d'

if [ -z $1 ] || [ $1 == 'today' ]; then
    DATE="$(date $F_FORMAT)"
elif [ $1 == 'tomorrow' ]; then
    DATE="$(date -v+1d $F_FORMAT)"
else
    echo 'ERROR: input not understood'
    exit 100
fi

DATE="$DATE.txt"
echo "Editing file: $DATE"

if [ ! -f $DATE ]; then
    cat $TEMPLATE >> $DATE
fi

vi $DATE
