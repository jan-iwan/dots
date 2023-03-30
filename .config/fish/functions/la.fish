function la --wraps=ls --wraps='exa -laF' --wraps='exa -lagF' --description 'alias la=exa -lagF'
  exa -lagF $argv
        
end
