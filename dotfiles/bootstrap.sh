#!/bin/sh

CONFDIR=$(dirname $0)
CONFDIR=$(realpath $CONFDIR)
export CONFDIR

. $CONFDIR/bootstrap_func.sh

ln_files_in "zsh"
ln_files_in "git"
ln_files_in "tmux"
ln_file "zprezto/modules/prompt/functions/prompt_josa_setup"
ln_files_in "atom" ".atom/"
