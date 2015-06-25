package com.indiScene.artist.dao;

import java.util.HashMap;
import java.util.List;

import com.indiScene.artist.dto.ArtistDto;

public interface ArtistDao {
	public int insert(ArtistDto artistDto);
	public int idCheck(String id);
	public int nickCheck(String nickname);
	public int update(ArtistDto artistDto);
	public int delete(HashMap<String,String> hMap);
	public ArtistDto select(String id);
	//public List<ZipcodeList> getZipcodeList(String dong);
}
