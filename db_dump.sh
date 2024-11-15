#!/bin/bash

# Load environment variables from .env file
if [[ -f .env ]]; then
  export $(cat .env | grep -v '^#' | xargs)
fi

# Get the current date and time
TIMESTAMP=$(date +%Y%m%d%H%M%S)

# Database credentials
DB_USER=root
DB_PASSWORD=$MYSQL_ROOT_PASSWORD
DB_NAME=$DB_NAME

# Create the backup folder if it doesn't exist
BACKUP_FOLDER="/db_backup"
mkdir -p $BACKUP_FOLDER

# Dump the database to an SQL file
mysqldump -u $DB_USER -p$DB_PASSWORD $DB_NAME --single-transaction --quick > $BACKUP_FOLDER/backup_$TIMESTAMP.sql

# Compress the SQL file into a tar.gz archive
tar -czf $BACKUP_FOLDER/backup_$TIMESTAMP.tar.gz $BACKUP_FOLDER/backup_$TIMESTAMP.sql

# Remove the uncompressed SQL file
rm $BACKUP_FOLDER/backup_$TIMESTAMP.sql

# Keep only the 10 most recent backup files
cd $BACKUP_FOLDER
backup_files=$(ls -tp | grep -v '/$' | tail -n +11)
if [ -n "$backup_files" ]; then
  echo "$backup_files" | xargs -d '\n' rm --
fi
