BEGIN;
UPDATE users
SET is_deleted = 1
WHERE (
        work_phone IS NULL
        AND mobile_phone IS NULL
    )
    OR(
        work_phone = ''
        AND mobile_phone = ''
    )
    AND is_deleted <> 1;
COMMIT;
