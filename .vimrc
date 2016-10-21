
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
" 入力中のコマンドをステータスに表示する
set showcmd

" 見た目系
" 行番号を表示
set number 
"現在の行を強調表示
set cursorline
"indentの設定
filetype plugin indent on

" soft tabを有効に
set expandtab
" オートインデントを有効に
set autoindent
" インデント幅を2文字に
set tabstop=2 shiftwidth=2 softtabstop=2

set laststatus=2
" ノーマルモードとinsertモードでステータスバーの色を変える
" normal mode : lightblue / insert mode: green
au InsertEnter * hi StatusLine ctermfg=Black ctermbg=lightblue cterm=none
au InsertLeave * hi StatusLine ctermfg=Black ctermbg=Green cterm=none

" カラースキーマ
syntax on 
colorscheme ron
":Unite colorscheme -auto-preview でカラースキーマの一覧表示



" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

" 入力系
" enter で改行挿入
nmap <CR> o<ESC>



" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2


" 検索系
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

" ノーマルモード移行時半角入力へ自動以降
" うまくいかなかったのでKarabinerで実現
set imdisable

"Neobundle Setting
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
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'tomasr/molokai'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'ujihisa/unite-colorscheme'


" NeoBundle設定の終了
call neobundle#end()

filetype plugin indent on

" vim起動時に未インストールのプラグインをインストールする
NeoBundleCheck


"tmux setting
"http://takegue.hatenablog.com/entry/2015/01/26/031231
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-j> :TmuxNavigateUp<cr>
nnoremap <silent> <C-j> :TmuxNavigateRight<cr>
