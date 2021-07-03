USE final_project;

INSERT INTO author (name) VALUES ("Shinkai Makoto");
INSERT INTO author (name) VALUES ("Fujiko Fujio");
INSERT INTO author (name) VALUES ("Miyazaki Hayao");
SELECT * FROM author;

INSERT INTO anime (title, episodes, series, premiered, start_on_air, finish_on_air, ratings, `status`, `source`, author_id) VALUES ("Spirited Away", "1", "Spirited Away", "Autumn 2001", "2001-07-20","2001-07-20","PG - Children","Finished Airing","Original", 3);
INSERT INTO anime (title, episodes, series, premiered, start_on_air, finish_on_air, ratings, `status`, `source`, author_id) VALUES ("Howl's Moving Castle", "1", "Howl's Moving Castle", "Winter 2004", "2004-11-20","2004-11-20","G - All Ages","Finished Airing","Novel", 3);
INSERT INTO anime (title, episodes, series, premiered, start_on_air, finish_on_air, ratings, `status`, `source`, author_id) VALUES ("Your Name", "1", "Your Name", "Autumn 2016", "2016-08-26","2016-08-26","PG - 13","Finished Airing","Original", 1);
INSERT INTO anime (title, episodes, series, premiered, start_on_air, finish_on_air, ratings, `status`, `source`, author_id) VALUES ("Princess Mononoke", "1", "Princess Mononoke", "Autumn 1997", "1997-07-12","1997-07-12","PG - 13","Finished Airing","Original", 3);
INSERT INTO anime (title, episodes, series, premiered, start_on_air, finish_on_air, ratings, `status`, `source`, author_id) VALUES ("Doraemon", "1787", "Doraemon", "Spring 1979", "1979-04-02","2005-03-18","PG - Children","Finished Airing","Manga", 2);
INSERT INTO anime (title, episodes, series, premiered, start_on_air, finish_on_air, ratings, `status`, `source`, author_id) VALUES ("Doraemon the Movie: Nobita and the Windmasters", "1", "Doraemon", "Spring 2003", "2003-03-08","2003-03-08","PG - Children","Finished Airing","Manga", 2);
SELECT * FROM anime;

INSERT INTO episode (anime_id,number_of_order,duration) VALUES (1,1,"2 Hrs. 5 Mins");
INSERT INTO episode (anime_id,number_of_order,duration) VALUES (2,1,"1 Hr. 59 Mins");
INSERT INTO episode (anime_id,number_of_order,duration) VALUES (3,1,"1 Hr. 46 Mins");
INSERT INTO episode (anime_id,number_of_order,duration) VALUES (4,1,"2 Hrs. 15 Mins");
INSERT INTO episode (anime_id,number_of_order,duration) VALUES (5,1,"11 Mins");
INSERT INTO episode (anime_id,number_of_order,duration) VALUES (5,2,"11 Mins");
INSERT INTO episode (anime_id,number_of_order,duration) VALUES (5,3,"11 Mins");
INSERT INTO episode (anime_id,number_of_order,duration) VALUES (5,4,"11 Mins");
INSERT INTO episode (anime_id,number_of_order,duration) VALUES (6,1,"1 Hr. 20 Mins");
SELECT * FROM episode;

INSERT INTO characters (`name`,age,gender,`status`) VALUES ("Haku",12,"Male","Alive");
INSERT INTO characters (`name`,age,gender,`status`) VALUES ("Chihiro Ogino",12,"Female","Alive");
INSERT INTO characters (`name`,age,gender,`status`) VALUES ("Howl",27,"Male","Alive");
INSERT INTO characters (`name`,age,gender,`status`) VALUES ("Sophie Hatter",18,"Female","Alive");
INSERT INTO characters (`name`,age,gender,`status`) VALUES ("Tachibana Taki",23,"Male","Alive");
INSERT INTO characters (`name`,age,gender,`status`) VALUES ("Miyamizu Mitsuha",26,"Female","Alive");
INSERT INTO characters (`name`,age,gender,`status`) VALUES ("San",16,"Female","Alive");
INSERT INTO characters (`name`,age,gender,`status`) VALUES ("Ashitaka",17,"Male","Alive");
INSERT INTO characters (`name`,age,gender,`status`) VALUES ("Nobi Nobita",10,"Male","Alive");
INSERT INTO characters (`name`,age,`status`) VALUES ("Doraemon",10,"Alive");
SELECT * FROM characters;

INSERT INTO genre (`name`, `description`) VALUES ("Fantasy","A genre of speculative fiction set in a fictional universe, inspired by myth and folklore");
INSERT INTO genre (`name`, `description`) VALUES ("Adventure","A genre of film whose plots feature elements of travel");
INSERT INTO genre (`name`, `description`) VALUES ("Supernatural","A genre of speculative fiction that exploits or is centered on supernatural themes");
INSERT INTO genre (`name`, `description`) VALUES ("Drama","A genre of narrative fiction intended to be serious in tone, focusing on in-depth development of characters who must deal with emotional struggles");
INSERT INTO genre (`name`, `description`) VALUES ("Romance","Primarily focused on the relationship between the main characters of the story");
INSERT INTO genre (`name`, `description`) VALUES ("School","Centering on school-life");
INSERT INTO genre (`name`, `description`) VALUES ("Action","The main character usually takes a risky turn which leads to desperate situations");
INSERT INTO genre (`name`, `description`) VALUES ("Comedy","Tells about a series of funny or comical events intended to make the audience laugh");
INSERT INTO genre (`name`, `description`) VALUES ("Kids","Innocent and easy-to-understand storyline, suitable for children");
SELECT * FROM genre;

INSERT INTO voice_actor (`name`, gender, dob) VALUES ("Miyu Irino", "Male", "1988-02-19");
INSERT INTO voice_actor (`name`, gender, dob) VALUES ("Rumi Hiiragi", "Female", "1987-08-01");
INSERT INTO voice_actor (`name`, gender, dob) VALUES ("Takuya Kimura", "Male", "1972-11-13");
INSERT INTO voice_actor (`name`, gender, dob) VALUES ("Chieko Baisho", "Female", "1941-06-29");
INSERT INTO voice_actor (`name`, gender, dob) VALUES ("Ryuunosuke Kamiki", "Male", "1993-05-19");
INSERT INTO voice_actor (`name`, gender, dob) VALUES ("Mone Kamishiraishi", "Female", "1998-01-27");
INSERT INTO voice_actor (`name`, gender, dob) VALUES ("Yuriko Ishida", "Female", "1969-10-03");
INSERT INTO voice_actor (`name`, gender, dob) VALUES ("Youji Matsuda", "Male", "1967-10-19");
INSERT INTO voice_actor (`name`, gender, dob) VALUES ("Noriko Ohara", "Female", "1935-10-02");
INSERT INTO voice_actor (`name`, gender, dob) VALUES ("Nobuyo Ooyama", "Female", "1933-10-16");
SELECT * FROM voice_actor;

INSERT INTO studio (`name`) VALUES ("Ghibli");
INSERT INTO studio (`name`) VALUES ("CoMix Wave Films");
INSERT INTO studio (`name`) VALUES ("Shin-Ei Animation");
SELECT * FROM studio;

INSERT INTO watcher (`name`,gender,dob,email) VALUES ("bellkirato","Male","2001-07-22","hungdd.bi10-073@st.usth.edu.vn");
INSERT INTO watcher (`name`,gender,dob,email) VALUES ("ctn3m0","Male","2001-08-15","hieutq.bi10-065@st.usth.edu.vn");
INSERT INTO watcher (`name`,gender,dob,email) VALUES ("zer0warm","Male","1997-09-20","hieudq.bi10-063@st.usth.edu.vn");
INSERT INTO watcher (`name`,gender,dob,email) VALUES ("homi","Male","2001-05-19","minhnh.bi10-112@st.usth.edu.vn");
INSERT INTO watcher (`name`,gender,dob,email) VALUES ("kwan","Male","2001-11-01","quandh.bi10-147@st.usth.edu.vn");
SELECT * FROM watcher;

INSERT INTO comments (content,`time`) VALUES ("Very good", "2020-12-08 01:41:00");
INSERT INTO comments (content,`time`) VALUES ("Great Anime!", "2020-12-08 00:41:00");
INSERT INTO comments (content,`time`) VALUES ("I love Mitsuha", "2020-12-08 19:21:00");
SELECT * FROM comments;

INSERT INTO favorite (watcher_id, anime_id) VALUES (1,1);
INSERT INTO favorite (watcher_id, anime_id) VALUES (1,2);
INSERT INTO favorite (watcher_id, anime_id) VALUES (1,3);
INSERT INTO favorite (watcher_id, anime_id) VALUES (2,1);
INSERT INTO favorite (watcher_id, anime_id) VALUES (2,4);
INSERT INTO favorite (watcher_id, anime_id) VALUES (3,5);
SELECT * FROM favorite;

INSERT INTO plan_to_watch (watcher_id, anime_id) VALUES (1,4);
INSERT INTO plan_to_watch (watcher_id, anime_id) VALUES (1,5);
INSERT INTO plan_to_watch (watcher_id, anime_id) VALUES (2,2);
INSERT INTO plan_to_watch (watcher_id, anime_id) VALUES (2,3);
INSERT INTO plan_to_watch (watcher_id, anime_id) VALUES (3,1);
INSERT INTO plan_to_watch (watcher_id, anime_id) VALUES (3,2);
SELECT * FROM plan_to_watch;

INSERT INTO `History` (watcher_id, anime_id, episode_id, `time`) VALUES (1,1,1,"2020-07-22");
INSERT INTO `History` (watcher_id, anime_id, episode_id, `time`) VALUES (1,2,2,"2020-08-20");
INSERT INTO `History` (watcher_id, anime_id, episode_id, `time`) VALUES (2,1,1,"2019-12-24");
SELECT * FROM `History`;

INSERT INTO Make (studio_id, anime_id) VALUES (1,1);
INSERT INTO Make (studio_id, anime_id) VALUES (1,2);
INSERT INTO Make (studio_id, anime_id) VALUES (1,4);
INSERT INTO Make (studio_id, anime_id) VALUES (2,3);
INSERT INTO Make (studio_id, anime_id) VALUES (3,5);
INSERT INTO Make (studio_id, anime_id) VALUES (3,6);
SELECT * FROM Make;

INSERT INTO character_anime (characters_id, anime_id) VALUES (1,1);
INSERT INTO character_anime (characters_id, anime_id) VALUES (2,1);
INSERT INTO character_anime (characters_id, anime_id) VALUES (3,2);
INSERT INTO character_anime (characters_id, anime_id) VALUES (4,2);
INSERT INTO character_anime (characters_id, anime_id) VALUES (5,3);
INSERT INTO character_anime (characters_id, anime_id) VALUES (6,3);
INSERT INTO character_anime (characters_id, anime_id) VALUES (7,4);
INSERT INTO character_anime (characters_id, anime_id) VALUES (8,4);
INSERT INTO character_anime (characters_id, anime_id) VALUES (9,5);
INSERT INTO character_anime (characters_id, anime_id) VALUES (10,5);
INSERT INTO character_anime (characters_id, anime_id) VALUES (9,6);
INSERT INTO character_anime (characters_id, anime_id) VALUES (10,6);
SELECT * FROM character_anime;

INSERT INTO Dub (characters_id, voice_actor_id) VALUES (1,1);
INSERT INTO Dub (characters_id, voice_actor_id) VALUES (2,2);
INSERT INTO Dub (characters_id, voice_actor_id) VALUES (3,3);
INSERT INTO Dub (characters_id, voice_actor_id) VALUES (4,4);
INSERT INTO Dub (characters_id, voice_actor_id) VALUES (5,5);
INSERT INTO Dub (characters_id, voice_actor_id) VALUES (6,6);
INSERT INTO Dub (characters_id, voice_actor_id) VALUES (7,7);
INSERT INTO Dub (characters_id, voice_actor_id) VALUES (8,8);
INSERT INTO Dub (characters_id, voice_actor_id) VALUES (9,9);
INSERT INTO Dub (characters_id, voice_actor_id) VALUES (10,10);
SELECT * FROM Dub;

INSERT INTO author_character (characters_id, author_id) VALUES (1,3);
INSERT INTO author_character (characters_id, author_id) VALUES (2,3);
INSERT INTO author_character (characters_id, author_id) VALUES (3,3);
INSERT INTO author_character (characters_id, author_id) VALUES (4,3);
INSERT INTO author_character (characters_id, author_id) VALUES (5,1);
INSERT INTO author_character (characters_id, author_id) VALUES (6,1);
INSERT INTO author_character (characters_id, author_id) VALUES (7,3);
INSERT INTO author_character (characters_id, author_id) VALUES (8,3);
INSERT INTO author_character (characters_id, author_id) VALUES (9,2);
INSERT INTO author_character (characters_id, author_id) VALUES (10,2);
SELECT * FROM author_character;

INSERT INTO Participate (voice_actor_id, anime_id) VALUES (1,1);
INSERT INTO Participate (voice_actor_id, anime_id) VALUES (2,1);
INSERT INTO Participate (voice_actor_id, anime_id) VALUES (3,2);
INSERT INTO Participate (voice_actor_id, anime_id) VALUES (4,2);
INSERT INTO Participate (voice_actor_id, anime_id) VALUES (5,3);
INSERT INTO Participate (voice_actor_id, anime_id) VALUES (6,3);
INSERT INTO Participate (voice_actor_id, anime_id) VALUES (7,4);
INSERT INTO Participate (voice_actor_id, anime_id) VALUES (8,4);
INSERT INTO Participate (voice_actor_id, anime_id) VALUES (9,5);
INSERT INTO Participate (voice_actor_id, anime_id) VALUES (10,5);
INSERT INTO Participate (voice_actor_id, anime_id) VALUES (9,6);
INSERT INTO Participate (voice_actor_id, anime_id) VALUES (10,6);
SELECT * FROM Participate;

INSERT INTO Have (anime_id, genre_id) VALUES (1,2);
INSERT INTO Have (anime_id, genre_id) VALUES (1,3);
INSERT INTO Have (anime_id, genre_id) VALUES (1,4);
INSERT INTO Have (anime_id, genre_id) VALUES (2,1);
INSERT INTO Have (anime_id, genre_id) VALUES (2,2);
INSERT INTO Have (anime_id, genre_id) VALUES (2,4);
INSERT INTO Have (anime_id, genre_id) VALUES (2,5);
INSERT INTO Have (anime_id, genre_id) VALUES (3,3);
INSERT INTO Have (anime_id, genre_id) VALUES (3,4);
INSERT INTO Have (anime_id, genre_id) VALUES (3,5);
INSERT INTO Have (anime_id, genre_id) VALUES (3,6);
INSERT INTO Have (anime_id, genre_id) VALUES (4,1);
INSERT INTO Have (anime_id, genre_id) VALUES (4,2);
INSERT INTO Have (anime_id, genre_id) VALUES (4,7);
INSERT INTO Have (anime_id, genre_id) VALUES (5,1);
INSERT INTO Have (anime_id, genre_id) VALUES (5,2);
INSERT INTO Have (anime_id, genre_id) VALUES (5,8);
INSERT INTO Have (anime_id, genre_id) VALUES (5,9);
INSERT INTO Have (anime_id, genre_id) VALUES (6,1);
INSERT INTO Have (anime_id, genre_id) VALUES (6,2);
INSERT INTO Have (anime_id, genre_id) VALUES (6,8);
INSERT INTO Have (anime_id, genre_id) VALUES (6,9);
SELECT * FROM Have;

INSERT INTO episode_anime (episode_id, anime_id) VALUES (1,1);
INSERT INTO episode_anime (episode_id, anime_id) VALUES (2,2);
INSERT INTO episode_anime (episode_id, anime_id) VALUES (3,3);
INSERT INTO episode_anime (episode_id, anime_id) VALUES (4,4);
INSERT INTO episode_anime (episode_id, anime_id) VALUES (5,5);
INSERT INTO episode_anime (episode_id, anime_id) VALUES (6,5);
INSERT INTO episode_anime (episode_id, anime_id) VALUES (7,5);
INSERT INTO episode_anime (episode_id, anime_id) VALUES (8,5);
INSERT INTO episode_anime (episode_id, anime_id) VALUES (9,6);
SELECT * FROM episode_anime;

INSERT INTO comment_watcher (comment_id, watcher_id) VALUES (1,1);
INSERT INTO comment_watcher (comment_id, watcher_id) VALUES (2,2);
INSERT INTO comment_watcher (comment_id, watcher_id) VALUES (3,3);
SELECT * FROM comment_watcher;

INSERT INTO comment_episode (comment_id, episode_id) VALUES (1,1);
INSERT INTO comment_episode (comment_id, episode_id) VALUES (2,2);
INSERT INTO comment_episode (comment_id, episode_id) VALUES (3,3);
SELECT * FROM comment_episode;





