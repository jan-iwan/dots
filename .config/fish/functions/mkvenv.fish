function mkvenv --description "Create and activate a new python venv"
    echo "Creating virtualenv in "(pwd)"/"$MY_PYTHON_VENV_DIR

    python -m venv $MY_PYTHON_VENV_DIR
    source $MY_PYTHON_VENV_DIR/bin/activate.fish
end

