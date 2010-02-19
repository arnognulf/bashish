#!/bin/sh
## simple autogen.sh file
cat Makefile.in.mk >Makefile.in
bash mmmkayfile >> Makefile.in
autoconf
if test -d autom4te.cache
then
	rm -f autom4te.cache/*
	rm -r autom4te.cache
fi
./configure "$@"
