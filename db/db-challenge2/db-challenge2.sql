CREATE TABLE `users`(
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(100) NOT NULL,
    `email` varchar(100) NOT NULL,
    `password` varchar(100) NOT NULL,
    `self_introduction` varchar(1000) NULL,
    `workphone` char(13) NULL,
    `mobile` char(13) NULL,
    `is_deleted` TINYINT(1) NULL DEFAULT 0,
    `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 AUTO_INCREMENT = 1;

CREATE TABLE `chatrooms`(
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(100) NOT NULL,
    `overview` varchar(1000) NULL,
    `file_is_sendable` TINYINT(1) NULL DEFAULT 1,
    `direct_chat` TINYINT(1) NULL DEFAULT 0,
    `created_by` int(11) NOT NULL,
    `updated_by` int(11) NOT NULL,
    `is_deleted` TINYINT(1) NULL DEFAULT 0,
    `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 AUTO_INCREMENT = 1;

CREATE TABLE `chat_participants`(
    `chatroom_id` int(11) NOT NULL,
    `user_id` int(11) NOT NULL,
    `participation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(`chatroom_id`, `user_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE `chats`(
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `chatroom_id` int(11) NOT NULL,
    `content` varchar(1000) NOT NULL,
    `file` varchar(100) NULL,
    `created_by` int(11) NOT NULL,
    `updated_by` int(11) NOT NULL,
    `is_deleted` TINYINT(1) NULL DEFAULT 0,
    `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 AUTO_INCREMENT = 1;

CREATE TABLE `tasks`(
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `chatroom_id` int(11) NOT NULL,
    `content` varchar(1000) NOT NULL,
    `personnel` int(11) NOT NULL,
    `deadline` timestamp NULL,
    `is_finished` TINYINT(1) NULL,
    `created_by` int(11) NOT NULL,
    `updated_by` int(11) NOT NULL,
    `is_deleted` TINYINT(1) NULL DEFAULT 0,
    `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 AUTO_INCREMENT = 1;

