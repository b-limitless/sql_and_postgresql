# Null will be available 
select url,username FROM photos
LEFT JOIN users on users.id = photos.user_id;

select url,username FROM photos
right JOIN users on users.id = photos.user_id;


select title, name from authors left join books on authors.id = books.author_id


select url, contents 
FROM comments
JOIN photos ON photos.id = comments.photo_id
WHERE comments.user_id = photos.user_id;

select url, contents, username
FROM comments
JOIN photos on photos.user_id = comments.photo_id
JOIN users on users.id = comments.user_id AND users.id = photos.user_id;

select name, title, rating 
from reviews
join books on books.id = reviews.book_id
join  authors on authors.id = books.author_id AND authors.id = reviews.reviewer_id;

select user_id, count(id) as num FROM comments 
group BY user_id\

select photo_id, count(*) FROM COMMENTS group BY photo_id;

---Write a query that will print an authors  and the number of books they have authored
select name, count(*) FROM 
authors JOIN books on authors.id = books.author_id
group BY name;

select 
from books 
JOIN authors ON authors.id = books.author_id
group by authors.name;

-- Having 
select photo_id, count(*) from comments
where photo_id < 3
group by photo_id
having count(photo_id) > 2

--
select manufacturer, sum(price * units_sold)
from phones 
group by manufacturer 
having sum(price * units_sold) > 2000000


CREATE INDEX on users(username);
DROP INDEX users_username_idx;

EXPLAIN ANALYZE 
SELECT * FROM users WHERE username = 'Emil30'

-- Find the size of users table in the hard disk 
SELECT pg_size_pretty(pg_relation_size('users'));
-- Find for the index username 
SELECT pg_size_pretty(pg_relation_size('users_username_idx'));

-- There is different type of index exits 
/*
    B-Tree => General purpose index 
    Hash => Speeds up simple equity checks 
    GisT => Geometry, full text search
    SP-GisT => Cluster Data, such as date 
    GIN
    BRIN
*/
-- List indexs from the tables in databse 
SELECT relname, relkind FROM pg_class WHERE relkind = 'i';


-- CREATE INDEX on users(username);
-- DROP INDEX users_username_idx1;

-- WITH IDEX 0.05
-- EXPLAIN ANALYZE 
-- SELECT * FROM users WHERE username = 'Emil30'

--SELECT relname, relkind FROM pg_class WHERE relkind = 'i';


--select * FROM bt_metap('users_username_idx');
--select * FROM bt_page_items('users_username_idx', 4);

-- select oid, datname from pg_database;
-- 16386
-- SHOW data_directory;
--/Users/limitless/Library/Application Support/Postgres/var-13

select * from pg_class WHERE relkind = 'i';
-- users_usersname_idex relfilenode = "16590"

--
SELECT username, tags.created_at
FROM users 
JOIN (
	SELECT user_id, created_at from caption_tags
	UNION ALL
	SELECT user_id, created_at from photo_tags
) as tags ON tags.user_id = users.id
WHERE tags.created_at < '2010-01-07'

-- Below query is options for above query
SELECT username, tags.created_at
FROM users 
JOIN (
	SELECT user_id, created_at from caption_tags
	UNION ALL
	SELECT user_id, created_at from photo_tags
) as tags ON tags.user_id = users.id
WHERE tags.created_at < '2010-01-07'

-- Important Notes on Recursive CTE's
WITH RECURSIVE countdown(val) as (
SELECT 3 AS val -- initial, Non recursive query 
UNION 
SELECT val - 1 FROM countdown WHERE val > 1 -- Recursive query 
)
SELECT * 
FROM countdown;