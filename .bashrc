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
alias dbdrop="php app/console doctrine:database:drop --force"
alias dbcreate="php app/console doctrine:database:create"
alias domimi="php app/console doctrine:migrations:migrate --no-interaction"
alias domidi="php app/console doctrine:migrations:diff"
alias domist="php app/console doctrine:migrations:status"
alias dofilo="php app/console doctrine:fixtures:load --no-interaction"
alias rodeb="php app/console debug:router"
alias codeb="php app/console debug:container --show-private"
alias dosup="php app/console doctrine:schema:update"
alias dogeen="php app/console doctrine:generate:entities"
alias sf="php app/console"

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
