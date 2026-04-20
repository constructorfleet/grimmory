-- Migrate MetadataPersistenceSettings from old structure to new nested structure
-- Old: {"saveToOriginalFile":boolean,...}
-- New: {"saveToOriginalFile":{"epub":{...},"pdf":{...}},...}
-- Creates metadata_persistence_settings_v2 instead of overwriting the original

INSERT INTO app_settings (name, val)
SELECT
    'metadata_persistence_settings_v2',
    CASE
        -- If saveToOriginalFile is true, enable all formats
        WHEN (val::jsonb->>'saveToOriginalFile')::boolean = true THEN
            jsonb_set(
                val::jsonb,
                '{saveToOriginalFile}',
                jsonb_build_object(
                    'epub', jsonb_build_object('enabled', true, 'maxFileSizeInMb', 250),
                    'pdf', jsonb_build_object('enabled', true, 'maxFileSizeInMb', 250),
                    'cbx', jsonb_build_object('enabled', true, 'maxFileSizeInMb', 250)
                )
            )::text
        -- If saveToOriginalFile is false, disable all formats
        WHEN (val::jsonb->>'saveToOriginalFile')::boolean = false THEN
            jsonb_set(
                val::jsonb,
                '{saveToOriginalFile}',
                jsonb_build_object(
                    'epub', jsonb_build_object('enabled', false, 'maxFileSizeInMb', 250),
                    'pdf', jsonb_build_object('enabled', false, 'maxFileSizeInMb', 250),
                    'cbx', jsonb_build_object('enabled', false, 'maxFileSizeInMb', 250)
                )
            )::text
        -- If null or missing, default to disabled
        ELSE
            jsonb_set(
                COALESCE(val, '{}')::jsonb,
                '{saveToOriginalFile}',
                jsonb_build_object(
                    'epub', jsonb_build_object('enabled', false, 'maxFileSizeInMb', 250),
                    'pdf', jsonb_build_object('enabled', false, 'maxFileSizeInMb', 250),
                    'cbx', jsonb_build_object('enabled', false, 'maxFileSizeInMb', 250)
                )
            )::text
    END
FROM app_settings
WHERE name = 'metadata_persistence_settings'
AND val IS NOT NULL
AND val != ''
AND NOT EXISTS (
    SELECT 1 FROM app_settings WHERE name = 'metadata_persistence_settings_v2'
);
