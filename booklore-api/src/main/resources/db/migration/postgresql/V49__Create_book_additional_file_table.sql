CREATE TABLE IF NOT EXISTS book_additional_file
(
    id                   BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    book_id              BIGINT        NOT NULL,
    file_name            VARCHAR(1000) NOT NULL,
    file_sub_path        VARCHAR(512)  NOT NULL,
    additional_file_type VARCHAR(50)   NOT NULL CHECK (additional_file_type IN ('ALTERNATIVE_FORMAT', 'SUPPLEMENTARY')),
    file_size_kb         BIGINT,
    initial_hash         VARCHAR(128),
    current_hash         VARCHAR(128),
    description          TEXT,
    added_on             TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    -- Generated column for alternative format files
    alt_format_current_hash VARCHAR(128) GENERATED ALWAYS AS (CASE WHEN additional_file_type = 'ALTERNATIVE_FORMAT' THEN current_hash END) STORED,

    CONSTRAINT fk_book_additional_file_book FOREIGN KEY (book_id) REFERENCES book (id) ON DELETE CASCADE
);

CREATE UNIQUE INDEX idx_book_additional_file_current_hash_alt_format ON book_additional_file (alt_format_current_hash) WHERE alt_format_current_hash IS NOT NULL;

CREATE INDEX idx_book_additional_file_book_id ON book_additional_file(book_id);
