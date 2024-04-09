set -x MY_PYTHON_VENV_DIR ".venv"

function auto_venv --on-variable PWD --description "Automatically activate a venv when I cd"
    set REPO_ROOT (git rev-parse --show-toplevel 2>/dev/null)

    # Theres no venv to activate and we shuold not be in a venv
    if test -z "$REPO_ROOT"; and test -n "$VIRTUAL_ENV"
        deactivate
    end

    # cd'd within the same git repo
    if [ "$VIRTUAL_ENV" = "$REPO_ROOT/$MY_PYTHON_VENV_DIR" ]
        return
    end

    # There a .venv at the root of the repo
    if test -d "$REPO_ROOT/$MY_PYTHON_VENV_DIR"
        source "$REPO_ROOT/$MY_PYTHON_VENV_DIR/bin/activate.fish"
    end

    # If it's not a git repo and there's a .venv in the current directory
    if test -d $MY_PYTHON_VENV_DIR
        source $MY_PYTHON_VENV_DIR/bin/activate.fish
        return
    end
end
