CREATE TABLE IF NOT EXISTS task_cron_configuration
(
    id              BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    task_type       VARCHAR(100) NOT NULL,
    cron_expression VARCHAR(100) NOT NULL,
    enabled         BOOLEAN      NOT NULL DEFAULT TRUE,
    created_by      BIGINT       NOT NULL DEFAULT -1,
    created_at      TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_task_type UNIQUE (task_type)
);

INSERT INTO task_cron_configuration (task_type, cron_expression, enabled, created_by)
VALUES
       ('CLEAR_CBX_CACHE',             '0 30 0 * * 1', FALSE, -1),
       ('CLEAR_PDF_CACHE',             '0 35 0 * * 1', FALSE, -1),
       ('CLEANUP_DELETED_BOOKS',       '0 40 0 * * 1', TRUE,  -1),
       ('CLEANUP_TEMP_METADATA',       '0 45 0 * * 1', TRUE,  -1),
       ('SYNC_LIBRARY_FILES',          '0 0 1 * * *',  TRUE,  -1),
       ('UPDATE_BOOK_RECOMMENDATIONS', '0 30 1 * * *', TRUE,  -1);
