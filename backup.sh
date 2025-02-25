#!/bin/bash

# Set strict error handling
set -euo pipefail

# Load environment variables
source "$( dirname "${BASH_SOURCE[0]}" )/.env"

# Define variables
DATE=$(date +%Y-%m-%d_%H%M%S)
BACKUP_DIR="$( dirname "${BASH_SOURCE[0]}" )/backups"
BACKUP_FILE="${BACKUP_DIR}/${PG_DB}_${DATE}.sql"

# Check if backup directory exists
if [ ! -d "$BACKUP_DIR" ]; then
    echo "Backup directory $BACKUP_DIR does not exist"
    exit 1
fi

# Perform database backup
if ! docker exec metabase_db pg_dump -U "$PG_USR" -d "$PG_DB" > "$BACKUP_FILE" 2>&1; then
    echo "Backup failed: $(cat "$BACKUP_FILE")"
    rm -f "$BACKUP_FILE"
    exit 1
fi

echo "Backup completed successfully: $BACKUP_FILE"