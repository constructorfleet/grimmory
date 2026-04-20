ALTER TABLE user_permissions
    ADD COLUMN IF NOT EXISTS permission_bulk_auto_fetch_metadata   BOOLEAN NOT NULL DEFAULT FALSE,
    ADD COLUMN IF NOT EXISTS permission_bulk_custom_fetch_metadata BOOLEAN NOT NULL DEFAULT FALSE,
    ADD COLUMN IF NOT EXISTS permission_bulk_edit_metadata         BOOLEAN NOT NULL DEFAULT FALSE,
    ADD COLUMN IF NOT EXISTS permission_bulk_regenerate_cover      BOOLEAN NOT NULL DEFAULT FALSE,
    ADD COLUMN IF NOT EXISTS permission_move_organize_files        BOOLEAN NOT NULL DEFAULT FALSE,
    ADD COLUMN IF NOT EXISTS permission_bulk_lock_unlock_metadata  BOOLEAN NOT NULL DEFAULT FALSE,
    ADD COLUMN IF NOT EXISTS permission_bulk_reset_booklore_read_progress BOOLEAN NOT NULL DEFAULT FALSE,
    ADD COLUMN IF NOT EXISTS permission_bulk_reset_koreader_read_progress BOOLEAN NOT NULL DEFAULT FALSE,
    ADD COLUMN IF NOT EXISTS permission_bulk_reset_book_read_status BOOLEAN NOT NULL DEFAULT FALSE;

-- Set all new permissions to TRUE for admin users
UPDATE user_permissions
SET permission_bulk_auto_fetch_metadata = TRUE
WHERE permission_admin = TRUE;

UPDATE user_permissions
SET permission_bulk_custom_fetch_metadata = TRUE
WHERE permission_admin = TRUE;

UPDATE user_permissions
SET permission_bulk_edit_metadata = TRUE
WHERE permission_admin = TRUE;

UPDATE user_permissions
SET permission_bulk_regenerate_cover = TRUE
WHERE permission_admin = TRUE;

UPDATE user_permissions
SET permission_move_organize_files = TRUE
WHERE permission_admin = TRUE;

UPDATE user_permissions
SET permission_bulk_lock_unlock_metadata = TRUE
WHERE permission_admin = TRUE;

UPDATE user_permissions
SET permission_bulk_reset_booklore_read_progress = TRUE
WHERE permission_admin = TRUE;

UPDATE user_permissions
SET permission_bulk_reset_koreader_read_progress = TRUE
WHERE permission_admin = TRUE;

UPDATE user_permissions
SET permission_bulk_reset_book_read_status = TRUE
WHERE permission_admin = TRUE;
