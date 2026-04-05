CREATE TABLE tasks
(
    id                  VARCHAR(36) NOT NULL PRIMARY KEY,
    type                VARCHAR(50) NOT NULL,
    status              VARCHAR(50) NOT NULL,
    user_id             BIGINT      NOT NULL,
    created_at          TIMESTAMP   NOT NULL,
    updated_at          TIMESTAMP,
    completed_at        TIMESTAMP,
    progress_percentage INT,
    message             TEXT,
    errorDetails        TEXT,
    task_options        TEXT
);

CREATE INDEX idx_tasks_user_id ON tasks (user_id);
CREATE INDEX idx_tasks_type ON tasks (type);
CREATE INDEX idx_tasks_status ON tasks (status);
CREATE INDEX idx_tasks_created_at ON tasks (created_at);
