#!/bin/bash
# Wrapper to use bwrap for more efficient installation of CUDA
# Use as cuda-installer to wrap cuda-installer.orig

instdir=""
for argument in "$@"; do
	if [[ $argument =~ ^--toolkitpath=.*$ ]]; then
		instdir=${argument/--toolkitpath=/}
	fi
	if [[ $argument =~ ^--samplespath=.*$ ]]; then
		tmpdir=${argument/--samplespath=/}
	fi
done

export instdir
instdir_parent=$(dirname "$instdir")

rm -rf $instdir
bwrap --dev-bind / / --bind "$tmpdir" "$instdir_parent" bash -c '
	./cuda-installer.orig "$@"
	for dir in "$instdir"/{bin,nvvm}; do setrpaths.sh --path "$dir"; done
	for dir in "$instdir"/{c,e,g,nsight,t}*; do setrpaths.sh --path "$dir" --add_origin; done
' "$0" "$@"
