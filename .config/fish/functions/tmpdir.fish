function tmpdir --description "mkdir and cd to a temporary directory"
    cd (mktemp -d)
end
