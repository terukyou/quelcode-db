SELECT COUNT(chats.chatroom_id) AS '投稿数',
    chatrooms.name AS 'チャットルーム名'
FROM chats,
    chatrooms,
    users
WHERE chats.chatroom_id = chatrooms.id
    AND chats.updated_by = users.id
    AND chats.is_deleted <> 1
    AND users.is_deleted <> 1
GROUP BY chatrooms.id
ORDER BY COUNT(*) DESC;
