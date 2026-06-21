This script initializes and populates a SQLite database for the OctoFit exercise.

Files added:
- sql/octofit_schema.sql — schema for users, workouts, and metrics
- sql/octofit_seed.sql — seed rows for users, workouts, and metrics
- scripts/init-populate-octofit_db.sh — shell script that creates db/octofit.db and loads schema + seed

How to run
1. Ensure you have sqlite3 CLI available on your machine.
   - macOS: brew install sqlite
   - Ubuntu/Debian: sudo apt-get install sqlite3
2. From the repository root:
   chmod +x scripts/init-populate-octofit_db.sh
   ./scripts/init-populate-octofit_db.sh

What it does
- Creates db/ directory
- Backs up any existing db/octofit.db to db/octofit.db.YYYYMMDDHHMMSS.bak
- Executes the schema and seed SQL files to create tables and insert sample data
- Prints counts of rows inserted

Next steps you might want
- Add a small Node/TypeScript script that opens the DB and exposes queries for the app
- Integrate DB initialization into a dev/start script in package.json
- Add migrations instead of applying raw SQL for schema evolution
