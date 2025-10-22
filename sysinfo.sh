#!/bin/bash

echo "Bash menu"

echo -e "Welcome, select one of the following options using the number keys: \n 1: Show System Info \n 2: Show Disk usage \n 3: Show Current Users \n 4: Exit"

check_input() { #processing function
# taking the input and storing in "number"
    read -p "Number: " number

    # If function to read the options and execute them as requested
    if ["$number" -eq 1]; then
        echo "You selected Option 1"
        uname -a
    elif ["$number" -eq 2]; then
        echo "You selected Option 2"
        df -h
    elif ["$number" -eq 3]; then
        echo "You selected Option 3"
        who
    else 
        echo "Exiting Script..."
        exit 0 # exit script with a success status
    fi
}
while true; do
    check_input
done


#chmod +x sysinfo.sh
