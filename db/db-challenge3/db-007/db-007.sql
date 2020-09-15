SELECT id,
    name,
    overview,
    CASE
        is_file_sendable
        WHEN 1 THEN '許可'
        ELSE '禁止'
    END AS is_file_sendable,
    is_direct_chat,
    created_by,
    updated_by,
    is_deleted,
    created_at,
    modified_at
FROM chatrooms
WHERE overview LIKE '%ダイレクトチャット'
    AND is_deleted <> 1
ORDER BY id;

