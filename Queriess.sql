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