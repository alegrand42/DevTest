CREATE DATABASE IF NOT EXISTS sinatra_db;
USE sinatra_db;
DROP PROCEDURE IF EXISTS init;
DELIMITER //
CREATE PROCEDURE init ()
LANGUAGE SQL
BEGIN
  DECLARE user_exist, data_present INT;
  SET user_exist = (SELECT EXISTS (SELECT DISTINCT user FROM mysql.user WHERE user = "sinatra_user"));
  IF user_exist = 0 THEN
    CREATE USER 'sinatra_user'@'localhost' IDENTIFIED BY 'sinatra_pass';
    GRANT ALL PRIVILEGES ON siantra_db.* TO 'sinatra_user'@'localhost';
    FLUSH PRIVILEGES;
  END IF;
  CREATE TABLE IF NOT EXISTS posts (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(64),
    content VARCHAR(400),
    photo VARCHAR(65),
    rating INT
  );
  SET data_present = (SELECT COUNT(*) FROM posts);
  IF data_present = 0 THEN
    INSERT INTO posts (title, content, photo, rating) VALUES
      ('Mon premier article', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Id ratione harum illo, dicta minima rerum quod natus cupiditate voluptatibus rem! Amet reprehenderit voluptatum animi, eligendi quia quos reiciendis veritatis magni.', 'https://unsplash.it/600?image=0', 5),
      ('Un deuxième article', 'Eventually the guys with real ideas not running a scam on the world will overcome. I used an exclamation just to be an asshole and also to make a point! LOL Young Thug is super inspiring to me. Amazing artist!!! I also wanted to point out that it’s the first album to go number 1 off of streaming!!! ', 'https://unsplash.it/600?image=1', 2),
      ('Tout sur mon chat', 'also to Kim’s hair and makeup Lorraine jewelry and the whole style squad at Balmain and the Yeezy team. When companies doubt me they doubt us. Wes daytime', '', 4),
      ('Tout sur mon chien', "I love Rick Owens’ bed design but the back is too high for the beams and angle of the ceiling And now I look and look around and there’s so many Kanyes Man that'd be so Kanye And I promise the power is in the people and I will use the power given by the people to bring everything I have back to the people.", 'https://unsplash.it/600?image=2', 0),
      ('L affaire Cromas Town', ' Thank you Anna for the invite thank you to the whole Vogue team Thank you to everybody who made The Life of Pablo the number 1 album in the world!!! What if Kanye made a song about Kanye ', 'https://unsplash.it/600?image=3', 4);
  END IF;
END;//
DELIMITER ;
CALL init();
