package com.indiScene.artist.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.indiScene.artist.dto.ArtistDto;

@Component
public class ArtistDaoImpl implements ArtistDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int register(ArtistDto artistDto) {
		return sqlSession.insert("dao.memberMapper.register",artistDto);
	}

	/*int insert(ArtistDto artistDto)
	int idCheck(String id)
	int nickCheck(String nick)
	int update(AtistDto artistDto)
	int delete(HashMap<String,String> hMap)
	ArtistDto select(String id)
	List<ZipcodeList> getZipcodeList(String dong)*/
}
