BEGIN;
UPDATE tasks
SET is_finished = 1,
    updated_by = 1
WHERE created_at BETWEEN '2020-04-26 09:00' AND '2020-04-26 11:30'
    AND is_deleted <> 1;
COMMIT;
