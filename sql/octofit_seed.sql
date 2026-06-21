-- Seed users
INSERT INTO users (username, email, created_at) VALUES ('alice', 'alice@example.com', datetime('now'));
INSERT INTO users (username, email, created_at) VALUES ('bob', 'bob@example.com', datetime('now'));

-- Seed workouts
INSERT INTO workouts (user_id, date, activity, duration_minutes, notes) VALUES (1, date('now','-2 days'), 'Run', 30, 'Easy pace');
INSERT INTO workouts (user_id, date, activity, duration_minutes, notes) VALUES (1, date('now','-1 days'), 'Yoga', 45, 'Morning flow');
INSERT INTO workouts (user_id, date, activity, duration_minutes, notes) VALUES (2, date('now','-1 days'), 'Cycle', 60, 'Hill repeats');

-- Seed metrics
INSERT INTO metrics (user_id, weight_kg, body_fat_pct, measured_at) VALUES (1, 68.5, 18.2, datetime('now','-10 days'));
INSERT INTO metrics (user_id, weight_kg, body_fat_pct, measured_at) VALUES (1, 68.0, 18.0, datetime('now','-3 days'));
INSERT INTO metrics (user_id, weight_kg, body_fat_pct, measured_at) VALUES (2, 82.1, 22.5, datetime('now','-5 days'));
