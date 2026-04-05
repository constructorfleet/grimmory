ALTER TABLE user_permissions
    ADD COLUMN IF NOT EXISTS permission_manage_fonts BOOLEAN NOT NULL DEFAULT FALSE;

-- Set all new permissions to TRUE for admin users

UPDATE user_permissions
SET permission_manage_fonts = TRUE
WHERE permission_admin = TRUE;
