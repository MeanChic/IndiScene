select * from MUSE_SIGNUP;
drop table MUSE_SIGNUP PURGE;
create table muse_signup(
	artist_id VARCHAR2(255),
	muse_yn	VARCHAR2(255),
	muse_name VARCHAR2(255),
	FOREIGN KEY(artist_id) REFERENCES artist(artist_id),
	FOREIGN KEY(muse_name) REFERENCES muse(muse_name)
);


TRUNCATE TABLE muse_signup;

ALTER TABLE muse_signup DROP COLUMN muse_name;

select a.sid, a.serial# from v$session a, v$lock b, dba_objects c 
where a.sid=b.sid and b.id1=c.object_id and b.type='TM' and c.object_name='muse_signup';

select * from marketboard;

create sequence marketboard_seq
start with 1
increment by 1;


insert into artist(ARTIST_ID,ATIST_PASSWORD,ARTIST_NAME,ARTIST_NICKNAME,ARTIST_PHONE,ARTIST_ZIPCODE, 			   
 ARTIST_ADDRESS, 			   
 ARTIST_BIRTH)			   
 values('testId','1','testId','0','a','a','0',to_date('1990-12-27', 'yyyy-mm-dd'))
 
 select * from ARTIST;
 
 select * from MARKETBOARD;
 
 
 select * from marketboard where board_num='m6'
 
 alter table marketboard modify(content VARCHAR2(4000));
 
 		update marketboard set nvl(count,0)=count+1 where board_num='m3'
 		
 		
 select * from muse where muse_name=(select muse_name from MUSE_SIGNUP where )
 
 select muse_name from MUSE_SIGNUP where 
 

 
 select * from muse_signup;
 
 select * from muse;
 

 
 insert into MUSE_SIGNUP values('A','n','a');
 
 insert into MUSE_SIGNUP values('B','n','a');
 
 insert into MUSE_SIGNUP values('C','n','a');
 
 insert into MUSE_SIGNUP values('D','n','a');
 
 insert into MUSE_SIGNUP values('E','n','bb');
 
 
  insert into MUSE_SIGNUP values('A','n','dd');
 
 insert into MUSE_SIGNUP values('B','n','dd');
 
 insert into MUSE_SIGNUP values('C','n','dd');
 
 insert into MUSE_SIGNUP values('D','n','dd');
 
 insert into MUSE_SIGNUP values('E','n','a');
 
   insert into MUSE_SIGNUP values('D','n','abc');
 
 insert into MUSE_SIGNUP values('B','n','abc');
 
 insert into MUSE_SIGNUP values('C','n','abc');
 
 insert into MUSE_SIGNUP values('E','n','abc');
 
 select * from muse;
select x.*, nvl(y.muse_yn,0) from (select * from (select rownum rnum, m.* from muse m, (select  muse_name from (select muse_name, count(muse_name) co from muse_signup GROUP BY muse_name) a order by a.co desc) a
 where m.muse_name = a.muse_name) where rnum < 4) x, (select muse_name from muse_signup where artist_id='A') y where x.muse_name = y.muse_name;
 
 select x.*, y.muse_yn from (select * from (select rownum rnum, m.* from muse m, 
 (select  muse_name from (select muse_name, count(muse_name) co from muse_signup GROUP BY muse_name) a order by a.co desc) a
 where m.muse_name = a.muse_name) where rnum < 4) x, (select * from muse_signup where artist_id='A') y;
 
  select x.*, nvl(y.muse_yn,0) as muse_yn
  	from (select * 
  		from (select 
  				rownum rnum, 
  				m.* 
  			from muse m, 
 				(select  muse_name 
 					from 
 						(select muse_name, 
 							count(muse_name) co 
 							from muse_signup GROUP BY muse_name) a order by a.co desc) a
 where m.muse_name = a.muse_name) where rnum < 4) x, (select * from muse_signup where artist_id='E') y where x.muse_name=y.muse_name(+);
 
 select a.*, b.muse_yn from muse a, (select * from muse_signup where artist_id='A') b where a.muse_name = b.muse_name;
 
 
 select * from (select rownum rnum, a.*, b.muse_yn from muse a, (select * from muse_signup where artist_id='A') b where a.muse_name = b.muse_name) where rnum < 4
 
 select muse_name from MUSE_SIGNUP group by muse_name;
 
 select * from muse_signup;
 
 select * from muse;
 
 select b.* 
 	from (select rownum rnum, a.* 
 		    from muse a
 		   where a.muse_name not in (select muse_name from muse_signup where artist_id = 'A') 
 		   order by a.muse_date desc) b 
	where b.rnum < 4;
	
	a.muse_name not in ('a', 'bb')
 
 select muse_name from muse_signup where artist_id = 'E';
 
 commit;
 
 describe muse;
 
 select * from (select rownum rnum, m.* from muse m, 
		(select  muse_name from 
		(select muse_name, count(muse_name) co from muse_signup GROUP BY muse_name) a 
		order by a.co desc) a where m.muse_name = a.muse_name) where rnum < 4
 
	
select * from muse;

select * from muse_signup;

delete from muse_signup where muse_name='bb';

insert into muse_signup values('E','y','123');

select * from (select rownum rnum, a.*, b.muse_yn from muse a, (select * from muse_signup where artist_id='E') b where a.muse_name = b.muse_name) where rnum < 4

delete from muse where muse_name='123' and artist_id='A';

delete from muse where muse_name='123' and artist_id='A'


	 select x.*, nvl(y.muse_yn,0) as muse_yn
  	from (select * 
  		from (select 
  				rownum rnum, 
  				m.* 
  			from muse m, 
 				(select  muse_name 
 					from 
 						(select muse_name, 
 							count(muse_name) co 
 							from muse_signup GROUP BY muse_name) a order by a.co desc) e
 where m.muse_name = e.muse_name) where rnum < 5) x, (select * from muse_signup where artist_id='E') y where x.muse_name=y.muse_name(+) order by rnum asc
 

 update muse_signup set muse_yn='y' where artist_id='C' and muse_name='abc';
 
 select * from muse;
 
 select * from muse_signup;
 
 
 drop table guest;
 
 create table guest(
guest_num NUMBER(8)	NOT NULL,
muse_name VARCHAR2(40) NOT NULL,
artist_id VARCHAR2(30) NOT NULL,
guest_content VARCHAR2(300)	NOT NULL,
guest_date DATE	NOT NULL
);

select count(*) from guest where muse_name='abc';

create sequence museguest_seq
start with 1
increment by 1;

select * from (select rownum rnum, a.* from guest a where muse_name='abc' order by guest_date desc) b where rnum < 5 ;
 
select * from (select rownum rnum, a.* from (select * from guest order by guest_date desc) a where muse_name='abc') b where rnum > 0 and rnum <= 5;