

 
 select to_number(nvl(max(reply_num),0))+1 from reply where board_num=1;
 
 select constraint_name, constraint_type 
from all_constraints;   !--제약조건 전부 확인하기
 
 alter table reply drop constraint fk_freeboard_to_reply cascade;  !--답글에서 자유게시판으로 물려진 참조키 삭제하기
 alter table reply drop constraint fk_placeboard_to_reply cascade; 
 alter table reply drop constraint fk_performboard_to_reply cascade; 
 alter table reply drop constraint fk_BESTBOARD_to_reply cascade; 
 alter table reply drop constraint fk_uploadBoard_to_reply cascade; 
 alter table reply drop constraint fk_artist_to_reply cascade;
 
 alter table reply drop constraint pk_reply cascade;
 
 
 select * from reply;
 delete reply;
 

select rownum, a.* from(select reply_num from reply where board_num='m122' order by reply_date desc) a where rownum=1
 
select to_char(to_number(nvl(max(reply_num),0))+1,'9999') from reply where board_num='m122'




