#!/bin/bash
set -e

# Set the FLASK_APP environment variable
export FLASK_APP=core/server.py

# Remove the existing SQLite database
rm -f core/store.sqlite3

# Run database migrations
flask db upgrade -d core/migrations/

# Execute the command passed to the entrypoint
exec "$@"
