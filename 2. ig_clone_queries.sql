-- Finding the 5 oldest users
SELECT *
FROM users
ORDER BY created_at
LIMIT 5;

-- What day of the week do most users register on?
SELECT 
	   DAYNAME(created_at) AS day,
       COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC
LIMIT 2;
-- Most users usually open a account on Thursdays or on Sundays. Therefore, strategic marketing should be targeted on those days.

-- The users who have never posted a video.
SELECT users.username, photos.image_url
FROM users
LEFT JOIN photos
	ON users.id = photos.user_id
WHERE photos.id IS NULL;
-- We have 26 users that have never posted a single photo since creating their account.

-- Who posted the most liked photo?
SELECT photo_id, COUNT(*) as no_of_likes
FROM likes
GROUP BY photo_id
ORDER BY no_of_likes DESC;

SELECT photos.id, users.username
FROM photos
JOIN users
	ON photos.user_id = users.id
WHERE photos.id = 145;
-- OR
SELECT 
    username,
    photos.id,
    photos.image_url, 
    COUNT(*) AS total
FROM photos
INNER JOIN likes
    ON likes.photo_id = photos.id
INNER JOIN users
    ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;
-- Zack_Kemmer93 posted the most liked photo with 48 likes.

-- THE TOP 5 MOST COMMONLY USED HASHTAGS
SELECT 
    photo_tags.tag_id,
    tags.tag_name,
	COUNT(*) AS total
FROM tags
JOIN photo_tags
	ON tags.id = photo_tags.tag_id
GROUP BY photo_tags.tag_id
ORDER BY total DESC
LIMIT 5;
-- The most common hashtag is 'smile' followed by 'beach'. It seems that the users relate well with happy emotions.