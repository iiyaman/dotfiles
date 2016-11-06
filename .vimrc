"文字コードをUFT-8に設定
 set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
set timeoutlen=1000 ttimeoutlen=0

"----------------------------------------------------------
" 見た目系
"----------------------------------------------------------
" 行番号を表示
set number 
"現在の行を強調表示
set cursorline
"indentの設定
filetype plugin indent on

" ノーマルモードとinsertモードでステータスバーの色を変える
" normal mode : lightblue / insert mode: green
au InsertEnter * hi StatusLine ctermfg=Black ctermbg=lightblue cterm=none
au InsertLeave * hi StatusLine ctermfg=Black ctermbg=Green cterm=none

"----------------------------------------------------------
" ステータスラインの設定
"----------------------------------------------------------
" ステータスラインを常に表示
set laststatus=2
" 現在のモードを表示
set showmode 
" 打ったコマンドをステータスラインの下に表示
set showcmd 
" ステータスラインの右側にカーソルの現在位置を表示する
set ruler 

"----------------------------------------------------------
" カラースキーマ
"----------------------------------------------------------

syntax on 
colorscheme ron
":Unite colorscheme -auto-preview でカラースキーマの一覧表示


"----------------------------------------------------------
" tab系
"----------------------------------------------------------
" soft tabを有効に
set expandtab
" 画面上でタブ文字が占める幅
set tabstop=4
" 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=4 
 " 改行時に前の行のインデントを継続する
set autoindent
" 改行時に前の行の構文をチェックし次の行のインデントを増減する
set smartindent 
" smartindentで増減する幅
set shiftwidth=4 

"---------------------------------------------------------- 
" 入力系
"---------------------------------------------------------- 
" enter で改行挿入
nmap <CR> o<ESC>

set undolevels=1000

" ペースト設定
if &term =~ "xterm"
     let &t_SI .= "\e[?2004h"
     let &t_EI .= "\e[?2004l"
     let &pastetoggle = "\e[201~"

     function XTermPasteBegin(ret)
         set paste
         return a:ret
     endfunction
     inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

" 括弧入力時の対応する括弧を表示
set showmatch

" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

"---------------------------------------------------------- 
" 検索系
"---------------------------------------------------------
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"---------------------------------------------------------
" 保管系
"---------------------------------------------------------
" コマンドモードの補完
set wildmenu 
 " 保存するコマンド履歴の数
set history=5000
" ノーマルモード移行時半角入力へ自動以降
" うまくいかなかったのでKarabinerで実現
" set imdisable

"---------------------------------------------------------
" Neobundle Setting
"---------------------------------------------------------
" 起動時にruntimepathにNeoBundleのパスを追加する
if has('vim_starting')
    if &compatible
          set nocompatible
    endif
    set runtimepath+=/Users/iiyamaNaoki/dotfiles/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('/Users/iiyamaNaoki/dotfiles/.vim/bundle'))

" NeoBundleのバージョンをNeoBundle自身で管理する
NeoBundleFetch 'Shougo/neobundle.vim'
" tmux
NeoBundle 'christoomey/vim-tmux-navigator'
" カラースキーマ
NeoBundle 'tomasr/molokai'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'ujihisa/unite-colorscheme'
" ステータスラインの表示内容強化
NeoBundle 'itchyny/lightline.vim'
" インデントの可視化
NeoBundle 'Yggdroot/indentLine'

" NeoBundle設定の終了
call neobundle#end()

filetype plugin indent on

" vim起動時に未インストールのプラグインをインストールする
NeoBundleCheck

"---------------------------------------------------------
" tmux setting
"---------------------------------------------------------
"http://takegue.hatenablog.com/entry/2015/01/26/031231
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-j> :TmuxNavigateUp<cr>
nnoremap <silent> <C-j> :TmuxNavigateRight<cr>
