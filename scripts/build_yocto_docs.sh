#!/bin/bash

YOCTODOCS="adt-manual bsp-guide dev-manual kernel-dev profile-manual ref-manual sdk-manual test-manual toaster-manual"

echo "yocto docs"
pushd yocto-docs/documentation > /dev/null 2>&1
if [ $? -ne 0 ]; then
	echo "can't find yocto docs"
else
	for DOC in $YOCTODOCS; do
		make pdf DOC=$DOC
	done
fi
popd > /dev/null 2>&1

echo "yocto html-only docs"
pushd yocto-docs/documentation > /dev/null 2>&1
if [ $? -ne 0 ]; then
	echo "can't find yocto docs"
else
	for HTML in mega-manual yocto-project-qs; do
		make html DOC=$HTML
	done
fi
popd > /dev/null 2>&1

echo ""
echo "bitbake doc"
pushd bitbake/doc > /dev/null 2>&1
if [ $? -ne 0 ]; then
	echo "can't find bitbake docs"
else
	make pdf DOC=bitbake-user-manual
fi
popd > /dev/null 2>&1
