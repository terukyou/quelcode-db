SELECT users.name AS 'ユーザー名',
    chats_latest AS '投稿日',
    chatrooms.name AS 'チャットルーム名'
FROM users,
    chatrooms,
    (
        SELECT A.chatroom_id as room_id,
            A.updated_by as user_id,
            chats_latest
        FROM chats as A
            JOIN (
                SELECT MAX(chats.modified_at) AS chats_latest,
                    chatroom_id
                FROM chats
                WHERE chats.is_deleted <> 1
                GROUP BY chats.chatroom_id
            ) AS max ON chats_latest = A.modified_at
    ) AS m
WHERE room_id = chatrooms.id
    AND user_id = users.id
    AND users.is_deleted <> 1
ORDER BY chatrooms.id;
