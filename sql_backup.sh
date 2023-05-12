#!/bin/bash

# Author https://github.com/michal-repo/
#
# Required apps: mysqldump, gzip

clear
echo "This process will let you create backup of selected DB. Provide some information first."

echo ""
echo "Which database you want to backup?"
while :
do
    read -p "> " selected_db
    if [[ "$selected_db" == *" "* ]]
    then
        echo "No whitespaces allowed."
    else
        break
    fi
done


clear
echo "Which tables you want to backup? Separate them with single space (eg. table1 table2 table 3). Leave empty for entire database"
while :
do
    read -p "> " selected_tables
    if [[ "$selected_tables" == *","* ]]
    then
        echo "Separate tables with single space."
    else
        break
    fi
done

clear
echo "Do you want to compress your backup?"
select selected_compress in "Yes" "No"
do
    case $selected_compress in
        "Yes")
            echo "Backup will be compressed"
            break
            ;;
        "No")
            echo "No compression"
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

clear
echo "Provide name for output backup file."
while :
do
    read -p "> " selected_backup_name
    if [[ "$selected_backup_name" == *".sql" ]] || [[ "$selected_backup_name" == *".tar" ]] || [[ "$selected_backup_name" == *".gz" ]]
    then
        echo "Provide only file name, without extension."
    else
        break
    fi
done


clear
echo "Summary: "
echo "Selected Database: $selected_db"
echo "Selected tables: $selected_tables"
echo "Backup compression: $selected_compress"
echo "Backup file name: $selected_backup_name"

echo ""
echo "Is this correct?"
select confirm in "Yes" "No"
do
    case $confirm in
        "Yes")
            echo "Proceeding..."
            case $selected_compress in
                   "Yes")
                       mysqldump $selected_db $selected_tables | gzip > "$selected_backup_name.sql.gz"
                       break
                       ;;
                   "No")
                       mysqldump $selected_db $selected_tables > "$selected_backup_name.sql"
                       break
                       ;;
            esac
            break
            ;;
        "No")
            echo "Try again."
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
