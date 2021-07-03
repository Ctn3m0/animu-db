USE final_project;

#Upload new author
DELIMITER $$ 
CREATE PROCEDURE upload_author(IN `name` VARCHAR(100))
BEGIN
	INSERT INTO author (`name`) VALUES (`name`);
END $$
DELIMITER ;

#Edit author's information
DELIMITER $$ 
CREATE PROCEDURE edit_author(IN author_id INT, `name` VARCHAR(100))
BEGIN
	UPDATE author
    SET `name`= `name`
    WHERE id = author_id;
END $$
DELIMITER ;

#Upload new studio
DELIMITER $$ 
CREATE PROCEDURE upload_studio(IN `name` VARCHAR(100))
BEGIN
	INSERT INTO studio (`name`) VALUES (`name`);
END $$
DELIMITER ;

#Edit studio's information
DELIMITER $$ 
CREATE PROCEDURE edit_studio(IN studio_id INT, `name` VARCHAR(100))
BEGIN
	UPDATE studio
    SET `name`= `name`
    WHERE id = studio_id;
END $$
DELIMITER ;

#Declare that a studio make an anime
DELIMITER $$ 
CREATE PROCEDURE set_anime_studio(IN anime_id INT, studio_id INT)
BEGIN
	INSERT INTO Make VALUES (anime_id,studio_id);
END $$
DELIMITER ;

#Upload new genre
DELIMITER $$ 
CREATE PROCEDURE upload_genre(IN `name` VARCHAR(100), `description` VARCHAR(100))
BEGIN
	INSERT INTO studio (`name`, `description`) VALUES (`name`, `description`);
END $$
DELIMITER ;

#Edit genre's information
DELIMITER $$ 
CREATE PROCEDURE edit_genre(IN genre_id INT, `name` VARCHAR(100), `description` VARCHAR(100))
BEGIN
	UPDATE genre
    SET `name`= `name`, `description` = `description`
    WHERE id = genre_id;
END $$
DELIMITER ;

#Upload a new character
DELIMITER $$ 
CREATE PROCEDURE upload_characters(IN `name` VARCHAR(100), age VARCHAR(100), gender VARCHAR(20), `status` VARCHAR(100))
BEGIN
	INSERT INTO characters (`name`, age, gender, `status`) VALUES (`name`, age, gender, `status`);
END $$
DELIMITER ;

#Edit character's information
DELIMITER $$ 
CREATE PROCEDURE edit_characters(IN character_id INT, `name` VARCHAR(100), age VARCHAR(100), gender VARCHAR(20), `status` VARCHAR(100))
BEGIN
	UPDATE characters
    SET `name`= `name`, age=age, gender=gender, `status`=`status`
    WHERE id = character_id;
END $$
DELIMITER ;

#Declare that a character is in an anime
DELIMITER $$ 
CREATE PROCEDURE character_in_anime(IN anime_id INT, character_id INT)
BEGIN
	INSERT INTO character_anime VALUES (anime_id,character_id);
END $$
DELIMITER ;

#Declare that a character was made by an author
DELIMITER $$ 
CREATE PROCEDURE set_character_author(IN author_id INT, character_id INT)
BEGIN
	INSERT INTO author_character VALUES (author_id,character_id);
END $$
DELIMITER ;

#Upload new voice actor
DELIMITER $$ 
CREATE PROCEDURE upload_voice_actor(`name` VARCHAR(100),gender VARCHAR(20), dob DATE)
BEGIN
	INSERT INTO voice_actor (`name`, gender, dob) VALUES (`name`, gender, dob);
END $$
DELIMITER ;

#Edit voice actor's information
DELIMITER $$ 
CREATE PROCEDURE edit_voice_actor(IN voice_actor_id INT, `name` VARCHAR(100),gender VARCHAR(20), dob DATE)
BEGIN
	UPDATE voice_actor
    SET `name`= `name`,gender=gender, dob=dob
    WHERE id = voice_actor_id;
END $$
DELIMITER ;

#Declare a voice actor for a character
DELIMITER $$ 
CREATE PROCEDURE set_voice_actor(IN character_id INT, voice_actor_id INT)
BEGIN
	INSERT INTO Dub VALUES (character_id,voice_actor_id);
END $$
DELIMITER ;

#Declare the participation of a voice actor in an anime
DELIMITER $$ 
CREATE PROCEDURE Participate(IN anime_id INT, voice_actor_id INT)
BEGIN
	INSERT INTO Participate VALUES (anime_id,voice_actor_id);
END $$
DELIMITER ;

#Upload new anime
DELIMITER $$ 
CREATE PROCEDURE upload_anime(IN title VARCHAR(100), episodes VARCHAR(100), series VARCHAR(100), premiered VARCHAR(100), start_on_air DATE, finish_on_air DATE, ratings	VARCHAR(100), `source` VARCHAR(100), author_id INT)
BEGIN
	INSERT INTO anime (title, episodes, series, premiered, start_on_air, finish_on_air, ratings, `source`, views, author_id) VALUES (title, episodes, series, premiered, start_on_air, finish_on_air, ratings, `source`, author_id);
END $$
DELIMITER ;


#Edit anime's information
DELIMITER $$ 
CREATE PROCEDURE edit_anime(IN anime_id INT, title VARCHAR(100), episodes VARCHAR(100),series VARCHAR(100),premiered VARCHAR(100),start_on_air DATE,finish_on_air DATE,ratings VARCHAR(100),`status` VARCHAR(100),`source` VARCHAR(100), author_id INT)
BEGIN
	UPDATE anime 
    SET title = title, episodes = episodes, series = series, premiered = premiered, start_on_air = start_on_air, finish_on_air = finish_on_air, ratings = ratings, `status` = `status`, `source` = `source`, author_id = author_id
    WHERE id = anime_id;
END $$
DELIMITER ;

#View anime's information
DELIMITER $$ 
CREATE PROCEDURE view_anime(IN anime_id INT)
BEGIN
	SELECT * FROM anime
    WHERE id = anime_id;
END $$
DELIMITER ;

#Add a genre to an anime
DELIMITER $$ 
CREATE PROCEDURE set_genre(IN anime_id INT, genre_id INT)
BEGIN
	INSERT INTO Have VALUES (anime_id,genre_id);
END $$
DELIMITER ;

#Delete an anime
DELIMITER $$ 
CREATE PROCEDURE delete_anime(IN anime_id INT)
BEGIN
	DELETE FROM anime WHERE id = anime_id;
END $$
DELIMITER ;

#Upload an anime's new episode
DELIMITER $$ 
CREATE PROCEDURE upload_episode(IN anime_id INT, number_of_order VARCHAR(100), duration VARCHAR(20))
BEGIN
	INSERT INTO episode (anime_id, number_of_order, duration) VALUES (anime_id, number_of_order, duration);
    INSERT INTO episode_anime (episode_id, anime_id) VALUES (MAX(episode.id), anime_id);
END $$
DELIMITER ;

#Delete an anime's particular episode
DELIMITER $$ 
CREATE PROCEDURE delete_episode(IN episode_id INT)
BEGIN
	DELETE FROM episode WHERE id = episode_id;
END $$
DELIMITER ;

#Change an anime's status:
DELIMITER $$ 
CREATE PROCEDURE update_status(IN anime_id INT, `status` VARCHAR(100))
BEGIN
	UPDATE anime
    SET `status` = `status`
    WHERE id = anime_id;
END $$
DELIMITER ;

#Create and update a "Top trending anime list" based on views
DELIMITER $$ 
CREATE PROCEDURE update_top_trending()
BEGIN
DROP TABLE IF EXISTS trend;
CREATE TABLE trend (
	SELECT title, views 
	FROM anime
    ORDER BY views DESC
    LIMIT 0,10
);
END $$
DELIMITER ;

#View/display "Top trending anime list"
DELIMITER $$ 
CREATE PROCEDURE display_top_trending()
BEGIN
	SELECT * FROM trend;
END $$
DELIMITER ;

#Check the number of views of an anime
DELIMITER $$ 
CREATE PROCEDURE check_view(IN anime_id INT)
BEGIN
	SELECT id, title, views
    FROM anime
    WHERE id = anime_id;
END $$
DELIMITER ;

#View watcher's comment
DELIMITER $$ 
CREATE PROCEDURE view_comment(IN comment_id INT)
BEGIN
	SELECT `time`, watcher.`name`,content 
    FROM comments 
		JOIN comment_watcher ON comments.id = comment_watcher.comment_id
		JOIN watcher ON watcher.id = comment_watcher.watcher_id
    WHERE comments.id = comment_id;
END $$
DELIMITER ;

#Edit watcher's comment
DELIMITER $$ 
CREATE PROCEDURE admin_edit_comment(IN comment_id INT, content VARCHAR(1000000))
BEGIN
	UPDATE comments SET content = content WHERE id = comment_id;
END $$
DELIMITER ;

#Delete watcher's comment
DELIMITER $$ 
CREATE PROCEDURE delete_comment(IN comment_id INT)
BEGIN
	DELETE FROM comments WHERE id = comment_id;
END $$
DELIMITER ;


















































































































