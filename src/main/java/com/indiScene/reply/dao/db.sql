

 
 select to_number(nvl(max(reply_num),0))+1 from reply where board_num=1;
 
 select constraint_name, constraint_type 
from all_constraints;   !--�젣�빟議곌굔 �쟾遺� �솗�씤�븯湲�
 
 alter table reply drop constraint fk_freeboard_to_reply cascade;  !--�떟湲��뿉�꽌 �옄�쑀寃뚯떆�뙋�쑝濡� 臾쇰젮吏� 李몄“�궎 �궘�젣�븯湲�
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




