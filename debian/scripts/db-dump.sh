#!/bin/bash
readonly FILE="$(hostname --fqdn)-$(date --iso-8601)-db.dump"
readonly TARBALL=$FILE.tar.gz

echo [*] preparing database dump: $FILE
pg_dumpall -f $(hostname --fqdn)-$(date --iso-8601)-db.dump

echo [*] compressing dump file
tar -cvzf $TARBALL $FILE

echo [*] shreding dump file $FILE
shred $FILE

echo [*] removing dump file $FILE
rm $FILE

echo [*] removing dump tarball $TARBALL /tmp/
mv $TARBALL /tmp/
