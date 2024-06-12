CREATE TABLE IF NOT EXISTS `injuries` (
    `cid` VARCHAR(60) NOT NULL,
    `injuries` JSON NOT NULL DEFAULT '[]',
    PRIMARY KEY (`cid`),
    CONSTRAINT `valid_char` FOREIGN KEY (`cid`) REFERENCES `users` (`cid`) ON UPDATE CASCADE ON DELETE CASCADE
);