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
