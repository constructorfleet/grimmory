CREATE TABLE bookdrop_file
(
    id                BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    file_path         TEXT         NOT NULL,
    file_name         VARCHAR(512) NOT NULL,
    file_size         BIGINT,
    status            VARCHAR(20)  NOT NULL DEFAULT 'PENDING_REVIEW',
    original_metadata JSON,
    fetched_metadata  JSON,
    created_at        TIMESTAMP             DEFAULT CURRENT_TIMESTAMP,
    updated_at        TIMESTAMP             DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_file_path UNIQUE (file_path)
);
