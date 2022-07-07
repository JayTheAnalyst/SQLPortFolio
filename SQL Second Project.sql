SELECT * 
From SecondPort..imdb_top_1000$

/* In this query I will utilized data manipulation wherein I will update some cells that is null. 
I will use the google for updating the rows such as their Certification, Meta Score and Gross*/

Select Series_Title, 
	   Released_Year, 
	   Certification, 
	   Meta_Score, 
	   Gross

From SecondPort..imdb_top_1000$
WHERE Certification is NULL
ORDER BY Released_Year DESC

UPDATE SecondPort..imdb_top_1000$
SET Certification = 'A', Gross = 21714737
WHERE Series_Title = 'Druk'

UPDATE SecondPort..imdb_top_1000$
SET Certification = 'A', Meta_score = 0 , Gross = 21107423
WHERE Series_Title = 'Ayla: The Daughter of War'

UPDATE SecondPort..imdb_top_1000$
SET Certification = 'PG-13'
WHERE Series_Title = 'Gods Own Country'

UPDATE SecondPort..imdb_top_1000$
SET Series_Title = 'Gods Own Country'
WHERE Series_Title LIKE '%Own Country%'

UPDATE SecondPort..imdb_top_1000$
SET Certification = 'Passed', Meta_score ='0', Gross = '0'
WHERE Series_Title = 'Perfetti sconosciuti'

UPDATE SecondPort..imdb_top_1000$
SET Certification = 'PG-13'
WHERE Series_Title = 'Beasts of No Nation'

UPDATE SecondPort..imdb_top_1000$
SET Certification = 'A' , Gross = 6725591
WHERE Series_Title = 'Victoria'

UPDATE SecondPort..imdb_top_1000$
SET Certification = 'U'
WHERE Series_Title = 'Kis Uykusu'

UPDATE SecondPort..imdb_top_1000$
SET Certification = 'PG-13'
WHERE Series_Title = 'Mandariinid'

UPDATE SecondPort..imdb_top_1000$
SET Certification = 'U'
WHERE Series_Title = 'La grande bellezza'

UPDATE SecondPort..imdb_top_1000$
SET Certification = 'U'
WHERE Series_Title = 'The Broken Circle Breakdown'

UPDATE SecondPort..imdb_top_1000$
SET Certification = 'Passed', Meta_score = 0, Gross = 0
WHERE Series_Title = 'El cuerpo'

UPDATE SecondPort..imdb_top_1000$
SET Certification = 'U'
WHERE Series_Title = 'Detachment'

UPDATE SecondPort..imdb_top_1000$
SET Certification = 'U'
WHERE Series_Title = 'Bir Zamanlar Anadolu da'

UPDATE SecondPort..imdb_top_1000$
SET Series_Title = 'Bir Zamanlar Anadolu da'
WHERE Series_Title LIKE '%Bir Zamanlar%'

UPDATE SecondPort..imdb_top_1000$
SET Series_Title = 'Tropa de Elite 2 - O Inimigo Agora È Outro', Certification = 'A'
WHERE Series_Title LIKE '%Tropa de Elite 2%'

UPDATE SecondPort..imdb_top_1000$
SET Certification = 'N/A', Meta_score = 0, Gross = 0
WHERE Series_Title = 'Kokuhaku'

UPDATE SecondPort..imdb_top_1000$
SET Certification = 'PG-13'
WHERE Series_Title = 'Ang-ma-reul bo-at-da'

UPDATE SecondPort..imdb_top_1000$
SET Certification = 'U' , Meta_score = 92 , Gross = 1740429
WHERE Series_Title = 'Mary and Max'

UPDATE SecondPort..imdb_top_1000$
SET Certification = 'PASSED', Meta_score = 79 , Gross = 15291338
WHERE Series_Title = 'Nefes: Vatan Sagolsun'

UPDATE SecondPort..imdb_top_1000$
SET Certification = 'A' , Meta_score = 88, Gross = 19305314
WHERE Series_Title = 'Celda 211'

UPDATE SecondPort..imdb_top_1000$
SET Certification = 'U'
WHERE Series_Title = 'The Secret of Kells'

UPDATE SecondPort..imdb_top_1000$
SET Certification = 'PG-13', Meta_score = 0, Gross = 32350637
WHERE Series_Title = 'Die Welle'

UPDATE SecondPort..imdb_top_1000$
SET Certification = 'PG-13', Gross = 36495748
WHERE Series_Title = 'Chugyeokja'

UPDATE SecondPort..imdb_top_1000$
SET Certification = 'U'
WHERE Series_Title = 'Auf der anderen Seite'

UPDATE SecondPort..imdb_top_1000$
SET Series_Title = '4 Months, 3 weeks, and 2 days'
WHERE Series_Title = '4 luni, 3 saptam√¢ni si 2 zile'

UPDATE SecondPort..imdb_top_1000$
SET Certification = 'U'
WHERE Series_Title = '4 Months, 3 weeks, and 2 days'

UPDATE SecondPort..imdb_top_1000$
SET Certification = 'A', Meta_score = 85, Gross = 0
WHERE Series_Title = 'The Man from Earth'

UPDATE SecondPort..imdb_top_1000$
SET Series_Title = 'Death Note: The Last Name'
WHERE Series_Title LIKE '%Death Note:%'

UPDATE SecondPort..imdb_top_1000$ 
SET Certification = 'PG-13', Meta_score = 0, Gross = 47919757
WHERE Series_Title = 'Death Note: The Last Name'

UPDATE SecondPort..imdb_top_1000$
SET Certification = 'U'
WHERE Series_Title = 'This Is England'

UPDATE SecondPort..imdb_top_1000$
SET Certification = 'U', Gross = 3710169
WHERE Series_Title = 'C.R.A.Z.Y.'

UPDATE SecondPort..imdb_top_1000$
SET Certification = 'U', Meta_score = 97, Gross =18612999
WHERE Series_Title = 'Babam ve Oglum'

/* Some of the data isn't in the google database and IMDB Database hence it will 
leave as it is*/
---------------------------------------------------------
/* Lets Select the TOP 20 Movie of All Time*/

SELECT TOP 20 Series_Title, 
	   Director, 
	   Genre, 
	   IMDB_Rating,
	   Gross,
	   Released_Year

From SecondPort..imdb_top_1000$
WHERE GROSS <= (select MAX(gross) from SecondPort..imdb_top_1000$) 
Order By Gross DESC

/* We see that Star Wars: Episode VII - The Force Awakens has 
the highest Gross of All-Time moreover we want to know if what 
movie came close to starwars in that Year*/

Select Series_Title, 
	   Genre, Released_Year, 
	   IMDB_Rating,
	   Gross
From SecondPort..imdb_top_1000$
WHERE Released_Year = 2015 and Gross <= (select max(gross) from SecondPort..imdb_top_1000$)
ORDER BY Gross DESC

/* We will filter top 10 in every genre per decade that is existing in this 
database*/

SELECT TOP 10 
	   Series_Title, 
	   Released_Year,
	   Genre,
	   Certification, 
	   Meta_Score, 
	   Gross

From SecondPort..imdb_top_1000$
WHERE Genre LIKE '%DRAMA%' AND Released_Year BETWEEN 1990 AND 2000
ORDER BY Gross DESC
-------------------------------------
SELECT TOP 10 
	   Series_Title, 
	   Released_Year,
	   Genre,
	   Certification, 
	   Meta_Score, 
	   Gross

From SecondPort..imdb_top_1000$
WHERE Genre LIKE '%DRAMA%' AND Released_Year BETWEEN 2001 AND 2010
ORDER BY Gross DESC
--------------------------------------
SELECT TOP 10 
	   Series_Title, 
	   Released_Year,
	   Genre,
	   Certification, 
	   Meta_Score, 
	   Gross

From SecondPort..imdb_top_1000$
WHERE Genre LIKE '%DRAMA%' AND Released_Year BETWEEN 2011 AND 2020
ORDER BY Gross DESC
--------------------------------------
SELECT TOP 10 
	   Series_Title, 
	   Released_Year,
	   Genre,
	   Certification, 
	   Meta_Score, 
	   Gross

From SecondPort..imdb_top_1000$
WHERE Genre LIKE '%COMEDY%' AND Released_Year BETWEEN 1990 AND 2000
ORDER BY Gross DESC
--------------------------------------
SELECT TOP 10 
	   Series_Title, 
	   Released_Year,
	   Genre,
	   Certification, 
	   Meta_Score, 
	   Gross

From SecondPort..imdb_top_1000$
WHERE Genre LIKE '%COMEDY%' AND Released_Year BETWEEN 2001 AND 2010
ORDER BY Gross DESC
--------------------------------------
SELECT TOP 10 
	   Series_Title, 
	   Released_Year,
	   Genre,
	   Certification, 
	   Meta_Score, 
	   Gross

From SecondPort..imdb_top_1000$
WHERE Genre LIKE '%COMEDY%' AND Released_Year BETWEEN 2011 AND 2020
ORDER BY Gross DESC
--------------------------------------
SELECT TOP 10 
	   Series_Title, 
	   Released_Year,
	   Genre,
	   Certification, 
	   Meta_Score, 
	   Gross

From SecondPort..imdb_top_1000$
WHERE Genre LIKE '%THRILLER%' AND Released_Year BETWEEN 1990 AND 2000
ORDER BY Gross DESC
--------------------------------------
SELECT TOP 10 
	   Series_Title, 
	   Released_Year,
	   Genre,
	   Certification, 
	   Meta_Score, 
	   Gross

From SecondPort..imdb_top_1000$
WHERE Genre LIKE '%THRILLER%' AND Released_Year BETWEEN 2001 AND 2010
ORDER BY Gross DESC
--------------------------------------
SELECT TOP 10 
	   Series_Title, 
	   Released_Year,
	   Genre,
	   Certification, 
	   Meta_Score, 
	   Gross

From SecondPort..imdb_top_1000$
WHERE Genre LIKE '%THRILLER%' AND Released_Year BETWEEN 2011 AND 2020
ORDER BY Gross DESC
--------------------------------------
SELECT TOP 10 
	   Series_Title, 
	   Released_Year,
	   Genre,
	   Certification, 
	   Meta_Score, 
	   Gross

From SecondPort..imdb_top_1000$
WHERE Genre LIKE '%ROMANCE%' AND Released_Year BETWEEN 1990 AND 2000
ORDER BY Gross DESC
--------------------------------------
SELECT TOP 10 
	   Series_Title, 
	   Released_Year,
	   Genre,
	   Certification, 
	   Meta_Score, 
	   Gross

From SecondPort..imdb_top_1000$
WHERE Genre LIKE '%ROMANCE%' AND Released_Year BETWEEN 2001 AND 2010
ORDER BY Gross DESC
--------------------------------------
SELECT TOP 10 
	   Series_Title, 
	   Released_Year,
	   Genre,
	   Certification, 
	   Meta_Score, 
	   Gross

From SecondPort..imdb_top_1000$
WHERE Genre LIKE '%ROMANCE%' AND Released_Year BETWEEN 2011 AND 2020
ORDER BY Gross DESC
--------------------------------------

/* Next we will filter out the top 10 movie in every decade*/

SELECT TOP 10 
	   Series_Title, 
	   Released_Year,
	   Genre,
	   Certification, 
	   Meta_Score, 
	   Gross

From SecondPort..imdb_top_1000$
WHERE Released_Year BETWEEN 1900 AND 2000
ORDER BY Gross DESC
--------------------------------------
SELECT TOP 10 
	   Series_Title, 
	   Released_Year,
	   Genre,
	   Certification, 
	   Meta_Score, 
	   Gross

From SecondPort..imdb_top_1000$
WHERE Released_Year BETWEEN 2001 AND 2010
ORDER BY Gross DESC
--------------------------------------
SELECT TOP 10
	   Series_Title, 
	   Released_Year,
	   Genre,
	   Certification, 
	   Meta_Score, 
	   Gross

From SecondPort..imdb_top_1000$
WHERE Released_Year BETWEEN 2011 AND 2020
ORDER BY Gross DESC
--------------------------------------
/* Here we select Top 10 Director of All Time which we will scale by the sum of overall Gross
to know who directed the masterpiece 
and we will look at how frequent those director produces a quality movie*/

SELECT TOP 10 Director,
	   COUNT(Series_Title) as 'Numbers of Directed Movie', SUM(Gross) as 'Average Overall Gross'
	  
From SecondPort..imdb_top_1000$
GROUP BY Director
ORDER BY 'Average Overall Gross' DESC
--------------------------------------
/* Now we will determine Best Director per Decade based on their gross*/

SELECT TOP 10 Director, 
	   COUNT(Series_Title) as 'Numbers of Directed Movie', SUM(Gross) as 'Average Overall Gross', Released_Year
	  
From SecondPort..imdb_top_1000$
GROUP BY Director, Released_Year
HAVING Released_Year BETWEEN 1990 AND 2000
ORDER BY 'Average Overall Gross' DESC
--------------------------------------
SELECT TOP 10 Director, 
	   COUNT(Series_Title) as 'Numbers of Directed Movie', SUM(Gross) as 'Average Overall Gross', Released_Year
	  
From SecondPort..imdb_top_1000$
GROUP BY Director, Released_Year
HAVING Released_Year BETWEEN 2001 AND 2010
ORDER BY 'Average Overall Gross' DESC
--------------------------------------
SELECT TOP 10 Director,
	   COUNT(Series_Title) as 'Numbers of Directed Movie', SUM(Gross) as 'Average Overall Gross', Released_Year
	  
From SecondPort..imdb_top_1000$
GROUP BY Director, Released_Year
HAVING Released_Year BETWEEN 2011 AND 2020
ORDER BY 'Average Overall Gross' DESC


 