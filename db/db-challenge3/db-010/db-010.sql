SELECT users.name AS 'ユーザー名',
    chats.modified_at,
    chatrooms.name AS 'チャットルーム名'
FROM chats,
    chatrooms,
    users
WHERE users.id = chats.updated_by
    AND chatrooms.id = chats.chatroom_id
    AND users.is_deleted <> 1
    AND chatrooms.is_deleted <> 1
    AND chats.modified_at IN (
        SELECT MAX(chats.modified_at) AS '投稿日時'
        FROM chats
        WHERE chats.is_deleted <> 1
        GROUP BY chats.chatroom_id
    )
ORDER BY chatrooms.id;

