package com.mymusic.dao;

import java.util.List;

import com.mymusic.model.Picture;
public interface PictureDao {
	public boolean savePicture(Picture picture);
	public List<Picture> findAll();
}
