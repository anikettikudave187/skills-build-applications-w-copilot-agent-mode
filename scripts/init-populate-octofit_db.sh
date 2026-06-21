#!/usr/bin/env bash
set -euo pipefail

# Initialize and populate the OctoFit SQLite database.
# Usage: ./scripts/init-populate-octofit_db.sh

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$SCRIPT_DIR/.."
DB_DIR="$REPO_ROOT/db"
DB_FILE="$DB_DIR/octofit.db"
SQL_DIR="$REPO_ROOT/sql"

mkdir -p "$DB_DIR"

echo "Initializing OctoFit database at: $DB_FILE"

# If an existing DB exists, back it up with a timestamp
if [ -f "$DB_FILE" ]; then
  BACKUP="$DB_FILE.$(date +%Y%m%d%H%M%S).bak"
  echo "Existing database found — moving to: $BACKUP"
  mv "$DB_FILE" "$BACKUP"
fi

# Apply schema and seed
if ! command -v sqlite3 >/dev/null 2>&1; then
  echo "Error: sqlite3 CLI is not installed or not in PATH. Install sqlite3 to proceed." >&2
  exit 1
fi

sqlite3 "$DB_FILE" < "$SQL_DIR/octofit_schema.sql"
sqlite3 "$DB_FILE" < "$SQL_DIR/octofit_seed.sql"

echo "Database created and seeded: $DB_FILE"

# Print counts
echo "Row counts:"
sqlite3 "$DB_FILE" "SELECT 'users:' || COUNT(*) FROM users;"
sqlite3 "$DB_FILE" "SELECT 'workouts:' || COUNT(*) FROM workouts;"
sqlite3 "$DB_FILE" "SELECT 'metrics:' || COUNT(*) FROM metrics;"
