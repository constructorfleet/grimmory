-- Make reading session columns nullable for audiobook support
-- Audiobooks may not have progress percentage data

ALTER TABLE reading_sessions
    ADD COLUMN duration_formatted VARCHAR(50) NULL;

ALTER TABLE reading_sessions
    ALTER COLUMN start_progress DROP NOT NULL;

ALTER TABLE reading_sessions
    ALTER COLUMN end_progress DROP NOT NULL;

ALTER TABLE reading_sessions
    ALTER COLUMN progress_delta DROP NOT NULL;

ALTER TABLE reading_sessions
    ALTER COLUMN start_location DROP NOT NULL;

ALTER TABLE reading_sessions
    ALTER COLUMN end_location DROP NOT NULL;
