#!/bin/bash -ex

#
# Script to start xsp4 on port 8123 and send all output to /tmp/xsp2.log
#

pushd .

cd `dirname $0`

make -C .. all
#ROOT=`readlink -f $PWD/..`
ROOT=$PWD/..

export MONO_TLS_SESSION_CACHE_TIMEOUT=0

MONO_OPTIONS="--debug $MONO_OPTIONS" xsp4 --port 8123 --root $ROOT --applications /WebServices:$ROOT/MonkeyWrench.Web.WebService/,/:$ROOT/MonkeyWrench.Web.UI --nonstop >> /tmp/xsp2.log 2>&1

popd

