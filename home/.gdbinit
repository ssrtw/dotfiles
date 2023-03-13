source ~/.gdbinit-gef.py
source ~/.mygdb.py
define tr
    target remote :1234
end
