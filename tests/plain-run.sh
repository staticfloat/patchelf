#! /bin/sh
LD_LIBRARY_PATH=. ./main
exitCode=$?
if test "$exitCode" != 46; then
    echo "bad exit code! ($exitCode)"
    exit 1
fi
