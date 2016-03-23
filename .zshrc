export DOTSDIR=${HOME}/dotfiles
source "$DOTSDIR/set_proxy_by_dns.sh"

autoload -U compinit
compinit 

#rbenvの初期化設定
export PATH="$HOME/.rbenv/bin:$PATH"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

#group-manager関係
export SMTP_ADRESS=smtp.gmail.com
export SMTP_PORT=587
export EMAIL_DOMAIN=gmail.com
export SMTP_AUTH=plain
export SMTP_TLS=false
export EMAIL_USERNAME=n.iyama0709@gmail.com
export EMAIL_BCC='n.iyama0709@gmail.com'
export EMAIL_PASSWORD=iiyaman # gmailの場合は2段階認証を設定後, アプリ固有のパスワードを設定する
export EMAIL_SENDER='iiyama <n.iyama0709@gmail.com>'
export DEFAULT_URL=https://gidafes.herokuapp.com
