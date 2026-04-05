CREATE TABLE app_migration
(
    migration_key VARCHAR(100) PRIMARY KEY,
    executed_at   TIMESTAMP NOT NULL,
    description   TEXT
);
