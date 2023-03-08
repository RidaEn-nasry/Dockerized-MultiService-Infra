

# checking if there are any mysql processes runing

# process=$(ps aux | grep mysqld | awk '{print $2}')

# if [ -z "$process" ]

# then
#     echo "No process found"
# else
#     echo "Process found"
#     kill $(ps aux | grep mysqld | awk '{print $2}')
# fi

# mysqld_safe
