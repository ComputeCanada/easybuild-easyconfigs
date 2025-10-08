#!/bin/bash
# Move CUDA from temp place to final installation directory

instdir=""
for argument in "$@"; do
	if [[ $argument =~ ^--installdir=.*$ ]]; then
		instdir=${argument/--installdir=/}
	fi
done

rm -rf $instdir
mv 1* $instdir

