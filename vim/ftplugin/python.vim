" Indentation
    setlocal fileformat=unix
    setlocal textwidth=79

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
