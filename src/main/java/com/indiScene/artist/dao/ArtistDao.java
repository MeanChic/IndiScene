package com.indiScene.artist.dao;

import java.util.HashMap;
import java.util.List;

import com.indiScene.artist.dto.ArtistDto;
import com.indiScene.artist.dto.ZipcodeDto;

public interface ArtistDao {
	public int insert(ArtistDto artistDto);
	public int idCheck(String id);
	public int nicknameCheck(String nickname);
	public int update(ArtistDto artistDto);
	public int delete(HashMap<String,String> hMap);
	public ArtistDto select(String id);
	public ArtistDto login(HashMap<String, String> hMap);
	public List<ZipcodeDto> ZipcodeList(String dong);
}
