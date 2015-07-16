
select * from marketboard;

create sequence marketboard_seq  
start with 1
increment by 1;
 --1 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙(占십쇽옙)

insert into artist(ARTIST_ID,ATIST_PASSWORD,ARTIST_NAME,ARTIST_NICKNAME,ARTIST_PHONE,ARTIST_ZIPCODE, 			   
 ARTIST_ADDRESS, 			   
 ARTIST_BIRTH)			   
 values('testId','1','testId','0','a','a','0',to_date('1990-12-27', 'yyyy-mm-dd'))
 --2 marketBoard 占쌓쏙옙트占쌀띰옙 占쏙옙 占쌈쏙옙 占쏙옙占싱듸옙 占쏙옙占쏙옙 (占십쇽옙)
 
 alter table marketboard modify(content VARCHAR2(4000));
 --3 占쏙옙占쏙옙 占십듸옙 크占썩가 占십뱄옙 占쌜아쇽옙 확占쏙옙
 
  ALTER TABLE artist RENAME COLUMN atist_password TO artist_password;
 --4 atist占쏙옙 占실억옙 占쌍는곤옙 artist占쏙옙(占십쇽옙)
 
 alter table marketboard modify(file_path varchar2(2000));
 --5 占쏙옙占쏙옙 占쏙옙占싹곤옙占� 占쏙옙占쏙옙占쏙옙 file_path 占십뱄옙 占쌜아쇽옙 확占쏙옙
 
 select * from ARTIST;
 
 select * from MARKETBOARD;
 
 select * from marketboard where board_num='m6'
 

 
 update marketboard set nvl(count,0)=count+1 where board_num='m3'
 
 delete from marketboard;
 
 
