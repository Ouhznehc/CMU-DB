WITH people_with_moive AS(
  SELECT name, ROUND(AVG(rating), 2) AS avg_rate
  FROM people
  JOIN crew
  ON people.person_id = crew.person_id
  JOIN titles
  ON crew.title_id = titles.title_id
  JOIN ratings
  ON ratings.title_id = titles.title_id
  WHERE born = 1955 AND type = 'movie'
  GROUP BY name
)
SELECT name, avg_rate
FROM(
  SELECT *, NTILE(10) OVER (ORDER BY avg_rate ASC) AS quantile FROM people_with_moive
)
WHERE quantile = 9
ORDER BY avg_rate DESC, name ASC;