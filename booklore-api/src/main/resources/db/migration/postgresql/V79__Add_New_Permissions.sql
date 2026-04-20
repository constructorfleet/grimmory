ALTER TABLE user_permissions
    ADD COLUMN IF NOT EXISTS permission_manage_metadata_config    BOOLEAN NOT NULL DEFAULT FALSE,
    ADD COLUMN IF NOT EXISTS permission_access_bookdrop           BOOLEAN NOT NULL DEFAULT FALSE,
    ADD COLUMN IF NOT EXISTS permission_access_library_stats      BOOLEAN NOT NULL DEFAULT FALSE,
    ADD COLUMN IF NOT EXISTS permission_access_user_stats         BOOLEAN NOT NULL DEFAULT FALSE,
    ADD COLUMN IF NOT EXISTS permission_access_task_manager       BOOLEAN NOT NULL DEFAULT FALSE,
    ADD COLUMN IF NOT EXISTS permission_manage_global_preferences BOOLEAN NOT NULL DEFAULT FALSE,
    ADD COLUMN IF NOT EXISTS permission_manage_icons              BOOLEAN NOT NULL DEFAULT FALSE,
    ADD COLUMN IF NOT EXISTS permission_demo_user                 BOOLEAN NOT NULL DEFAULT FALSE;

-- Set all new permissions to TRUE for admin users
UPDATE user_permissions
SET permission_manage_metadata_config = TRUE
WHERE permission_admin = TRUE;

UPDATE user_permissions
SET permission_access_bookdrop = TRUE
WHERE permission_admin = TRUE;

UPDATE user_permissions
SET permission_access_library_stats = TRUE
WHERE permission_admin = TRUE;

UPDATE user_permissions
SET permission_access_user_stats = TRUE
WHERE permission_admin = TRUE;

UPDATE user_permissions
SET permission_access_task_manager = TRUE
WHERE permission_admin = TRUE;

UPDATE user_permissions
SET permission_manage_global_preferences = TRUE
WHERE permission_admin = TRUE;

UPDATE user_permissions
SET permission_manage_icons = TRUE
WHERE permission_admin = TRUE;
