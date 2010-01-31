case $BASHISH_LANG in
*UTF-8) . $HOME/.bashish/bt/prompt/prompt.${SHELLNAME}.UTF-8
;;
*) . $HOME/.bashish/bt/prompt/prompt.${SHELLNAME}.CP437
esac
