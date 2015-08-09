#!/bin/sh

set -e

ULOCAL="/usr/local"

[ -d "$ULOCAL" ] || sudo mkdir "$ULOCAL"
sudo chgrp admin "$ULOCAL"
sudo chmod g+rwx "$ULOCAL"

[ -x "`which babushka`" ] || sh -c "`curl https://babushka.me/up`"

babushka sources --add osx https://github.com/quad/osx
babushka osx:laptop
