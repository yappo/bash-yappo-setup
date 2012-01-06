#!/bin/sh
# curl -L https://raw.github.com/yappo/bash-yappo-setup/master/setup.sh | bash

# download
cd $HOME
#tmpname=`head -n 10 /dev/random | strings | perl -e 'my $str; while(<>){$str.=$_}$str =~ s/\W//g; $str =~ s/^(.{,32}).*$/$1/; print $str'`
workdir="$HOME/yappo-dotfiles"
echo $workdir
git clone git://github.com/yappo/bash-yappo-setup.git $workdir
cd $workdir

# copy files
for path in `ls -a`; do
    if [ $path = "setup.sh" -o $path = "." -o $path = ".." -o $path = ".git" -o $path = ".gitignore" ]; then
	continue;
    fi

    echo $path
    from="$workdir/$path"
    to="$HOME/$path"
    backup="$to.original"
    if [ -e $to ]; then
	echo "exists: $to";
	mv $to $backup
    fi

    ln -s $from $to
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
  PS1="[\H:\\\$(__git_ps1 \"%s)\")\w]\\\$ "
else
  PS1="[\H:\w]\\\$ "
fi

if [ -e "$HOME/.bashsiterc" ]; then
    source "$HOME/.bashsiterc"
fi
EOF
