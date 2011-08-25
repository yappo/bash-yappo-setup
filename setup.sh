#!/bin/sh
# curl -L https://raw.github.com/yappo/bash-yappo-setup/master/setup.sh | bash

# download
cd /tmp
tmpname=`head -n 10 /dev/random | strings | perl -e 'my $str; while(<>){$str.=$_}$str =~ s/\W//g; $str =~ s/^(.{,32}).*$/$1/; print $str'`
echo $tmpname
git clone git://github.com/yappo/bash-yappo-setup.git $tmpname
cd $tmpname

# copy files
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

cat <<EOF >> "$HOME/.bashrc"
export EDITOR=vim

# perlbrew
if [ -e "$HOME/perl5/perlbrew/etc/bashrc" ]; then
    source $HOME/perl5/perlbrew/etc/bashrc"
elif [ -e "$HOME/perl5/etc/bashrc" ]; then
    source $HOME/perl5/etc/bashrc"
fi

# git completaion
if [ -r "$HOME/.bash_completion.d/git" ]; then # = git-completion.bash
  source "$HOME/.bash_completion.d/git"
  PS1="[\H:\$(__git_ps1 \"%s)\")\w]\\$ "
else
  PS1="[\H:\w]\\$ "
fi

if [ -e "$HOME/.bashsiterc" ]; then
    source "$HOME/.bashsiterc"
fi
EOF


# cleanup
cd /tmp
rm -fr $tmpname
