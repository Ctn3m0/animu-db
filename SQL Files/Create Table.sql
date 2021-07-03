DROP DATABASE IF EXISTS final_project;
CREATE DATABASE IF NOT EXISTS final_project DEFAULT CHARACTER SET latin1;
USE final_project;

CREATE TABLE IF NOT EXISTS author (
	id INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) DEFAULT 'Unknown',
    UNIQUE (id),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS anime (
	id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(100),
    episodes VARCHAR(100),
    series VARCHAR(100),
	premiered VARCHAR(100),
    start_on_air DATE,
    finish_on_air DATE,
    ratings	VARCHAR(100),
    `status` VARCHAR(100) DEFAULT 'unknown',
    `source` VARCHAR(100),
    views INT DEFAULT 0,
    author_id INT NOT NULL,
    FOREIGN KEY (author_id) REFERENCES author (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    UNIQUE (title),
    PRIMARY KEY (id)
); 

CREATE TABLE IF NOT EXISTS episode (
	id INT NOT NULL AUTO_INCREMENT,
    anime_id INT NOT NULL,
    number_of_order VARCHAR(100),
    duration VARCHAR(20) DEFAULT '24 Mins',
    PRIMARY KEY (id),
    FOREIGN KEY (anime_id) REFERENCES anime(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
); 

CREATE TABLE IF NOT EXISTS characters (
	id INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100),
    age VARCHAR(100),
    gender VARCHAR(20) DEFAULT 'unspecified',
    `status` VARCHAR(100),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS genre (
	id INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(100),
    `description` VARCHAR(1000),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS voice_actor (
	id INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    gender VARCHAR(20) DEFAULT 'unspecified',
    dob DATE,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS studio (
	id INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS watcher (
	id INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100),
    `gender` VARCHAR(20) DEFAULT 'unspecified',
    dob DATE,
    email VARCHAR(100) NOT NULL,
    watching INT DEFAULT 0,
    plan_to_watch INT DEFAULT 0,
    completed INT DEFAULT 0,
    UNIQUE (`name`),
    UNIQUE (email),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS comments (
	id INT NOT NULL AUTO_INCREMENT,
    content VARCHAR(1000000),
    `time` DATETIME,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS favorite (
	watcher_id INT NOT NULL,
    anime_id INT NOT NULL,
    PRIMARY KEY (watcher_id, anime_id),
    FOREIGN KEY (watcher_id) REFERENCES watcher(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    FOREIGN KEY (anime_id) REFERENCES anime(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS plan_to_watch (
	watcher_id INT NOT NULL,
    anime_id INT NOT NULL,
    PRIMARY KEY (watcher_id, anime_id),
    FOREIGN KEY (watcher_id) REFERENCES watcher(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    FOREIGN KEY (anime_id) REFERENCES anime(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS `History` (
	watcher_id INT NOT NULL,
    anime_id INT NOT NULL,
    episode_id INT NOT NULL,
    `time` DATE,
    PRIMARY KEY (watcher_id, anime_id, episode_id),
    FOREIGN KEY (watcher_id) REFERENCES watcher(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    FOREIGN KEY (anime_id) REFERENCES anime(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    FOREIGN KEY (episode_id) REFERENCES episode(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Make (
	studio_id INT NOT NULL,
    anime_id INT NOT NULL,
    PRIMARY KEY (studio_id, anime_id),
    FOREIGN KEY (studio_id) REFERENCES studio(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    FOREIGN KEY (anime_id) REFERENCES anime(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS character_anime (
	characters_id INT NOT NULL,
    anime_id INT NOT NULL,
    PRIMARY KEY (characters_id, anime_id),
    FOREIGN KEY (characters_id) REFERENCES characters(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    FOREIGN KEY (anime_id) REFERENCES anime(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Dub (
	characters_id INT NOT NULL,
    voice_actor_id INT NOT NULL,
    PRIMARY KEY (characters_id),
    FOREIGN KEY (characters_id) REFERENCES characters(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    FOREIGN KEY (voice_actor_id) REFERENCES voice_actor(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS author_character (
	characters_id INT NOT NULL,
    author_id INT NOT NULL,
    PRIMARY KEY (characters_id, author_id),
    FOREIGN KEY (characters_id) REFERENCES characters(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES author(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Participate (
	voice_actor_id INT NOT NULL,
    anime_id INT NOT NULL,
    PRIMARY KEY (voice_actor_id, anime_id),
    FOREIGN KEY (voice_actor_id) REFERENCES voice_actor(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    FOREIGN KEY (anime_id) REFERENCES anime(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Have (
	genre_id INT NOT NULL,
    anime_id INT NOT NULL,
    PRIMARY KEY (genre_id, anime_id),
    FOREIGN KEY (genre_id) REFERENCES genre(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    FOREIGN KEY (anime_id) REFERENCES anime(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS episode_anime (
	episode_id INT NOT NULL,
    anime_id INT NOT NULL,
    PRIMARY KEY (episode_id, anime_id),
    FOREIGN KEY (episode_id) REFERENCES episode(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    FOREIGN KEY (anime_id) REFERENCES anime(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS comment_watcher (
	comment_id INT NOT NULL,
    watcher_id INT NOT NULL,
    PRIMARY KEY (comment_id, watcher_id),
    FOREIGN KEY (comment_id) REFERENCES comments(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    FOREIGN KEY (watcher_id) REFERENCES watcher(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS comment_episode (
	comment_id INT NOT NULL,
    episode_id INT NOT NULL,
    PRIMARY KEY (comment_id, episode_id),
    FOREIGN KEY (comment_id) REFERENCES comments(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    FOREIGN KEY (episode_id) REFERENCES episode(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);