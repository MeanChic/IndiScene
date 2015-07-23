package com.indiScene.muse.dao;

import java.util.HashMap;
import java.util.List;
import java.util.logging.Logger;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.indiScene.muse.dto.MuseDto;


/**
 * @name:MuseDaoImpl
 * @date :2015. 6. 25.
 * @author: 김정승
 * @description :	MuseDao interface를 상속받은 class
 */
@Component
public class MuseDaoImpl implements MuseDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final Logger logger = Logger.getLogger(this.getClass().getName());
	
	/**
	 * @name:nameCheck
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description :	muse 이름이 기존에 존재하는지 확인하는 method
	 */
	public MuseDto nameCheck(String muse_name){
		return sqlSession.selectOne("dao.MuseMapper.nameCheck",muse_name);
	}
	
	/**
	 * @name:logup
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description :	muse를 개설하기 위해 insert하는 method
	 */
	public int logup(MuseDto museDto){
		int check = sqlSession.insert("dao.MuseMapper.logup", museDto);
		if(check > 0){
			sqlSession.insert("dao.MuseMapper.in", museDto);
		}
		return check;
	}
	
	/**
	 * @name:museCheck
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description :	회원이 기존에 muse를 개설했는지 확인하는 method
	 */
	public MuseDto museCheck(String artist_id){
		return sqlSession.selectOne("dao.MuseMapper.museCheck",artist_id);
	}
	
	/**
	 * @name:bestMuse
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description :	가입된 회원수가 많은 순으로 보여진다.
	 */
	public List<HashMap<String, Object>> bestMuse(String artist_id){
		return sqlSession.selectList("dao.MuseMapper.bestMuse", artist_id);
	}
	
	/**
	 * @name:myMuse
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description :	내가 가입한 muse가 보여진다.
	 */
	public List<HashMap<String, Object>> myMuse(String artist_id){
		return sqlSession.selectList("dao.MuseMapper.myMuse", artist_id);		
	}
	
	/**
	 * @name:myMuse
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description :	내가 가입한 muse가 보여진다.
	 */
	public List<MuseDto> allMuse(String artist_id){
		return sqlSession.selectList("dao.MuseMapper.allMuse", artist_id);
	}
	
	/**
	 * museCancle
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description :	가입신청을 취소하기위해 mapper를 통해 쿼리문 전송 하는 method.
	 */
	public int museCancle(String artist_id, String muse_name){
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("artist_id", artist_id);
		hMap.put("muse_name", muse_name);
		
		return sqlSession.delete("dao.MuseMapper.cancle", hMap);
	}
	
	/**
	 * @name:myMuse
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description :	가입신청을 하기위해 mapper를 통해 쿼리문 전송 하는 method.
	 */
	public int museSignup(String artist_id, String muse_name){
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("artist_id", artist_id);
		hMap.put("muse_name", muse_name);
		
		return sqlSession.insert("dao.MuseMapper.signup", hMap);
	}
	
	/**
	 * @name:myMuse
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description :	개설자 인지 확인하기 위해 mapper를 통해 쿼리문 전송 하는 method
	 */
	public MuseDto masterCheck(String artist_id, String muse_name){
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("artist_id", artist_id);
		hMap.put("muse_name", muse_name);
		
		return sqlSession.selectOne("dao.MuseMapper.masterCheck", hMap);
		
	}
	
	/**
	 * @name:myMuse
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description :	가입신청을 위해 mapper를 통해 쿼리문 전송 하는 method.
	 */
	public List<HashMap<String, Object>> joinMember(String muse_name){
		return sqlSession.selectList("dao.MuseMapper.joinMember", muse_name);
	}
	
	/**
	 * @name:myMuse
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description :	가입신청을 취소하기위해 mapper를 통해 쿼리문 전송 하는 method.
	 */
	public List<HashMap<String, Object>> nonMember(String muse_name){
		return sqlSession.selectList("dao.MuseMapper.nonMember", muse_name);	
	}
	
	/**
	 * @name:myMuse
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description :	가입신청한 회원을 승인 하기위해 mapper를 통해 쿼리문 전송 하는 method.
	 */
	public int inviteMember(String artist_id, String muse_name){
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("artist_id", artist_id);
		hMap.put("muse_name", muse_name);
		
		return sqlSession.update("dao.MuseMapper.inviteMember", hMap);
	}
	
	/**
	 * @name:myMuse
	 * @date :2015. 6. 26.
	 * @author: 김정승
	 * @description :	가입신청한 회원을 거부 하기위해 mapper를 통해 쿼리문 전송 하는 method
	 */
	public int outMember(String artist_id, String muse_name){
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("artist_id", artist_id);
		hMap.put("muse_name", muse_name);
		
		return sqlSession.delete("dao.MuseMapper.cancle", hMap);
	}
	
	public int deleteMuse(String muse_name){
		sqlSession.delete("dao.MuseMapper.deleteMuseMember",muse_name);
		
		
		return sqlSession.delete("dao.MuseMapper.deleteMuse", muse_name);
	}
}
