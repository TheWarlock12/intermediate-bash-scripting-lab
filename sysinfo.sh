#!/bin/bash

# Display the title
echo "==========================="
echo "        Bash Menu"
echo "==========================="

echo -e "Welcome, select one of the following options using the number keys: \n 1: Show System Info \n 2: Show Disk usage \n 3: Show Current Users \n 4: Exit"

# taking the input and storing in "number"
    read -p "Number: " number

    # If function to read the options and execute them as requested
    if ["$number" -eq 1]; then
        echo "You selected Option 1: Show System Info"
        
    elif ["$number" -eq 2]; then
        echo "You selected Option 2: Show Disk usage"
        
    elif ["$number" -eq 3]; then
        echo "You selected Option 3: Show Current Users"
        
    elif ["$number" -eq 4]; then
        echo "Exiting Script..."
        exit 0 # exit script with a success status
    else
        echo "Invalid choice! Please run the script again and select 1–4."
    fi



#chmod +x sysinfo.sh


# #!/bin/bash
# # sysinfo.sh — A simple Bash menu script

# # Display the title
# echo "==========================="
# echo "        Bash Menu"
# echo "==========================="

# # Display the menu
# echo -e "Welcome, select one of the following options using the number keys:"
# echo "1: Show System Info"
# echo "2: Show Disk Usage"
# echo "3: Show Current Users"
# echo "4: Exit"

# # Prompt the user for input
# read -p "Enter your choice (1-4): " number

# # Handle the user's choice
# if [ "$number" -eq 1 ]; then
#     echo "You selected Option 1: Show System Info"

# elif [ "$number" -eq 2 ]; then
#     echo "You selected Option 2: Show Disk Usage"

# elif [ "$number" -eq 3 ]; then
#     echo "You selected Option 3: Show Current Users"

# elif [ "$number" -eq 4 ]; then
#     echo "Exiting Script..."
#     exit 0

# else
#     echo "Invalid choice. Please run the script again and select 1–4."
# fi
