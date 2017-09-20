package com.mymusic.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.mymusic.dao.PictureDao;
import com.mymusic.dao.impl.PictureDaoImpl;
import com.mymusic.model.Picture;
import com.opensymphony.xwork2.ActionSupport;

public class PictureAction extends ActionSupport {
	private File pic;
	private String picContentType;
	private String picFileName;
	private String savePath;
	
	private Picture picture;
	
	List<Picture> pictureList;
	
	public List<Picture> getPictureList(){
		return pictureList;
	}
	
	public void setPictureList(List<Picture> pictureList){
		this.pictureList = pictureList;
	}
	
	PictureDao pictureDao = new PictureDaoImpl();
	
	public PictureDao getPictureDao(){
		return pictureDao;
	}
	
	public void setPictureDao(PictureDao pictureDao){
		this.pictureDao = pictureDao;
	}
	
	public Picture getPicture(){
		return picture;
	}
	
	public void setPicture(Picture picture){
		this.picture = picture;
	}
	
	/* */
	public String findAll(){
		pictureList = pictureDao.findAll();
		return "findAll";
	}
	
	public String execute() throws Exception {
		FileOutputStream fos = null;
		FileInputStream fis = null;
		try{
			fos = new FileOutputStream(this.getSavePath() + "\\"
					+ this.getPicFileName());
			fis = new FileInputStream(this.getPic());
			byte[] buffer = new byte[1024];
			int len = 0;
			while ((len = fis.read(buffer)) > 0){
				fos.write(buffer, 0, len);
			}
			picture.setPicture(picFileName);
			boolean saveResult = pictureDao.savePicture(picture);
			if(saveResult) {
				pictureList = pictureDao.findAll();
			}
		}catch(FileNotFoundException e){
			e.printStackTrace();
			throw new FileNotFoundException(
					"dingjun sayFileNotFoundException :" + e.getMessage());
		}finally{
			try{
				fos.close();
				fis.close();
			}catch (IOException e){
				e.printStackTrace();
				throw new IOException("dingjun sayIOException :" +e.getMessage());
		}
	}
	return SUCCESS;

}
	public File getPic(){
		return pic;
	}
	
	public void setPic(File pic){
		this.pic = pic;
	}
	
	public String getPicContentType(){
		return picContentType;
	}
	
	public void setPicContentType(String picContentType){
		this.picContentType = picContentType;
	}
	
	public String getPicFileName(){
		return picFileName;
	}
	
	public void setPicFileName(String picFileName) {
		this.picFileName = picFileName;
	}

	public String getSavePath() throws Exception {
		String url = ServletActionContext.getServletContext().getRealPath(savePath);
		System.out.println(url);
		return url;
	}
	
	public InputStream getInputStream(){
		return ServletActionContext.getServletContext().getResourceAsStream(
				"/upload/pic/" + picFileName);
	}
	public void setSavePath(String savePath){
		this.savePath = savePath;
	}
	
	public String download(){
		return SUCCESS;
	}
}