function power --wraps='poweroff -h now' --wraps='shutdown -h now' --description 'alias power=shutdown -h now'
  shutdown -h now $argv
        
end
