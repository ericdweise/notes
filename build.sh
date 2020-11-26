#!/bin/bash
set -e


function convert {
    INFILE=$1
    OUTFILE=$(echo $INFILE | sed -r 's/.md/.html/')
    echo "$INFILE ---> $OUTFILE"
    echo '<!DOCTYPE html>' > $OUTFILE
    echo '<html lang="en">' >> $OUTFILE
    cat assets/parts/head.html >> $OUTFILE
    echo '<body>' >> $OUTFILE
    cat assets/parts/header.html >> $OUTFILE
    pandoc --from=markdown --to=html5 --mathjax $INFILE >> $OUTFILE
    cat assets/parts/footer.html >> $OUTFILE
    echo '</body>' >> $OUTFILE
    echo '</html>' >> $OUTFILE
}


if [ "$#" -gt 0 ]; then
    for FILE in "$*"; do
        convert $FILE
    done
else
    for FILE in $(find . -type f | grep -e '\.md$'); do
        convert $FILE
    done
fi

