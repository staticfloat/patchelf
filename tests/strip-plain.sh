#! /bin/sh -e
set -x
SCRATCH=scratch/$(basename $0 .sh)

rm -rf ${SCRATCH}
mkdir -p ${SCRATCH}

cp main ${SCRATCH}/
cp libfoo.so ${SCRATCH}/
cp libbar.so ${SCRATCH}/

exitCode=0
(cd ${SCRATCH} && LD_LIBRARY_PATH=. strip -v main) || exitCode=$?
if test "$exitCode" != 0; then
    echo "bad strip exit code! ($exitCode)"
    exit 1
fi

exitCode=0
(cd ${SCRATCH} && LD_LIBRARY_PATH=. ./main) || exitCode=$?

if test "$exitCode" != 46; then
    echo "bad exit code! ($exitCode)"
    exit 1
fi
