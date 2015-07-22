
select * from PERFORMBOARD;

create sequence PERFORMBOARD_seq
start with 1
increment by 1;

-- No
insert into artist(ARTIST_ID,ATIST_PASSWORD,ARTIST_NAME,ARTIST_NICKNAME,ARTIST_PHONE,ARTIST_ZIPCODE, 			   
 ARTIST_ADDRESS, 			   
 ARTIST_BIRTH)			   
 values('testId','1','testId','0','a','a','0',to_date('1990-12-27', 'yyyy-mm-dd'))
 --2 marketBoard �׽�Ʈ�Ҷ� �� �ӽ� ���̵� ���� (�ʼ�)
 
 alter table marketboard modify(content VARCHAR2(4000));
 --3 ���� �ʵ� ũ�Ⱑ �ʹ� �۾Ƽ� Ȯ��
 
  ALTER TABLE artist RENAME COLUMN atist_password TO artist_password;
 --4 atist�� �Ǿ� �ִ°� artist��(�ʼ�)
 
 alter table marketboard modify(file_path varchar2(2000));
 --5 ���� ���ϰ�� ������ file_path �ʹ� �۾Ƽ� Ȯ��
 
 select * from ARTIST;
 
 select * from MARKETBOARD;
 
 select * from marketboard where board_num='m6'
 

 
 update marketboard set nvl(count,0)=count+1 where board_num='m3'
 
 delete from marketboard;
 
 
