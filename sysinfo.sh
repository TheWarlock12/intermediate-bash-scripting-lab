#!/bin/bash
while true; do
    clear
# Display the title
    echo "==========================="
    echo "        Bash Menu"
    echo "==========================="

    echo -e "Welcome, select one of the following options using the number keys: \n 1: Show System Info \n 2: Show Disk usage \n 3: Show Current Users \n 4: Exit"

    # taking the input and storing in "number"
    read -p "Number: " number

        # If function to read the options and execute them as requested
    if [ "$number" -eq 1 ]; then
        echo "You selected Option 1: Show System Info"
        echo "-------------------------------------"

        # 1) Operating system name & version (portable)
        if command -v lsb_release >/dev/null 2>&1; then
        os_info=$(lsb_release -ds)
        elif [ -r /etc/os-release ]; then
        os_info=$(grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2- | tr -d '"')
        else
        # Fallback: kernel + uname info
        os_info="$(uname -s) $(uname -r)"
        fi
        printf "Operating System: %s\n" "$os_info"

        # 2) Hostname
        printf "Hostname: %s\n" "$(hostname)"

        # 3) Kernel version
        printf "Kernel Version: %s\n" "$(uname -r)"

        # 4) Uptime (try pretty format, else compute from /proc/uptime)
        if uptime_pretty=$(uptime -p 2>/dev/null); then
        # uptime -p prints like: "up 1 hour, 2 minutes"
        printf "Uptime: %s\n" "$uptime_pretty"
        elif [ -r /proc/uptime ]; then
        # compute a human-friendly uptime from /proc/uptime
        raw_seconds=$(cut -d. -f1 /proc/uptime)   # integer seconds
        days=$(( raw_seconds / 86400 ))
        hours=$(( (raw_seconds % 86400) / 3600 ))
        minutes=$(( (raw_seconds % 3600) / 60 ))

        uptime_str=""
        [ "$days" -gt 0 ] && uptime_str+="$days day(s) "
        [ "$hours" -gt 0 ] && uptime_str+="$hours hour(s) "
        [ "$minutes" -gt 0 ] && uptime_str+="$minutes minute(s)"
        [ -z "$uptime_str" ] && uptime_str="less than a minute"

        printf "Uptime: %s\n" "$uptime_str"
        else
        printf "Uptime: (could not determine)\n"
        fi

        echo "-------------------------------------"

            
    elif [ "$number" -eq 2 ]; then
        echo "You selected Option 2: Show Disk usage"
        echo "-------------------------------------"
        df -h
        echo "-------------------------------------"

            

    elif [ "$number" -eq 3 ]; then
        echo "You selected Option 3: Show Current Users and Running Apps"
        echo "---------------------------------------------------------"

        # Show all users currently logged into the system
        echo "Currently logged-in users:"
        who
        echo

        # Show what apps/processes each user has running
        echo "Processes for each logged-in user:"
        echo "---------------------------------------------------------"
        # Loop through each unique username from the 'who' command
        for user in $(who | awk '{print $1}' | sort | uniq); do
            echo "User: $user"
            ps -u "$user" -o pid,tty,stime,cmd --sort=stime
            echo "---------------------------------------------------------"
        done


            
    elif [ "$number" -eq 4 ]; then
        echo "Exiting Script..."
        exit 0 # exit script with a success status
    else
        echo "Invalid choice! Please run the script again and select 1–4."
    fi

   # Wait before showing the menu again
    echo
    read -p "Press Enter to return to the menu..."
done

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
