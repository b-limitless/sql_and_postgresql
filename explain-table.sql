EXPLAIN SELECT * FROM 
likes 
WHERE created_at < '2013-01-01'

/*
If postgres using 
√
Bitmap Heap Scan on likes  (cost=1185.41..6764.10 rows=63095 width=24)
then its okay to have index 
*/
-- CREATE INDEX likes_created_at_idx ON likes(created_at)

EXPLAIN SELECT * FROM 
likes 
WHERE created_at > '2013-01-01'

/*
Above query creating really almost 70% of comments in the comments database 
Thats why its using 
Seq Scan on likes  (cost=0.00..14190.11 rows=688913 width=24)
therefore it is good idea to remove the index 

*/


-- CREATE INDEX likes_created_at_idx ON likes(created_at)