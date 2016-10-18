#!/bin/bash

YOCTODOCS="adt-manual bsp-guide dev-manual kernel-dev profile-manual ref-manual sdk-manual toaster-manual"

echo "yocto docs"
pushd yocto-docs/documentation > /dev/null 2>&1
if [ $? -ne 0 ]; then
	echo "can't find yocto docs"
else
	for DOC in $YOCTODOCS; do
		make pdf DOC=$DOC
	done
	popd > /dev/null 2>&1
fi

echo ""
echo "bitbake doc"
pushd bitbake/doc > /dev/null 2>&1
if [ $? -ne 0 ]; then
	echo "can't find bitbake docs"
else
	make pdf DOC=bitbake-user-manual
	popd > /dev/null 2>&1
fi
