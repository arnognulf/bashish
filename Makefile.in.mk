##
## Copyright (C) 2006 Thomas Eriksson
##
## This program is free software; you can redistribute it and/or
## modify it under the terms of the GNU General Public License
## as published by the Free Software Foundation; either version 2
## of the License, or (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program; if not, write to the Free Software
## Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
##

## Makefile for the bashish theme engine. Can install bashish, 
## create packages in tar.gz and rpm formats.
##

BASHISH_SHELL := @BASHISH_SHELL@
INSTALL := @INSTALL@

prefix = @prefix@
PACKAGE_TARNAME = @PACKAGE_TARNAME@
exec_prefix = @exec_prefix@
datarootdir = @datarootdir@
datadir = @datadir@
bindir = @bindir@
mandir = @mandir@
sysconfdir = @sysconfdir@
docdir = @docdir@
pkgdatadir = $(datadir)/bashish

##
## Generate file headers for scripts
##

bashish:
	for i in bin/bashish bin/bashishtheme; do\
		./genheader $(BASHISH_SHELL) $(datadir)/bashish >$$i; \
		cat $$i.in >>$$i; \
	done;

## Copy all the source files into a new directory and use tar to create
## an archive from it. Simplest way I could think of to make an archive
## witout backups, autogenerated files, etc.
##
## Uses install instead of mkdir so build won't fail if the directory 
## exists
tar: 	distclean
	rm -f Makefile
	( cd ..;tar cvf @PACKAGE_TARNAME@-@PACKAGE_VERSION@.tar @PACKAGE_TARNAME@-@PACKAGE_VERSION@ )

tar.gz: tar
	gzip -9 -c ../@PACKAGE_TARNAME@-@PACKAGE_VERSION@.tar > ../@PACKAGE_TARNAME@-@PACKAGE_VERSION@.tar.gz

rpm:	tar.gz
	cp ../@PACKAGE_TARNAME@-@PACKAGE_VERSION@.tar.gz ${HOME}/redhat/SOURCES
	rpmbuild --nodeps -bb bashish.spec

dist:	distclean tar.gz rpm

clean:
	rm -f data/bashish_version data/lib/_bashish_launcher
	rm -f bin/bashish bin/bashishtheme
	rm -f man/*.1

distclean: clean
	rm -f config.log config.status
