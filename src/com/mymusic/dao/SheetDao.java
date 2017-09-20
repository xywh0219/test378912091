package com.mymusic.dao;

import java.util.List;

import com.mymusic.model.Audio;
import com.mymusic.model.Sheet;

public interface SheetDao {
	public int saveSheet(Sheet sheet);
	
	public List<Sheet> showSheetAll();

	public int removeSheet(Sheet sheet);

	public int updateSheet(Sheet sheet);
	
	public List<Sheet> openSheet(Sheet sheet);

	public List<Audio> searchSheet(Sheet sheet);
}
