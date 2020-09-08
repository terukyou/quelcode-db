SELECT COUNT(chats.chatroom_id) AS '投稿数',
    chatrooms.name AS 'チャットルーム名'
FROM chats,
    chatrooms
WHERE chats.chatroom_id = chatrooms.id
    AND chats.is_deleted <> 1
    AND chatrooms.is_deleted<>1
GROUP BY chatrooms.name
ORDER BY COUNT(*) DESC;
