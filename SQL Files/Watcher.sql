USE final_project;

/* Register accounts */
DELIMITER $$ 
CREATE PROCEDURE register_account(IN `name` VARCHAR(100), gender VARCHAR(20), dob DATE, email VARCHAR(100))
BEGIN
	INSERT INTO watcher (`name`,gender, dob, email) VALUES (`name`,gender, dob, email);
END $$
DELIMITER ;

/* Edit account information */
DELIMITER $$ 
CREATE PROCEDURE update_account(IN watcher_id INT, `name` VARCHAR(100), gender VARCHAR(20), dob DATE, email VARCHAR(100))
BEGIN
	UPDATE watcher
    SET `name` = `name`, gender=gender, dob = dob, email= email
    WHERE id = watcher_id;
END $$
DELIMITER ;

SELECT * FROM `history`;

/* Record watch history */
DELIMITER $$ 
CREATE PROCEDURE record_history(IN watcher_id INT, anime_id INT, episode_id INT, `time` DATE)
BEGIN
	INSERT INTO `History` VALUES (anime_id, watcher_id, episode_id, `time`);
    UPDATE anime 
		SET views = views + 1
        WHERE id = anime_id;
END $$
DELIMITER ;


/* Delete account */
DELIMITER $$ 
CREATE PROCEDURE del_acc(IN watcher_id INT)
BEGIN
	DELETE FROM watcher
	WHERE id = watcher_id;
END $$
DELIMITER ;


/* Watcher adds comments */
DELIMITER $$ 
CREATE PROCEDURE add_comment(IN watcher_id INT, episode_id INT, content VARCHAR(1000000),`time` DATETIME)
BEGIN
	INSERT INTO comments (content,`time`) VALUES (content, `time`);
	INSERT INTO comment_watcher (comment_id, watcher_id) VALUES (MAX(comments.id),watcher_id);
	INSERT INTO comment_episode (comment_id, episode_id) VALUES (MAX(comments.id),episode_id);
END $$
DELIMITER ;

/* Watcher edits comment */
DELIMITER $$ 
CREATE PROCEDURE watcher_edit_comment(IN comment_id INT,content VARCHAR(1000000))
BEGIN
	UPDATE comments
	SET content = content
	WHERE id = comment_id;
END $$
DELIMITER ;


/* Watcher deletes a comment */
DELIMITER $$ 
CREATE PROCEDURE watcher_del_comment(IN comment_id INT)
BEGIN
	DELETE FROM comments
	WHERE id = comment_id;
END $$
DELIMITER ;


/* Watcher views all their comments */
DELIMITER $$ 
CREATE PROCEDURE watcher_view_comment(IN watcher_id INT)
BEGIN
	SELECT anime.title AS `anime`, episode.number_of_order AS `episode`, DATE_FORMAT(comments.`time`, "%a, %d %b %Y - %T") AS `timestamp`, comments.content
	FROM comments
	INNER JOIN comment_watcher ON comments.id = comment_watcher.comment_id
	INNER JOIN comment_episode ON comments.id = comment_episode.comment_id
	INNER JOIN episode ON comment_episode.episode_id = episode.id
	INNER JOIN anime ON episode.anime_id = anime.id
	WHERE comment_watcher.watcher_id = watcher_id;
END $$
DELIMITER ;


/* Check the number of views of an anime */
DELIMITER $$ 
CREATE PROCEDURE watcher_check_view(IN anime_id INT)
BEGIN
	SELECT id, title, views
    FROM anime
    WHERE id = anime_id;
END $$
DELIMITER ;



/* Mark an anime as planned to watch */
DELIMITER $$ 
CREATE PROCEDURE watcher_plan(IN watcher_id INT, anime_id INT)
BEGIN
	INSERT INTO plan_to_watch (watcher_id, anime_id) VALUES (watcher_id,anime_id);
END $$
DELIMITER ;


/* Mark an anime as favorite */
DELIMITER $$ 
CREATE PROCEDURE watcher_favorite(IN watcher_id INT, anime_id INT)
BEGIN
	INSERT INTO favorite (watcher_id, anime_id) VALUES (watcher_id,anime_id);
END $$
DELIMITER ;



#SEARCH FILTER:
#Search By Title
SELECT * FROM anime
WHERE (title LIKE '%Movie%');

#Search By Character
SELECT title, episodes, series, premiered, start_on_air, finish_on_air, ratings, anime.`status`, `source`, views, author.`name` as "Author name" 
FROM character_anime
	INNER JOIN characters ON character_anime.characters_id = characters.id
	INNER JOIN anime ON character_anime.anime_id = anime.id
	INNER JOIN author ON anime.author_id = author.id
WHERE (characters.`name` LIKE "%San%");

#Search By Genre
SELECT title, episodes, series, premiered, start_on_air, finish_on_air, ratings, anime.`status`, `source`, views, author.`name` as "Author name" 
FROM Have
	INNER JOIN genre ON have.genre_id = genre.id
	INNER JOIN anime ON have.anime_id = anime.id
    INNER JOIN author ON anime.author_id = author.id
WHERE (genre.`name` LIKE "%Drama%");

#Search By Studio
SELECT title, episodes, series, premiered, start_on_air, finish_on_air, ratings, anime.`status`, `source`, views, author.`name` as "Author name" 
FROM Make
	INNER JOIN studio ON make.studio_id = studio.id
	INNER JOIN anime ON make.anime_id = anime.id
    INNER JOIN author ON anime.author_id = author.id
WHERE (studio.`name` LIKE "%Ghibli%");
    
#Sort by view
SELECT title, episodes, series, premiered, start_on_air, finish_on_air, ratings, anime.`status`, `source`, views, author.`name` as "Author name" 
FROM anime
	INNER JOIN author ON anime.author_id = author.id
ORDER BY views DESC;



#Update the number of completed anime in watchers
DROP TABLE IF EXISTS completed;
DROP PROCEDURE IF EXISTS insert_to_completed;
DROP PROCEDURE IF EXISTS update_completed;
DROP PROCEDURE IF EXISTS update_watcher;

DELIMITER $$ 
CREATE PROCEDURE insert_to_completed()
BEGIN
DECLARE no INT;
  SET no = 0;
  meow: LOOP
    SET no = no +1;
    INSERT INTO completed (watcher_id, total) VALUES (no, default);
    IF no =(SELECT MAX(watcher.id) FROM watcher) THEN
	LEAVE meow;
    END IF;
 END LOOP meow;
END $$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE update_completed()
BEGIN
DECLARE no INT;
  SET no = 0;
  meow: LOOP
    SET no = no +1;
    UPDATE completed
    SET total = IFNULL((SELECT COUNT(history.anime_id) FROM history 
				 INNER JOIN watcher ON history.watcher_id = watcher.id
                   INNER JOIN episode_anime ON history.episode_id = episode_anime.episode_id
                     WHERE watcher_id = no
                       HAVING MAX(history.episode_id) = MAX(episode_anime.episode_id)),0) WHERE watcher_id = no;
    IF no = (SELECT MAX(watcher.id) FROM watcher) THEN
	LEAVE meow;
    END IF;
 END LOOP meow;
END $$
DELIMITER ;

DELIMITER $$ 
CREATE PROCEDURE update_watcher()
BEGIN
DECLARE no INT;
  SET no = 0;
  meow: LOOP
    SET no = no +1;
    UPDATE watcher
    SET completed = IFNULL((SELECT total FROM completed
											INNER JOIN watcher ON completed.watcher_id = watcher.id
											WHERE watcher_id = no),0) 
							WHERE id = no;
    IF no = (SELECT MAX(watcher.id) FROM watcher) THEN
	LEAVE meow;
    END IF;
 END LOOP meow;
END $$
DELIMITER ;

CREATE TABLE IF NOT EXISTS completed (
	watcher_id INT NOT NULL,
	total INT DEFAULT 0,
	FOREIGN KEY (watcher_id) REFERENCES watcher(id),
	PRIMARY KEY (watcher_id)
);

CALL insert_to_completed;
CALL update_completed;
SELECT * FROM completed;

CALL update_watcher;
SELECT * FROM watcher;



#VIEW ACCOUNTS
#View other watchers' accounts
DELIMITER $$ 
CREATE PROCEDURE check_others_account(IN `name` VARCHAR(100))
BEGIN
	SELECT `name`, gender, dob, email, watching, plan_to_watch, completed 
    FROM watcher
	WHERE (watcher.`name` = `name`);
END $$
DELIMITER ;


#View self-account history
DELIMITER $$ 
CREATE PROCEDURE view_my_history(IN watcher_id VARCHAR(100))
BEGIN
	SELECT anime.title, episode.number_of_order as "episode", `History`.`time` FROM `History`
	INNER JOIN watcher ON history.watcher_id = watcher.id
	INNER JOIN anime ON history.anime_id = anime.id
    INNER JOIN episode ON episode.id = history.episode_id
	WHERE `History`.watcher_id = watcher_id;
END $$
DELIMITER ;

    
#View self-account favorite
DELIMITER $$ 
CREATE PROCEDURE view_my_favorite(IN watcher_id VARCHAR(100))
BEGIN
	SELECT anime.title FROM favorite
	INNER JOIN watcher ON favorite.watcher_id = watcher.id
	INNER JOIN anime ON favorite.anime_id = anime.id
	WHERE favorite.watcher_id = watcher_id
	GROUP BY anime.id;
END $$
DELIMITER ;


#View self-account plan_to_watch
DELIMITER $$ 
CREATE PROCEDURE view_my_plan(IN watcher_id VARCHAR(100))
BEGIN
	SELECT anime.title FROM plan_to_watch
	INNER JOIN watcher ON plan_to_watch.watcher_id = watcher.id
	INNER JOIN anime ON plan_to_watch.anime_id = anime.id
	WHERE plan_to_watch.watcher_id = watcher_id
	GROUP BY anime.id;
END $$
DELIMITER ;

#View self-account
DELIMITER $$ 
CREATE PROCEDURE check_my_account(IN `name` VARCHAR(100))
BEGIN
	SELECT `name`, gender, dob, email, watching, plan_to_watch, completed 
    FROM watcher
	WHERE (watcher.`name` = `name`);
END $$
DELIMITER ;
