SELECT * FROM users ORDER BY ID DESC LIMIT 3

select users.username, users.id, caption from users join posts on users.id = posts.user_id where users.id = 200;

SELECT count(*), username
from users 
JOIN likes on users.id = likes.user_id
group by username


SHOW data_directory;

/* Find the id of your database */
SELECT oid, datname
FROM pg_database;