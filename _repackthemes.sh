#!/bin/bash
for i in data/themes/ascii-art/* data/themes/computer/* data/themes/app/*
do
	case ${i} in
	*.bt)	:;;
	*)	echo "$0: packing $i"
		tar czf "$i".bt	"$i"
	esac
done

	