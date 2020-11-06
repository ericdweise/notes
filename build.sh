#!/bin/bash
set -e


for INFILE in $(find . -type f | grep -e '\.md$'); do
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
done

