INSERT INTO artist(artist_name) VALUES
	('The Beatles'),
	('Bob Dylan'),
	('Queen'),
	('Elvis Presley'),
	('The Rolling Stones'),
	('2Pac'),
	('Madonna'),
	('Ricky Martin'),
	('Noize MC'),
	('Eminem'),
	('Lady Gaga');

INSERT INTO genre(genre_name) VALUES
	('Рок'),
	('Блюз'),
	('Рок-н-ролл'),
	('Поп'),
	('Кантри'),
	('Рэп');
	
INSERT INTO album(album_name, album_year) VALUES 
	('2Pacalypse Now', 1991), 
	('Aftermath', 1966), 
	('Elvis Is Back!', 1960), 
	('Moody Blue', 1977), 
	('New Morning ', 1970), 
	('Yellow Submarine', 1969), 
	('Help', 1965), --beatles
	('American Life', 2003), 
	('A Night at the Opera', 1975), 
	('A Kind of Magic', 1986), 
	('Sound Loaded', 2000),
	('Madame X: Music from the Theater Xperience', 2021),
	('Music to Be Murdered By', 2020),
	('Chromatica', 2020),
	('XV', 2019);

INSERT INTO artist_genre VALUES  
	(1,1),
	(1,3),
	(1,4),
	(2,2),
	(3,1),
	(3,4),
	(3,7),
	(4,8),
	(4,7),
	(5,2),
	(6,6),
	(6,9),
	(6,10),
	(4,9),
	(1,9),
	(4,11);

INSERT INTO artist_album VALUES 
	(1,6),
	(2,5),
	(3,4),
	(4,4),
	(5,2),
	(6,1),
	(7,1),
	(8,7),
	(9,3),
	(10,3),
	(11,8),
	(15,9),
	(14,11),
	(13,10);

INSERT INTO song(album_id, song_name, song_length) VALUES 
	(1, 'Young Black Male', '00:02:35'),
	(1, 'Something Wicked', '00:02:28'),	
	(2, 'Take It or Leave It', '00:02:46'),
	(2, 'Under My Thumb', '00:03:41'),
	(3, 'Are You Lonesome Tonight?', '00:03:07'),
	(3, 'A Mess of Blues', '00:02:40'),	
	(4, 'If You Love Me', '00:02:57'),
	(4, 'Way Down', '00:02:37'),	
	(5, 'New Morning', '00:03:56'),	
	(6, 'Yellow Submarine', '00:02:34'),
	(6, 'All You Need Is Love', '00:03:44'),	
	(7, 'Help!', '00:02:16'),
	(7, 'Yesterday', '00:02:03'),		
	(8, 'Nobody Knows Me', '00:04:39'),
	(8, 'American Life', '00:04:58'),		
	(9, 'Bohemian Rhapsody', '00:05:55'),
	(9, 'Love of My Life', '00:03:39'),	
	(10, 'A Kind of Magic', '00:04:24'),
	(10, 'One Vision', '00:05:11'),		
	(11, 'Amor', '00:03:27'),
	(11, 'Nobody Wants to Be Lonely', '00:04:11'),
	(15, 'Yes Future!', '00:03:12'),
	(15, 'На Марсе классно', '00:04:13'),
	(14, 'Alice', '00:02:57'),
	(14, 'Hold My Hand', '00:03:45'),
	(13, 'Never Love Again', '00:02:57'),
	(13, 'Godzilla', '00:03:30'),
	(12, 'Killers Who Are Partying', '00:05:28');

INSERT INTO collection (collection_name, collection_year) VALUES 
	('Milestones', 1972),
	('Slow Rollers', 1981), 
	('The Best of Ricky Martin', 2001),
	('Elvis: A Legendary Performer Volume 1', 1974),
	('Elvis: 2nd to None', 2003),
	('The Number Ones', 1983),
	('Greatest Hits Volume 2 (Beatles album)', 1967),
	('The Beatles: The Collection', 1982),
	('Greatest Hits (Queen album)', 1981),
	('Greatest Hits II (Queen album)', 1991),
	('Finally Enough Love: 50 Number Ones', 2022),
	('Bohemian Rhapsody: The Original Soundtrack', 2018),
	('Esencial', 2018);

INSERT INTO song_collection(song_id, collection_id) VALUES  
	(3,1),
	(4,2),
	(21,3),
	(22,3),
	(5,4),
	(6,5),
	(7,5),
	(11,6),
	(12,7),
	(13,8),
	(14,8),
	(19,9),
	(17,9),
	(18,9),
	(20,10);

INSERT INTO song_collection(song_id, collection_id) VALUES  
	(17,12);
