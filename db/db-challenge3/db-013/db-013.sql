BEGIN;
UPDATE users
SET is_deleted = 1
WHERE work_phone IS NULL
    AND mobile_phone IS NULL
    AND is_deleted <> 1;
COMMIT;
