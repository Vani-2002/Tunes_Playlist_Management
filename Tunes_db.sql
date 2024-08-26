CREATE TABLE users (
        user_id number constraint user_id_pk primary key,
        user_name VARCHAR(50) constraint user_name_nn not null,
        password VARCHAR(25) constraint pass_un unique,
        email VARCHAR(50)
    );
INSERT INTO users VALUES (1, 'viswa', 'viswa@123', 'iamviswa@gmail.com');
insert into users values (2, 'eswar', 'eswar@789', 'eswarr@gmail.com');
insert into users values (3, 'priya', 'priya@456', 'priyaas@gmail.com');

select * from users;	
----------------------------------------------------------------------------- 
CREATE TABLE artists (
        artist_id number constraint art_id_pk primary key,
        artist_name VARCHAR(50) constraint art_name_nn not null,
        description VARCHAR(200)
    );
INSERT INTO artists VALUES (1, 'taylor swift', 'One of the best singer and composer');
insert into artists values (2, 'Harry styles', 'Best singer and songwriter');
insert into artists values (3, 'Jungkook', 'Powerful singer and songwriter');

select * from artists;

----------------------------------------------------------------------------
CREATE TABLE albums (
        album_id number constraint alb_id_pk primary key,
        album_title VARCHAR(50) constraint alb_title_nn not null,

        artist_id number,
        release_year date,
        genre VARCHAR(50), 
		constraint artist_id_fk foreign key(artist_id)
		references artists(artist_id)		
		
	  ); 
      
INSERT INTO albums VALUES(1, 'speak now', 1,to_date('2010','yyyy'), 'pop rock');
insert into albums values (2, 'Fine line', 2,to_date('2019','yyyy'), 'pop rock');
insert into albums values (3, 'The remixes', 3,to_date('2023','yyyy'), 'pop');
select * from albums;

-------------------------------------------------------------------------------------
CREATE TABLE songs (
        song_id number constraint song_id_pk primary key,
        song_title VARCHAR(50),
        album_id number,
        duration interval day to second,
        song_url VARCHAR(100), 
		constraint album_id_fk foreign key(album_id)
		references albums(album_id)
		
    );
    
INSERT INTO songs VALUES (101, 'Enchanted', 1,to_dsinterval('0 00:05:56'), 'https://youtu.be/igIfiqqVHtA');
insert into songs values (102, 'falling', 2,to_dsinterval('0 00:03:55'), 'https://youtu.be/olGSAVOkkTI');
insert into songs values (103, '3D', 3, to_dsinterval('0 00:03:50'), 'https://youtu.be/mHNCM-YALSA');
	
select * from songs;

----------------------------------------------------
CREATE TABLE playlist ( 
        playlist_id NUMBER constraint playlist_id_pk primary key,
        user_id NUMBER,
        playlist_title VARCHAR(50),
        description VARCHAR(100),
		constraint user_id_fk foreign key(user_id)
		references users(user_id)	
    ); 

INSERT INTO playlist VALUES (1, 1, 'swiftie Playlist', 'My favourite music Collection');
insert into playlist values (2, 2, 'My playlist', 'Top tracks from harrystyles');
insert into playlist values (3, 3, 'k-pop favourites', 'The essential JK Tracks');
select * from playlist;

--------------------------------------------------------------------------------------------------
CREATE TABLE playlist_songs (
        playlistsong_id NUMBER constraint playlistsong_id_pk primary key,
        playlist_id NUMBER,
        song_id NUMBER,
		constraint playlist_id_fk foreign key(playlist_id)
		references playlist(playlist_id),
        constraint song_id_fk foreign key(song_id)
		references songs(song_id)			
    );
INSERT INTO playlist_songs VALUES (1, 1, 101);
insert into playlist_songs values (2, 2, 102);
insert into playlist_songs values (3, 3, 103);
select * from playlist_songs;


-------------------------------------------------------------------------------------------------------
--to retrive the albums and songs by artist taylor swift
select al.album_title,
       s.song_title 
	   from albums al
 join songs s 
 on al.album_id=s.album_id 
 join artists a
 on al.artist_id=a.artist_id 
 where artist_name='taylor swift'; 
 
 --retrieve the songs in the pop-rock genre 
 select s.song_title,
        al.album_title,
        al.genre
        from songs s
join albums al
on al.album_id=s.album_id
where al.genre='pop rock'; 
        
