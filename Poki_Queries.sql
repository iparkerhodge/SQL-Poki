-- #1
--SELECT * FROM Grade;

-- #2
--SELECT * FROM Emotion;

--#3
--SELECT COUNT(Id) FROM Poem;

--#4
--SELECT TOP 76 Author.Name FROM Author author 
--ORDER BY author.Name

--#5
--SELECT TOP 76 Author.Name,
--    grade.Name
--FROM Author author 
--JOIN Grade grade ON Author.GradeId = grade.Id
--ORDER BY author.Name

--#6
--SELECT TOP 76 Author.Name,
--    grade.Name,
--    gender.Name
--FROM Author author 
--JOIN Grade grade ON Author.GradeId = grade.Id
--JOIN Gender gender ON Author.GenderId = gender.Id
--ORDER BY author.Name

--#7
--SELECT SUM(WordCount) FROM Poem

--#8
--SELECT poem.Title, poem.CharCount FROM Poem poem
--WHERE poem.CharCount = (
--    SELECT MIN(CharCount) FROM Poem
--)

--#9
--SELECT COUNT(author.Id) AS 'Total Authors in 3rd Grade'
--FROM Author author 
--JOIN Grade grade ON Author.GradeId = grade.Id
--WHERE grade.Name = '3rd Grade'

--#10
--SELECT COUNT(author.Id) AS 'Total Authors in 1st, 2nd, 3rd Grade'
--FROM Author author 
--JOIN Grade grade ON Author.GradeId = grade.Id
--WHERE grade.Name = '3rd Grade' OR grade.Name = '2nd Grade' OR grade.Name = '1st Grade'

--#11
--SELECT COUNT(poem.id) FROM Poem poem
--JOIN Author author ON poem.AuthorId = author.Id
--JOIN Grade grade ON author.GradeId = grade.Id
--WHERE grade.Name = '4th Grade'

--#12
--SELECT COUNT(poem.Id) AS '# of poems', grade.Name AS 'Grade' FROM Poem poem
--JOIN Author author ON poem.AuthorId = author.Id
--JOIN Grade grade ON author.GradeId = grade.Id
--GROUP BY (grade.Name)

--#13
--SELECT COUNT(author.Id) AS '# of authors', 
--    grade.Name AS 'Grade' 
--    FROM Author author 
--JOIN Grade grade ON author.GradeId = grade.Id
--GROUP BY (grade.Name)

--#14
--SELECT poem.Title, poem.WordCount FROM Poem poem
--WHERE poem.WordCount = (
--    SElECT MAX(WordCount) FROM Poem
--)

--#15
--SELECT TOP 1 author.Id, author.Name, COUNT(Poem.Id) AS '# of poems' FROM Author author 
--JOIN Poem poem ON poem.AuthorId = author.Id
--GROUP BY author.Id, author.Name
--ORDER BY COUNT(Poem.Id) DESC

--#16
--SELECT COUNT(Poem.Id) AS '# of Sadness Poems' FROM Poem poem
--JOIN PoemEmotion poemEmotion ON poemEmotion.PoemId = poem.Id
--JOIN Emotion emotion ON poemEmotion.EmotionId = emotion.Id
--WHERE emotion.Name = 'Sadness'

--#17
--SELECT COUNT(poem.Id) FROM Poem poem
--LEFT JOIN PoemEmotion poemEmotion ON poemEmotion.PoemId = poem.Id
--LEFT JOIN Emotion emotion ON poemEmotion.EmotionId = emotion.Id
--WHERE emotion.Name IS NULL

--#18
--SELECT TOP 1 emotion.Name, COUNT(poem.Id) FROM Emotion emotion
--JOIN PoemEmotion poemEmotion ON poemEmotion.EmotionId = emotion.Id
--JOIN Poem poem ON poemEmotion.PoemId = Poem.Id
--GROUP BY emotion.Name
--ORDER BY COUNT(poem.Id)

--#19
--SELECT TOP 1 grade.Name, COUNT(poem.Id) AS '# of poems assc. w/ joy' FROM Grade grade
--JOIN Author author ON author.GradeId = grade.Id
--JOIN Poem poem ON poem.AuthorId = author.Id
--JOIN PoemEmotion pe ON pe.PoemId = poem.Id
--JOIN Emotion emotion ON pe.EmotionId = emotion.Id
--GROUP BY grade.Name, emotion.Name
--HAVING emotion.Name = 'Joy'
--ORDER BY COUNT(poem.Id) DESC

--#20
SELECT TOP 1 gender.Name, COUNT(poem.Id) FROM Gender gender
JOIN Author author ON author.GenderId = gender.Id
JOIN Poem poem ON poem.AuthorId = author.Id
JOIN PoemEmotion pe ON pe.PoemId = poem.Id
JOIN Emotion emotion ON pe.EmotionId = emotion.Id
GROUP BY gender.Name, emotion.Name
HAVING emotion.Name = 'Fear'
ORDER BY COUNT(poem.Id)