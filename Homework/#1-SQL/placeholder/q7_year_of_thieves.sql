WITH year_of_thieves AS(
  SELECT premiered
  FROM titles
  WHERE titles.primary_title = 'Army of Thieves'
)
SELECT COUNT(*)
FROM titles
JOIN year_of_thieves
ON titles.premiered = year_of_thieves.premiered;
