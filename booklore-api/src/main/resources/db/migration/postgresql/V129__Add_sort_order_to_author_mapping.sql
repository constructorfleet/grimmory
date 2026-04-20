-- Add column
ALTER TABLE book_metadata_author_mapping
  ADD COLUMN IF NOT EXISTS sort_order INT NOT NULL DEFAULT 0;

-- Assign unique sort_order per book for existing rows using window functions
UPDATE book_metadata_author_mapping AS bam
SET sort_order = ranked.rn - 1
FROM (
    SELECT book_id, author_id,
           ROW_NUMBER() OVER (PARTITION BY book_id ORDER BY author_id) AS rn
    FROM book_metadata_author_mapping
) AS ranked
WHERE bam.book_id = ranked.book_id AND bam.author_id = ranked.author_id;

-- Change PK from (book_id, author_id) to (book_id, sort_order)
ALTER TABLE book_metadata_author_mapping
  DROP CONSTRAINT book_metadata_author_mapping_pkey;
ALTER TABLE book_metadata_author_mapping
  ADD PRIMARY KEY (book_id, sort_order);

-- Keep an index on author_id for reverse lookups
CREATE INDEX IF NOT EXISTS idx_author_mapping_author_id ON book_metadata_author_mapping (book_id, author_id);
