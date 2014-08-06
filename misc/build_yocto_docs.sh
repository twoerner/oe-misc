#!/bin/bash
# adt-manual bsp-guide dev-manual kernel-dev mega-manual profile-manual ref-manual

pushd yocto-docs/documentation
	for DOC in adt-manual bsp-guide dev-manual kernel-dev profile-manual ref-manual; do
		make pdf DOC=$DOC
	done
popd

pushd bitbake/doc
	for DOC in bitbake-user-manual; do
		make pdf DOC=$DOC
	done
popd
