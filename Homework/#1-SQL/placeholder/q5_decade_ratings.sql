SELECT 
(premiered - premiered % 10) || 's' AS decade,
ROUND(AVG(rating), 2) AS avg_rating,
MAX(rating) AS top_rating,
MIN(rating) AS min_rating,
COUNT(*) AS num_releases
FROM titles
JOIN ratings
ON ratings.title_id = titles.title_id
WHERE premiered IS NOT NULL
GROUP BY decade
ORDER BY
avg_rating DESC, decade ASC;