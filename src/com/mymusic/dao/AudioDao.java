package com.mymusic.dao;

import java.util.List;

import com.mymusic.model.Audio;
import com.mymusic.model.Sheet;

public interface AudioDao {
	public int saveAudio(Audio audio);
	
	public List<Audio> showAudioAll();

	public int removeAudio(Audio audio);

	public int updateAudio(Audio audio);

	public List<Audio> searchAudio(Audio audio);

	public int playAudio(Audio audio);

}
