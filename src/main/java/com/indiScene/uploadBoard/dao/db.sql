alter table uploadboard drop CONSTRAINT FK_ARTIST_TO_UPLOADBOARD cascade;

insert into genre values(0, 'Rock');

insert into genre values(1, 'Ballad');

insert into genre values(2, 'Hiphop');


create sequence uploadBoard_seq  
start with 1
increment by 1;