-- Create DB

CREATE SCHEMA `todo` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

USE todo;

-- Create Tables

CREATE TABLE `users` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL,
    `password` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `name_UNIQUE` (`name`)
);

CREATE TABLE `lists` (
    `id` INT AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `user_idx` (`user_id`),
    CONSTRAINT `user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
);

CREATE TABLE `tasks` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `completed_at` DATETIME,
    `completed` BOOLEAN NOT NULL,
    `user_id` INT NOT NULL,
    `list_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    KEY `list_idx` (`list_id`),
    CONSTRAINT `lists` FOREIGN KEY (`list_id`) REFERENCES `lists` (`id`) ON DELETE CASCADE
);


-- Initial data

-- User 1
INSERT INTO `users` (`id`, `name`, `password`) VALUES (1, 'user1', 'P@ssw0rd1');

INSERT INTO `lists` (`id`, `name`, `user_id`) VALUES (1, 'User 1 TODO list 1', 1);
INSERT INTO `tasks` (`name`, `completed`, `list_id`, `user_id`) VALUES ('Buy some milk', 0, 1, 1);
INSERT INTO `tasks` (`name`, `completed`, `list_id`, `user_id`) VALUES ('Walk the dog', 0, 1, 1);

INSERT INTO `lists` (`id`, `name`, `user_id`) VALUES (11, 'User 1 TODO list 2', 1);
INSERT INTO `tasks` (`name`, `completed`, `list_id`, `user_id`) VALUES ('Call the granma', 0, 11, 1);

-- User 2
INSERT INTO `users` (`id`, `name`, `password`) VALUES (2, 'user2', 'P@ssw0rd2');

INSERT INTO `lists` (`id`, `name`, `user_id`) VALUES (2, 'User 2 TODO list', 2);
INSERT INTO `tasks` (`name`, `completed`, `list_id`, `user_id`) VALUES ('Pay the bills', 0, 2, 2);

-- User 3
INSERT INTO `users` (`id`, `name`, `password`) VALUES (3, 'user3', 'P@ssw0rd3');



