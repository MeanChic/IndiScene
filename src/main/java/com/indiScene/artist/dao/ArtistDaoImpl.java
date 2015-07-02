package com.indiScene.artist.dao;

import java.util.HashMap;
import java.util.List;
import java.util.logging.Logger;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.indiScene.artist.dto.ArtistDto;
import com.indiScene.artist.dto.ZipcodeDto;

/**
 * @type : ArtistDaoImpl
 * @date : 2015. 6. 26.
 * @author : 오경선
 * @description : 회원 정보를 데이터베이스에 기록, 수정, 삭제 하기 위한 클래스
 */
@Component
public class ArtistDaoImpl implements ArtistDao {
	private final Logger logger=Logger.getLogger(this.getClass().getName());

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insert(ArtistDto artistDto) {
		logger.info("-----Dao artist insert-----");
		return sqlSession.insert("dao.ArtistMapper.insert",artistDto);
	}

	@Override
	public int idCheck(String id) {
		logger.info("-----Dao artist idCheck-----");
		String idCheck=sqlSession.selectOne("dao.ArtistMapper.idCheck",id);
		int value=0;
		if(idCheck!=null) value=1;
		return value;
	}

	@Override
	public int nicknameCheck(String nickname) {
		logger.info("-----Dao artist nicknameCheck-----");
		String nicknameCheck=sqlSession.selectOne("dao.ArtistMapper.nicknameCheck",nickname);
		int value=0;
		if(nicknameCheck!=null) value=1;
		return value;
	}
	
	@Override
	public ArtistDto select(String id) {
		logger.info("-----Dao artist select-----");
		return sqlSession.selectOne("dao.ArtistMapper.updateSelect",id);
	}
	
	@Override
	public int update(ArtistDto artistDto) {
		logger.info("-----Dao artist update-----");
		return sqlSession.update("dao.ArtistMapper.update",artistDto);
	}
	
	@Override
	public int delete(HashMap<String, String> hMap){
		logger.info("-----Dao artist delete-----");
		return sqlSession.delete("dao.ArtistMapper.delete",hMap);
	}
	
	@Override
	public ArtistDto login(HashMap<String, String> hMap) {
		logger.info("-----Dao artist login-----");
		return sqlSession.selectOne("dao.ArtistMapper.login",hMap);
	}

	@Override
	public List<ZipcodeDto> ZipcodeList(String dong) {
		return sqlSession.selectList("dao.ArtistMapper.zipcode",dong);
	}
}
