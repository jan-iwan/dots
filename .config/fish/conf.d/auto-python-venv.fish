set -x MY_PYTHON_VENV_DIR ".venv"

function auto_venv --on-variable PWD --description "Automatically activate a venv when I cd"
    # Should check to see if parent directories have .venv
    if test -d $MY_PYTHON_VENV_DIR
        source $MY_PYTHON_VENV_DIR/bin/activate.fish
        return
    end

    # If $VIRUTAL_ENV is set and is not empty
    if test -n "$VIRTUAL_ENV"
        deactivate
    end
end
