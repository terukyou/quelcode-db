BEGIN;
UPDATE chatrooms
SET is_file_sendable = 0,
    updated_by = 1
WHERE id NOT IN(
        SELECT chatroom_id
        FROM chat_participants
        WHERE user_id = 1
    )
    AND is_file_sendable <> 0
    AND is_deleted <> 1;
COMMIT;