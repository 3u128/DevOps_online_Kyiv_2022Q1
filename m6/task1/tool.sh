#!/bin/bash
# When starting without parameters, it will display a list of possible keys and their description.
# The --all key displays the IP addresses and symbolic names of all hosts in the current subnet  
# The --target key displays a list of open system TCP ports. 
# The code that performs the functionality of each of the subtasks must be placed in a separate function 
#

test() {
    echo -ne "
MAIN MENU
1) CMD1
0) Exit
Choose an option:  "
    read -r ans
    case $ans in
    1)
        submenu
        mainmenu
        ;;
    0)
        echo "Bye bye."
        exit 0
        ;;
    *)
        echo "Wrong option."
        exit 1
        ;;
    esac
}
test
