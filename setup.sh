#!/bin/sh

home=$HOME
for path in `ls -a`; do
    if [ $path = "setup.sh" -o $path = "." -o $path = ".." ]; then
	continue;
    fi

    echo $path
    to="$HOME/$path"
    backup="$to.original"
    if [ -e $to ]; then
	echo "exists: $to";
	mv $to $backup
    fi

    cp -fr $path $to
done

# finalize
touch "$HOME/.emacs.d/conf/init-siteconf.el"

echo "export EDITOR=vim" >> "$HOME/.bashrc"
