export DOTSDIR=${HOME}/dotfiles
source "$DOTSDIR/set_proxy_by_dns.sh"

autoload -U compinit
compinit 

#rbenvの初期化設定
export PATH="$HOME/.rbenv/bin:$PATH"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi



### History ###
source /Users/iiyamaNaoki/zaw/zaw.zsh
HISTFILE=~/.zsh_history   # ヒストリを保存するファイル
HISTSIZE=10000            # メモリに保存されるヒストリの件数
SAVEHIST=10000            # 保存されるヒストリの件数
setopt bang_hist          # !を使ったヒストリ展開を行う(d)
setopt extended_history   # ヒストリに実行時間も保存する
setopt hist_ignore_dups   # 直前と同じコマンドはヒストリに追加しない
setopt share_history      # 他のシェルのヒストリをリアルタイムで共有する
setopt hist_reduce_blanks # 余分なスペースを削除してヒストリに保存する

# マッチしたコマンドのヒストリを表示できるようにする
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

#ヒストリの保存場所
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
function mkcd(){mkdir -p $1 && cd $1}
# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups
# spaceで始まるコマンド行はヒストリから削除
setopt hist_ignore_space
# 余分な空白は詰めて記録
setopt hist_reduce_blanks
# 同じコマンドは無視
setopt hist_save_no_dups
# historyコマンドは履歴に登録しない
setopt hist_no_store
# 補完時にヒストリを自動的に展開
setopt hist_expand
# 履歴をインクリメンタルに追加
setopt inc_append_history
# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify
# 高機能なワイルドカード展開を使用する
setopt extended_glob

#history一覧の表示
zle -N zaw-history
bindkey '^G' zaw-history

# すべてのヒストリを表示する
function history-all { history -E 1 }


# ------------------------------
# Look And Feel Settings
# ------------------------------
### Ls Color ###
# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
# 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# ZLS_COLORSとは？
export ZLS_COLORS=$LS_COLORS
# lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export CLICOLOR=true
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

### Prompt ###
# プロンプトに色を付ける
autoload -U colors; colors
# 一般ユーザ時
tmp_prompt="%{${fg[cyan]}%}%n%# %{${reset_color}%}"
tmp_prompt2="%{${fg[cyan]}%}%_> %{${reset_color}%}"
tmp_rprompt="%{${fg[green]}%}[%~]%{${reset_color}%}"
tmp_sprompt="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"

# rootユーザ時(太字にし、アンダーバーをつける)
if [ ${UID} -eq 0 ]; then
  tmp_prompt="%B%U${tmp_prompt}%u%b"
  tmp_prompt2="%B%U${tmp_prompt2}%u%b"
  tmp_rprompt="%B%U${tmp_rprompt}%u%b"
  tmp_sprompt="%B%U${tmp_sprompt}%u%b"
fi

PROMPT=$tmp_prompt    # 通常のプロンプト
PROMPT2=$tmp_prompt2  # セカンダリのプロンプト(コマンドが2行以上の時に表示される)
RPROMPT=$tmp_rprompt  # 右側のプロンプト
SPROMPT=$tmp_sprompt  # スペル訂正用プロンプト

# SSHログイン時のプロンプト
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
  PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
;

#alias
alias ta='tmux attach -t 0'


: << COMMENTOUT
### Title (user@hostname) ###
case "${TERM}" in
kterm*|xterm*|)
  precmd() {
    echo -ne "\033]0;${USER}@${HOST%%.*}\007"
  }
  ;;
esac

COMMENTOUT


#group-manager関係
export PGDATA=/usr/local/var/postgres # mac
export SMTP_ADRESS=stn.nagaokaut.ac.jp
export SMTP_PORT=465
export EMAIL_DOMAIN=stn.nagaokautac.jp
export SMTP_AUTH=plain
export SMTP_TLS=true
export EMAIL_USERNAME=s131005
export EMAIL_BCC='n.iyama0709@gmail.com'
export EMAIL_PASSWORD=pa5SK2pB # gmailの場合は2段階認証を設定後, アプリ固有のパスワードを設定する
export EMAIL_SENDER='iiyama <n.iyama0709@gmail.com>'
export DEFAULT_URL=https://nutfes-group-manager.herokuapp.com
source /Users/iiyamaNaoki/zaw/zaw.zsh
