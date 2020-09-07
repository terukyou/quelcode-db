SELECT users.name AS 'ユーザー名',
    chatrooms.name AS 'チャットルーム名',
    DATE_FORMAT(chat_participants.created_at, '%Y-%m-%d') AS '参加日'
FROM chat_participants,
    users,
    chatrooms
WHERE users.id = chat_participants.user_id
    AND chatrooms.id = chat_participants.chatroom_id
    AND chatrooms.is_deleted <> 1
    AND users.is_deleted<>1
ORDER BY chat_participants.created_at;

