## Process this file with autoconf to produce a configure script.
AC_INIT([Bashish],[2.2.4],[thomas.eriksson@gmail.com],[bashish])

## Set up various programs needed for install
AC_PROG_INSTALL

## commented for now on

AC_ARG_WITH( 
	theme, 
	AS_HELP_STRING([--with-theme=THEME],[specify default theme for bashish]),
	[BASHISH_THEME=$withval]
)

## Set up install locations
if [[ "$prefix" = NONE ]]; then
	AC_DEFINE_UNQUOTED( [PREFIX], L"/usr/local", [Installation directory])
	AC_SUBST( PREFIX, /usr/local)
	export prefix=/usr/local
else
	AC_DEFINE_UNQUOTED( [PREFIX], L"$prefix", [Installation directory])
	AC_SUBST( PREFIX, [$prefix])
fi

AC_ARG_VAR( [docdir], [Documentation directory] )

if test -z $docdir; then
   AC_SUBST(docdir,[$datadir/doc/bashish])
fi

AC_DEFINE_UNQUOTED( DOCDIR, [L"$(eval echo $docdir)"], [Documentation directory] )

#AC_DEFINE_UNQUOTED( SYSCONFDIR, [L"$(eval echo $sysconfdir)"], [System configuration directory] )
#AC_SUBST( SYSCONFDIR, ["$(eval echo $sysconfdir)"] )

AC_CONFIG_FILES([data/main/prompt/sh/autoload data/bashish-version Makefile bashish.spec man/bashish.1 bin/bashish])
AC_OUTPUT

echo ""
echo "Bashish configuration:"
echo ""
echo "prefix: $PREFIX"
echo ""
echo "Now run 'make install'"
