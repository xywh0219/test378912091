package com.mymusic.dao;

import java.util.List;

import com.mymusic.model.Audio;
import com.mymusic.model.Sheet;
import com.mymusic.model.User;

public interface UserDao {
	public int saveUser(User user);

	public List<User> showUserAll();

	public int removeUser(User user);
	
	public int updateUser(User user);
	
	public List<User> loginUser(User user);

	public List<Sheet> showSheet(User user);

	public List<Sheet> showSheetAll();

	public List<Audio>showAudioAll();
}
