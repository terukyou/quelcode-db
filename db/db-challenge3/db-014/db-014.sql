BEGIN;
DELETE FROM chat_participants
WHERE user_id IN(
        SELECT id
        FROM users
        WHERE is_deleted = 1
    );
COMMIT;
