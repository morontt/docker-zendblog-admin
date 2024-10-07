umask 002

export TERM=xterm

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -ahl'
alias ownr='chown -R www-data:www-data .'
alias csfix='bin/php-cs-fixer fix'
alias composer='php -d memory_limit=-1 /usr/local/bin/composer'
alias dbdrop="php bin/console doctrine:database:drop --force"
alias dbcreate="php bin/console doctrine:database:create"
alias domimi="php bin/console doctrine:migrations:migrate --no-interaction"
alias domidi="php bin/console doctrine:migrations:diff"
alias domist="php bin/console doctrine:migrations:status"
alias dofilo="php bin/console doctrine:fixtures:load --no-interaction"
alias rodeb="php bin/console debug:router"
alias codeb="php bin/console debug:container --show-private"
alias dosup="php bin/console doctrine:schema:update --dump-sql"
alias dogeen="php bin/console doctrine:generate:entities"
alias sf="php bin/console"

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
