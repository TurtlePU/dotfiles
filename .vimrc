" Plugins
call plug#begin('~/.vim/plug-vim')

Plug 'VundleVim/Vundle.vim'
Plug 'lervag/vimtex'
Plug 'wadackel/vim-dogrun'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'jiangmiao/auto-pairs'

call plug#end()

" Vim basic settings
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent

set list
set listchars=trail:·

set colorcolumn=81,101
hi ColorColumn ctermbg=darkgray

set number

set exrc
set secure exrc

colorscheme dogrun
hi Normal ctermfg=lightgray ctermbg=black

" Plugin settings
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_view_general_viewer='zathura'

let g:AutoPairs={'(':')', '[':']', '{':'}', '"':'"', "`":"`"}

" coc shortcuts
inoremap <silent><expr> <c-@> coc#refresh()

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> <leader>d :call CocAction('doHover')<Enter>
nmap <silent> gd :call CocAction('jumpDefinition', 'vsplit')<Enter>
nmap <silent> gi :call CocAction('jumpImplementation', 'vsplit')<Enter>
nmap <silent> gy :call CocAction('jumpTypeDefinition', 'vsplit')<Enter>

nmap <leader>a <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>qf  <Plug>(coc-fix-current)
command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
