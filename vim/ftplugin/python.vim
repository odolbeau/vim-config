" Indentation
    set softtabstop=4  " tab = 4 space
    set tabstop=4
    set shiftwidth=4
    set expandtab      " no more tabs, only spaces!
    set autoindent
    set fileformat=unix
    set textwidth=79

" Editor
    set list
    set listchars=trail:¤,tab:>-,nbsp:•     " Show blank spaces and tabs at the end of a line

let python_highlight_all=1

" Use the virtualenv version if it exists
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
