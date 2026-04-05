ALTER TABLE user_book_progress ADD COLUMN IF NOT EXISTS personal_rating SMALLINT;

-- Copies existing personal ratings to all users with progress records for matching books
UPDATE user_book_progress
SET personal_rating = bm.personal_rating
FROM book_metadata bm
WHERE user_book_progress.book_id = bm.book_id AND bm.personal_rating IS NOT NULL;

-- Drops obsolete columns
ALTER TABLE book_metadata DROP COLUMN IF EXISTS personal_rating;
ALTER TABLE book_metadata DROP COLUMN IF EXISTS personal_rating_locked;
