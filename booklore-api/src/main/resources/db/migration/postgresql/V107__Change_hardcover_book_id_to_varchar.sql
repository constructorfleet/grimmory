-- Change hardcover_book_id from INTEGER to VARCHAR(100) for consistency with other provider IDs
-- This prevents overflow issues with large book IDs (e.g., > 2,147,483,647)
ALTER TABLE book_metadata ALTER COLUMN hardcover_book_id TYPE VARCHAR(100) USING hardcover_book_id::VARCHAR(100);
