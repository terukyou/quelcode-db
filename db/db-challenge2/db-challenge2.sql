CREATE TABLE `users`(
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `password` VARCHAR(100) NOT NULL,
    `self_introduction` VARCHAR(1000) NULL,
    `work_phone` VARCHAR(13) NULL,
    `mobile_phone` VARCHAR(13) NULL,
    `is_deleted` TINYINT(1) NULL DEFAULT 0,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `modified_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 AUTO_INCREMENT = 1;

CREATE TABLE `chatrooms`(
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `overview` VARCHAR(1000) NULL,
    `is_file_sendable` TINYINT(1) NULL DEFAULT 1,
    `is_direct_chat` TINYINT(1) NULL DEFAULT 0,
    `created_by` INT(11) NOT NULL,
    `updated_by` INT(11) NOT NULL,
    `is_deleted` TINYINT(1) NULL DEFAULT 0,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `modified_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`created_by`) REFERENCES `users`(`id`),
    FOREIGN KEY (`updated_by`) REFERENCES `users`(`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 AUTO_INCREMENT = 1;

CREATE TABLE `chat_participants`(
    `chatroom_id` INT(11) NOT NULL,
    `user_id` INT(11) NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(`chatroom_id`, `user_id`),
    FOREIGN KEY (`chatroom_id`) REFERENCES `chatrooms`(`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE `chats`(
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `chatroom_id` INT(11) NOT NULL,
    `content` VARCHAR(1000) NOT NULL,
    `file` VARCHAR(100) NULL,
    `created_by` INT(11) NOT NULL,
    `updated_by` INT(11) NOT NULL,
    `is_deleted` TINYINT(1) NULL DEFAULT 0,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `modified_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(`id`),
    FOREIGN KEY (`chatroom_id`) REFERENCES `chatrooms`(`id`),
    FOREIGN KEY (`created_by`) REFERENCES `users`(`id`),
    FOREIGN KEY (`updated_by`) REFERENCES `users`(`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 AUTO_INCREMENT = 1;

CREATE TABLE `tasks`(
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `chatroom_id` INT(11) NOT NULL,
    `content` VARCHAR(1000) NOT NULL,
    `personnel` INT(11) NOT NULL,
    `deadline` TIMESTAMP NULL,
    `is_finished` TINYINT(1) NULL,
    `created_by` INT(11) NOT NULL,
    `updated_by` INT(11) NOT NULL,
    `is_deleted` TINYINT(1) NULL DEFAULT 0,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `modified_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(`id`),
    FOREIGN KEY (`chatroom_id`) REFERENCES `chatrooms`(`id`),
    FOREIGN KEY (`personnel`) REFERENCES `users`(`id`),
    FOREIGN KEY (`created_by`) REFERENCES `users`(`id`),
    FOREIGN KEY (`updated_by`) REFERENCES `users`(`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 AUTO_INCREMENT = 1;

