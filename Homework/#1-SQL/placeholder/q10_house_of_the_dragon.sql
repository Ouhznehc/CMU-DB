WITH dubbed_movies AS (
  SELECT DISTINCT akas.title as title
  FROM titles
  JOIN akas
  ON titles.title_id = akas.title_id
  WHERE titles.primary_title = 'House of the Dragon' AND titles.type = 'tvSeries'
  ORDER BY akas.title
),
seq_dubbed AS (
      SELECT ROW_NUMBER() OVER (ORDER BY dubbed_movies.title) AS seq, dubbed_movies.title as title
      FROM dubbed_movies
),
recursive_dubbed AS (
  SELECT seq_dubbed.seq, seq_dubbed.title
  FROM seq_dubbed
  WHERE seq_dubbed.seq = 1

  UNION

  SELECT seq_dubbed.seq, recursive_dubbed.title || ', ' || seq_dubbed.title
  FROM seq_dubbed
  JOIN recursive_dubbed
  ON recursive_dubbed.seq = seq_dubbed.seq - 1 

)

SELECT title 
FROM recursive_dubbed
ORDER BY seq DESC 
LIMIT 1;
