#!/bin/sh
## it wasn't me
cat Makefile.in.mk >Makefile.in
bash mmmkayfile >> Makefile.in
autoconf
if test -d autom4te.cache
then
	rm -f autom4te.cache/*
	rm -r autom4te.cache
fi
#rm -f autom4te.cache/*
#rm -r autom4te.cache
./configure
