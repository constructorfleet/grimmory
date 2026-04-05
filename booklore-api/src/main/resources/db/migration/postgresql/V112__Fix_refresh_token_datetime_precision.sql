ALTER TABLE refresh_token
    ALTER COLUMN expiry_date TYPE TIMESTAMP,
    ALTER COLUMN expiry_date SET NOT NULL,
    ALTER COLUMN revocation_date TYPE TIMESTAMP,
    ALTER COLUMN revocation_date DROP NOT NULL;
