-- Add columns for audiobook bookmarks
ALTER TABLE book_marks ADD COLUMN IF NOT EXISTS position_ms BIGINT;
ALTER TABLE book_marks ADD COLUMN IF NOT EXISTS track_index INTEGER;

-- Make cfi nullable (audiobook bookmarks don't use cfi)
ALTER TABLE book_marks ALTER COLUMN cfi DROP NOT NULL;
