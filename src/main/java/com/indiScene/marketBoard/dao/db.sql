
select * from marketboard;

create sequence marketboard_seq  
start with 1
increment by 1;
 --1 시퀸스 생성(필수)

insert into artist(ARTIST_ID,ATIST_PASSWORD,ARTIST_NAME,ARTIST_NICKNAME,ARTIST_PHONE,ARTIST_ZIPCODE, 			   
 ARTIST_ADDRESS, 			   
 ARTIST_BIRTH)			   
 values('testId','1','testId','0','a','a','0',to_date('1990-12-27', 'yyyy-mm-dd'))
 --2 marketBoard 테스트할때 쓸 임시 아이디 생성 (필수)
 
 alter table marketboard modify(content VARCHAR2(4000));
 --3 내용 필드 크기가 너무 작아서 확장
 
  ALTER TABLE artist RENAME COLUMN atist_password TO artist_password;
 --4 atist로 되어 있는걸 artist로(필수)
 
 alter table marketboard modify(file_path varchar2(2000));
 --5 다중 파일경로 넣을때 file_path 너무 작아서 확장
 
 select * from ARTIST;
 
 select * from MARKETBOARD;
 
 select * from marketboard where board_num='m6'
 

 
 update marketboard set nvl(count,0)=count+1 where board_num='m3'
 
 delete from marketboard;
 
 
