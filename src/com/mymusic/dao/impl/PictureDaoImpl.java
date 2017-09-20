package com.mymusic.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.mymusic.dao.PictureDao;
import com.mymusic.model.Audio;
import com.mymusic.model.Picture;
import com.mymusic.model.User;
import com.mymusic.util.JDBCUtil;


public class PictureDaoImpl implements PictureDao {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	public boolean savePicture(Picture picture) {
		int count = 0;
		boolean flag = false;
		String sql = "insert into apictures(paid,pfrom,pname,picture) values(?,?,?,?)";
		conn = JDBCUtil.getConnection();
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, picture.getPaid());
			pstmt.setString(2, picture.getPfrom());
			pstmt.setString(3, picture.getPname());
			pstmt.setString(4, picture.getPicture());
			
			count = pstmt.executeUpdate();
			if(count >=1) flag = true;
		}catch(SQLException e){
			e.printStackTrace();
			flag = false;
		}
		return flag;
	}

	public List<Picture> findAll() {
		List<Picture> list = new ArrayList<Picture>();
		Picture picture = null;
		try{
			conn = JDBCUtil.getConnection();
			String sql = "select * from apictures";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				picture = new Picture();
				picture.setPaid(rs.getInt("paid"));
				picture.setPfrom(rs.getString("pfrom"));
				picture.setPname(rs.getString("pname"));
				picture.setPicture(rs.getString("picture"));
				
				
				list.add(picture);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return list;
	}

}
