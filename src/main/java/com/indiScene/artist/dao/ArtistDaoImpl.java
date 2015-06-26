package com.indiScene.artist.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.indiScene.artist.dto.ArtistDto;

@Component
public class ArtistDaoImpl implements ArtistDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insert(ArtistDto artistDto) {
		return sqlSession.insert("dao.ArtistMapper.insert",artistDto);
	}

	@Override
	public int idCheck(String id) {
		String idCheck=sqlSession.selectOne("dao.ArtistMapper.idCheck",id);
		int value=0;
		if(idCheck!=null) value=1;
		return value;
	}

	@Override
	public int nicknameCheck(String nickname) {
		String nicknameCheck=sqlSession.selectOne("dao.ArtistMapper.nicknameCheck",nickname);
		int value=0;
		if(nicknameCheck!=null) value=1;
		return value;
	}
	
	@Override
	public ArtistDto select(String id) {
		return sqlSession.selectOne("dao.ArtistMapper.updateSelect",id);
	}
	
	@Override
	public int update(ArtistDto artistDto) {
		return sqlSession.update("dao.ArtistMapper.update",artistDto);
	}
	
	@Override
	public int delete(HashMap<String, String> hMap) {
		return sqlSession.delete("dao.ArtistMapper.delete",hMap);
	}
	/*
	@Override
	public List<ZipcodeList> getZipcodeList(String dong) {
		return sqlSession.selectList("dao.ArtistMapper.zipcode",dong);
	}
	*/

	@Override
	public ArtistDto login(HashMap<String, String> hMap) {
		return null;
	}

}
