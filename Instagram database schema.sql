Create DataBase if not exists Instagram;
use instagram;

CREATE TABLE User (
   user_id  int Primary Key,
   username   varchar(30) unique not null ,
   first_name   varchar(15),
   last_name   varchar(15),
   DOB  date,
   password   varchar(30) not null,
   email   varchar(30) unique not null,
   phone   varchar(15) unique,
   gender   varchar(10),
   account_type   varchar(15) default 'Personal'
);


CREATE TABLE Post (
   post_id INT PRIMARY KEY,
   post_file_name VARCHAR(255) CHECK (post_file_name REGEXP '^.+\.(png|jpg|mp4)$'),
   post_caption VARCHAR(255),
   upload_date DATE not null,
   user_id INT,
  constraint User_id_FK FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Messeges (
  messege_id INT PRIMARY KEY,
  messege_content VARCHAR(255) not null,
  messege_date DATE,
  sender_user_id INT,
  reciever_user_id INT,
  FOREIGN KEY (sender_user_id) REFERENCES User(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (reciever_user_id) REFERENCES User(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Followers (
  Follower_id INT PRIMARY KEY,
  user_id INT,
  FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Stories (
   Story_id INT PRIMARY KEY,
   story_file_name VARCHAR(255) CHECK (story_file_name REGEXP '^.+\.(png|jpg|mp4)$'),
   story_text VARCHAR(255),
   update_date DATE,
   user_id INT,
  constraint Story_User_id_FK FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Comments (
  comments_id INT PRIMARY KEY,
  comments_text VARCHAR(255) not null,
  comments_date DATE not null,
  post_id INT,
  story_id INT,
  FOREIGN KEY (post_id) REFERENCES Post(post_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (story_id) REFERENCES Stories(story_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Likes (
  Like_id INT PRIMARY KEY,
  post_id INT,
  story_id INT,
  FOREIGN KEY (post_id) REFERENCES Post(post_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (story_id) REFERENCES Stories(story_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Notification (
  notification_id INT PRIMARY KEY,
  notification_type VARCHAR(255) not null,
  notification_content VARCHAR(255) not null,
  notification_date DATE not null,
  comment_id INT,
  Like_id INT,
  FOREIGN KEY (comment_id) REFERENCES Comments(comments_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (Like_id) REFERENCES Likes(Like_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Tags (
  Tag_id INT PRIMARY KEY,
  Tag_name VARCHAR(255) not null,
  tag_date DATE not null
);

CREATE TABLE Post_tags (
  Post_tag_id INT PRIMARY KEY,
  Post_id INT,
  tag_id INT,
  FOREIGN KEY (Post_id) REFERENCES Post(post_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (tag_id) REFERENCES Tags(Tag_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Hashtags (
  Hashtag_id INT PRIMARY KEY,
  Hashtag_name VARCHAR(255) not null,
  post_tag_id INT,
  FOREIGN KEY (post_tag_id) REFERENCES Post_tags (Post_tag_id) ON DELETE CASCADE ON UPDATE CASCADE
);



-- Inserting sample records into User table
INSERT INTO User (user_id, username, first_name, last_name, DOB, password, email, phone, gender, account_type)
VALUES
(1, 'user_1', 'Alice', 'Smith', '1990-05-15', 'password1', 'alice.smith@example.com', '1234567890', 'Female', 'Regular'),
(2, 'user_2', 'Bob', 'Johnson', '1988-09-20', 'password2', 'bob.johnson@example.com', '9876543210', 'Male', 'Regular'),
(3, 'user_3', 'Carol', 'Williams', '1995-03-10', 'password3', 'carol.williams@example.com', '4567890123', 'Female', 'Premium'),
(4, 'user_4', 'David', 'Brown', '1992-11-28', 'password4', 'david.brown@example.com', '7890123456', 'Male', 'Regular'),
(5, 'user_5', 'Eva', 'Jones', '1987-07-03', 'password5', 'eva.jones@example.com', '2345678901', 'Female', 'Regular'),
(6, 'user_6', 'Frank', 'Davis', '1993-01-22', 'password6', 'frank.davis@example.com', '8901234567', 'Male', 'Premium'),
(7, 'user_7', 'Grace', 'Miller', '1985-12-18', 'password7', 'grace.miller@example.com', '3456789012', 'Female', 'Regular'),
(8, 'user_8', 'Henry', 'Wilson', '1991-08-07', 'password8', 'henry.wilson@example.com', '9012345678', 'Male', 'Regular'),
(9, 'user_9', 'Ivy', 'Moore', '1989-04-25', 'password9', 'ivy.moore@example.com', '5678901234', 'Female', 'Regular'),
(10, 'user_10', 'Kevin', 'Taylor', '1994-06-30', 'password10', 'kevin.taylor@example.com', '0123456789', 'Male', 'Premium');

-- Inserting sample records into Post table
INSERT INTO Post (post_id, post_file_name, post_caption, upload_date, user_id)
VALUES 
  (1, 'image1.jpg', 'Beautiful sunset', '2024-05-13', 1),
  (2, 'image2.png', 'Amazing view', '2024-05-13', 2),
  (3, 'video1.mp4', 'Fun times', '2024-05-14', 3),
  (4, 'image3.jpg', 'Lovely day', '2024-05-14', 1),
  (5, 'image4.png', 'Cute puppy', '2024-05-15', 2),
  (6, 'video2.mp4', 'Adventure time', '2024-05-15', 3),
  (7, 'image5.jpg', 'City lights', '2024-05-16', 1),
  (8, 'image6.png', 'Nature\'s beauty', '2024-05-16', 2),
  (9, 'video3.mp4', 'Making memories', '2024-05-17', 3),
  (10, 'image7.jpg', 'Sunny day', '2024-05-17', 1);


-- Inserting sample records into Messeges table
INSERT INTO Messeges (messege_id, messege_content, messege_date, sender_user_id, reciever_user_id)
VALUES
(1, 'Sample message content 1', '2024-04-01', 1, 2),
(2, 'Sample message content 2', '2024-04-02', 2, 1),
(3, 'Sample message content 3', '2024-04-03', 3, 1),
(4, 'Sample message content 4', '2024-04-04', 1, 3),
(5, 'Sample message content 5', '2024-04-05', 4, 1),
(6, 'Sample message content 6', '2024-04-06', 1, 4),
(7, 'Sample message content 7', '2024-04-07', 5, 1),
(8, 'Sample message content 8', '2024-04-08', 1, 5),
(9, 'Sample message content 9', '2024-04-09', 6, 1),
(10, 'Sample message content 10', '2024-04-10', 1, 6);

-- Inserting sample records into Followers table
INSERT INTO Followers (Follower_id, user_id)
VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 1);

-- Inserting sample records into Stories table
INSERT INTO Stories (Story_id, story_file_name, story_text, update_date, user_id)
VALUES 
  (1, 'story1.jpg', 'Morning vibes', '2024-05-13', 1),
  (2, 'story2.png', 'Coffee time', '2024-05-13', 2),
  (3, 'video_story1.mp4', 'Weekend adventures', '2024-05-14', 3),
  (4, 'story3.jpg', 'Lunch break', '2024-05-14', 1),
  (5, 'story4.png', 'Office views', '2024-05-15', 2),
  (6, 'video_story2.mp4', 'Friday night out', '2024-05-15', 3),
  (7, 'story5.jpg', 'Evening stroll', '2024-05-16', 1),
  (8, 'story6.png', 'Home sweet home', '2024-05-16', 2),
  (9, 'video_story3.mp4', 'Road trip memories', '2024-05-17', 3),
  (10, 'story7.jpg', 'Night sky', '2024-05-17', 1);

-- Inserting sample records into Comments table
INSERT INTO Comments (comments_id, comments_text, comments_date, post_id, story_id)
VALUES
(1, 'Sample comment 1', '2024-04-01', 1, NULL),
(2, 'Sample comment 2', '2024-04-02', 2, NULL),
(3, 'Sample comment 3', '2024-04-03', 3, NULL),
(4, 'Sample comment 4', '2024-04-04', 

4, NULL),
(5, 'Sample comment 5', '2024-04-05', 5, NULL),
(6, 'Sample comment 6', '2024-04-06', 6, NULL),
(7, 'Sample comment 7', '2024-04-07', NULL, 1),
(8, 'Sample comment 8', '2024-04-08', NULL, 2),
(9, 'Sample comment 9', '2024-04-09', NULL, 3),
(10, 'Sample comment 10', '2024-04-10', NULL, 4);

-- Inserting sample records into Likes table
INSERT INTO Likes (Like_id, post_id, story_id)
VALUES
(1, 1, NULL),
(2, 2, NULL),
(3, 3, NULL),
(4, 4, NULL),
(5, 5, NULL),
(6, NULL, 1),
(7, NULL, 2),
(8, NULL, 3),
(9, NULL, 4),
(10, NULL, 5);

-- Inserting sample records into Notification table
INSERT INTO Notification (notification_id, notification_type, notification_content, notification_date, comment_id, Like_id)
VALUES
(1, 'Comment', 'New comment notification 1', '2024-04-01', 1, NULL),
(2, 'Like', 'New like notification 1', '2024-04-02', NULL, 1),
(3, 'Comment', 'New comment notification 2', '2024-04-03', 2, NULL),
(4, 'Like', 'New like notification 2', '2024-04-04', NULL, 2),
(5, 'Comment', 'New comment notification 3', '2024-04-05', 3, NULL),
(6, 'Like', 'New like notification 3', '2024-04-06', NULL, 3),
(7, 'Comment', 'New comment notification 4', '2024-04-07', 4, NULL),
(8, 'Like', 'New like notification 4', '2024-04-08', NULL, 4),
(9, 'Comment', 'New comment notification 5', '2024-04-09', 5, NULL),
(10, 'Like', 'New like notification 5', '2024-04-10', NULL, 5);

-- Inserting sample records into Tags table
INSERT INTO Tags (Tag_id, Tag_name, tag_date)
VALUES
(1, 'SampleTag1', '2024-04-01'),
(2, 'SampleTag2', '2024-04-02'),
(3, 'SampleTag3', '2024-04-03'),
(4, 'SampleTag4', '2024-04-04'),
(5, 'SampleTag5', '2024-04-05'),
(6, 'SampleTag6', '2024-04-06'),
(7, 'SampleTag7', '2024-04-07'),
(8, 'SampleTag8', '2024-04-08'),
(9, 'SampleTag9', '2024-04-09'),
(10, 'SampleTag10', '2024-04-10');

-- Inserting sample records into Post_tags table
INSERT INTO Post_tags (Post_tag_id, Post_id, tag_id)
VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);

-- Inserting sample records into Hashtags table
INSERT INTO Hashtags (Hashtag_id, Hashtag_name, post_tag_id)
VALUES
(1, 'SampleHashtag1', 1),
(2, 'SampleHashtag2', 2),
(3, 'SampleHashtag3', 3),
(4, 'SampleHashtag4', 4),
(5, 'SampleHashtag5', 5),
(6, 'SampleHashtag6', 6),
(7, 'SampleHashtag7', 7),
(8, 'SampleHashtag8', 8),
(9, 'SampleHashtag9', 9),
(10, 'SampleHashtag10', 10);





drop database instagram;














