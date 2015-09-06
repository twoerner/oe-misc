#!/bin/bash

if [ -z "$1" ]; then
	echo "required git command argument missing"
	exit 1
fi
GITCMD="$1"

FAILED=""

for GITDIR in `find . -maxdepth 2 -name .git -print | grep -v FAILED | sort`; do
	DIR=`dirname $GITDIR`

	# check this isn't a build directory
	echo $DIR | grep "build/tmp" > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "skipping build dir: $DIR"
		continue
	fi

	echo "working in $DIR"
	pushd $DIR > /dev/null
	COUNT=0
	while [ 1 ]; do
		echo "attempt $COUNT"
		git "$GITCMD"
		if [ $? -ne 0 ]; then
			COUNT=`expr $COUNT + 1`
			if [ $COUNT -gt 10 ]; then
				echo "giving up on $DIR"
				FAILED="$FAILED $DIR"
				break
			fi
		else
			break
		fi
	done

	if [ x"$GITCMD" = x"pull" ]; then
		DIRNAME=$(basename $(pwd))
		if [ x"$DIRNAME" = x"meta-openembedded" -o x"$DIRNAME" = x"openembedded-core" -o x"$DIRNAME" = x"meta-poky" ]; then
			git remote -v | grep contrib > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				echo "fetching contrib"
				git fetch contrib

				# cleanup stale branches
				echo "pruning contrib branches"
				git remote prune contrib
			fi
		fi
	fi

	popd > /dev/null
	echo ""
done

if [ -n "$FAILED" -a "$GITCMD" = "pull" ]; then
	echo "FAILED: $FAILED"

	for REP in $FAILED; do
		echo "re-cloning failed repository $REP"
		pushd $REP
			REMOTE=$(git remote -v | grep fetch | head -1 | cut -f2 | cut -d' ' -f1)
		popd
		git clone $REMOTE ${REP}.new
		if [ $? -eq 0 ]; then
			mkdir -p FAILED
			mv $REP FAILED
			mv ${REP}.new $REP
		else
			echo "clone failure on $REP"
		fi
	done
fi
