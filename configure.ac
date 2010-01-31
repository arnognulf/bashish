## Process this file with autoconf to produce a configure script.
AC_INIT([Bashish],[2.0.7], [thomas.eriksson@gmail.com], [bashish])

## Set up various programs needed for install
AC_PROG_INSTALL

## The file header for 'bashish', 'bashishtheme' and the wrapper needs 
## to point to a shell capable of parsing bashish. Currently, only bash 
## is supported, but one day eg. zsh might be able to parse the funky parts of bashish.
## Users that for some reason does not have bash in their path or have bash
## renamed also need this section.
AC_ARG_WITH( 
	shell, 
	AC_HELP_STRING([--with-shell=PROG],
	[specify full path to a shell interpreter for bashish]),
	[BASHISH_SHELL=$withval]
)

if test "x$BASHISH_SHELL" = x; then
	AC_PATH_PROG( BASHISH_SHELL, [bash])
	
	if test "x$BASHISH_SHELL" = x;then
		echo Could not find the bash shell in your path.
		echo This program is needed to install bashish.
		echo Please install it and try again.
		exit 1
	fi
else
	AC_PATH_PROG( BASHISH_SHELL, $withval )
	
	if ! test -f "$BASHISH_SHELL";then
		echo Could not find the specified shell.
		echo This program is needed to install bashish.
		echo Please install it and try again.
		exit 1
	fi
fi

## commented for now on

AC_ARG_WITH( 
	theme, 
	AC_HELP_STRING([--with-theme=THEME],
	[specify default theme for bashish]),
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

AC_CONFIG_FILES([Makefile bashish.spec data/bashish-version man/bashish.1 man/bashishtheme.1 data/lib/_bashish_bashish_subproc data/lib/_bashish_fork data/lib/_bashish_launcher data/lib/_bashish_prompt_cwd data/lib/_bashish_prompt_fillx data/lib/_bashish_prompt_testloc data/lib/_bashish_subproc ])
AC_OUTPUT

echo ""
echo "Bashish configuration:"
echo ""
echo "prefix: $PREFIX"
echo "shell:  $BASHISH_SHELL"
echo ""
echo "Now run 'make' and 'make install'"
