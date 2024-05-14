# Instagram-DBMS-Project
This project involves designing and implementing a database schema for an Instagram-like social media platform. The schema includes tables for users, posts, messages, followers, stories, comments, likes, notifications, tags, and their relationships. The database is implemented using SQL (Structured Query Language).

**Database Schema**

The database schema consists of the following tables:

1. User: Stores information about users including their username, name, date of birth, contact details, gender, and account type.

2. Post: Stores information about posts including the post type (image or video), content, upload date, and the user who uploaded the post.

3. Messages: Stores information about messages exchanged between users including the message content, date, sender, and receiver.

4. Followers: Stores information about followers, mapping users to their followers.

5. Stories: Stores information about stories uploaded by users including the story type (image or video), content, and upload date.

6. Comments: Stores information about comments made on posts including the comment text, date, and the post it belongs to.

7. Likes: Stores information about likes made on posts or stories.

8. Notification: Stores information about notifications including the notification type, content, date, and related comment or like.

9. Tags: Stores information about tags associated with posts.

10. Post_tags: Maps posts to their associated tags.

11. Hashtags: Stores information about hashtags associated with posts.



**Constraints**

- The post_type column in the Post table is constrained to accept only values 'Image' or 'Video'.
- Foreign key constraints are applied to ensure data integrity, such as the user_id foreign key in the Post table referencing the user_id primary key in the User table.

Test Cases

1. Retrieve all users who have a premium account type.
2. Retrieve all posts uploaded by a specific user.
3. Retrieve all messages sent by a specific user.
4. Retrieve all followers of a specific user.
5. Retrieve all stories uploaded after a certain date.
6. Retrieve all comments made on a specific post.
7. Retrieve all likes on a specific story.
8. Retrieve all notifications of type 'Like' after a certain date.
9. Retrieve all tags associated with a specific post.
10. Retrieve all posts associated with a specific hashtag.
11. Retrieve all users who have not uploaded any posts.
12. Retrieve all posts uploaded on a specific date.
13. Retrieve all messages exchanged between two specific users.
14. Retrieve all followers of users who have a premium account type.
15. Retrieve all stories uploaded by users with a regular account type.
16. Retrieve all posts associated with a specific tag.
17. Retrieve all messages sent on a specific date.
18. Retrieve all followers of users who have uploaded a video post.
19. Retrieve all stories uploaded by users on or before a specific date.
20. Retrieve all comments made by users with a specific gender.

**Usage**

To use this database schema, you can create the tables using the provided SQL scripts and then execute SQL queries to interact with the database.
