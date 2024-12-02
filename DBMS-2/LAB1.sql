--Part – A 
--1. Retrieve a unique genre of songs.
SELECT DISTINCT GENRE FROM SONGS

--2. Find top 2 albums released before 2010. 
SELECT TOP 2 ALBUM_TITLE FROM ALBUMS 
WHERE Release_year<2010

--3. Insert Data into the Songs Table. (1245, ‘Zaroor’, 2.55, ‘Feel good’, 1005)
INSERT INTO Songs VALUES(1245,'Zaroor',2.55,'Feel good',1005)

--4. Change the Genre of the song ‘Zaroor’ to ‘Happy’ 
UPDATE  SONGS
SET GENRE='Happy'
WHERE Song_title='Zaroor'

--5. Delete an Artist ‘Ed Sheeran’ 
DELETE FROM Artist
WHERE Artist_name='Ed Sheeran'

--6. Add a New Column for Rating in Songs Table. [Ratings decimal(3,2)] 
ALTER TABLE SONGS
ADD RATING DECIMAL(3,2)

--7. Retrieve songs whose title starts with 'S'.
SELECT SONG_TITLE FROM SONGS 
WHERE SONG_TITLE LIKE 'S%'

--8. Retrieve all songs whose title contains 'Everybody'.
SELECT SONG_TITLE FROM SONGS 
WHERE SONG_TITLE LIKE '%EVERYBODY%'

--9. Display Artist Name in Uppercase. 
SELECT UPPER(ARTIST_NAME) FROM Artist

--10. Find the Square Root of the Duration of a Song ‘Good Luck’ 
SELECT SQRT(DURATION) FROM Songs
WHERE Song_title='GOOD LUCK'

--11. Find Current Date. 
SELECT GETDATE()

--12. Find the number of albums for each artist. 
SELECT COUNT(*) FROM Albums
GROUP BY Artist_id
--13. Retrieve the Album_id which has more than 5 songs in it. 
SELECT ALBUM_ID FROM Songs
GROUP  BY Album_id
HAVING COUNT(SONG_ID)>5

--14. Retrieve all songs from the album 'Album1'. (using Subquery) 
SELECT Song_title FROM Songs
WHERE Album_id=(SELECT Album_id FROM Albums WHERE Album_title='ALBUM1')

--15. Retrieve all albums name from the artist ‘Aparshakti Khurana’ (using Subquery) 
SELECT Album_title FROM Albums
WHERE Artist_id=(SELECT Artist_id FROM Artist WHERE Artist_name='Aparshakti Khurana')

--16. Retrieve all the song titles with its album title.
SELECT S.Song_title ,A.Album_title FROM Songs S 
JOIN Albums A
ON S.Album_id=A.Album_id

--17. Find all the songs which are released in 2020. 
SELECT S.Song_title  FROM Songs S 
JOIN Albums A
ON S.Album_id=A.Album_id
WHERE Release_year=2020


--18. Create a view called ‘Fav_Songs’ from the songs table having songs with song_id 101-105.  
CREATE VIEW FAV_SONGS
AS
SELECT * FROM Songs
WHERE Song_id BETWEEN 101 AND 105


--19. Update a song name to ‘Jannat’ of song having song_id 101 in Fav_Songs view. 
UPDATE FAV_SONGS
SET Song_title='JANNAT'
WHERE Song_id=101

--20. Find all artists who have released an album in 2020.  
SELECT AR.Artist_name  FROM Artist AR
JOIN Albums A
ON AR.Artist_id=A.Artist_id
WHERE Release_year=2020

--21. Retrieve all songs by Shreya Ghoshal and order them by duration.
SELECT S.Song_title  FROM Songs S 
JOIN Albums A
ON S.Album_id=A.Album_id
JOIN Artist AR
ON AR.Artist_id=A.Artist_id
WHERE Artist_name='Shreya Ghoshal'
ORDER BY Duration
--Part – B 
--22. Retrieve all song titles by artists who have more than one album.
SELECT S.Song_title  FROM Songs S 
JOIN Albums A
ON S.Album_id=A.Album_id
JOIN Artist AR
ON AR.Artist_id=A.Artist_id
WHERE AR.Artist_id IN(SELECT Artist_id FROM Albums GROUP BY Artist_id HAVING COUNT(ALBUM_ID)>1)

--23. Retrieve all albums along with the total number of songs.  
SELECT A.Album_id, FROM Albums A
JOIN Songs S
ON A.Album_id=S.Album_id
--24. Retrieve all songs and release year and sort them by release year.  
--25. Retrieve the total number of songs for each genre, showing genres that have more than 2 songs. 
--26. List all artists who have albums that contain more than 3 songs. 
--Part – C 
--27. Retrieve albums that have been released in the same year as 'Album4' 
--28. Find the longest song in each genre 
--29. Retrieve the titles of songs released in albums that contain the word 'Album' in the title. 
--30. Retrieve the total duration of songs by each artist where total duration exceeds 15 minutes. 