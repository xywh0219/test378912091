package com.mymusic.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.mymusic.util.JDBCUtil;
import com.mymusic.dao.UserDao;
import com.mymusic.model.Audio;
import com.mymusic.model.Sheet;
import com.mymusic.model.User;

/* 插入信息 */
public class UserDaoImpl implements UserDao {
		private Connection conn = null;
		private PreparedStatement pstmt = null;
		private Statement stmt = null;
		private ResultSet rs = null;
		public int saveUser(User user) {
			int count = 0;
			String sql = "insert into users (username,password) values(?,?)";
			conn = JDBCUtil.getConnection();
			try {

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, user.getUname());
				pstmt.setString(2, user.getUpwd());
				 
				count = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return count;
	}
	/* 显示信息 */
		public List<User> showUserAll(){
		List<User> userList = new ArrayList<User>();
		User newUser = null;
		String sql = "select userid,username,password from users";
		conn =JDBCUtil.getConnection();
		
		try{
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				newUser = new User();
				newUser.setUid(rs.getInt("userid"));
				newUser.setUname(rs.getString("username"));
				newUser.setUpwd(rs.getString("password"));
				userList.add(newUser);
			}
		}catch (SQLException e){
			e.printStackTrace();
		}
		return userList;
	}

/* 删除信息 */
	public int removeUser(User user){
		int count = 0;
		String sql = "delete from users where userid = ?";
		conn = JDBCUtil.getConnection();
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user.getUid());
			
			count = pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return count;
	}
/* 更新信息 */
	public int updateUser(User user){
		int count = 0;
		String sql = "update users set username=?,password=? where userid=?";
		conn = JDBCUtil.getConnection();
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUname());
			pstmt.setString(2,user.getUpwd());
			pstmt.setInt(3, user.getUid());
			
			count = pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return count;
	}
/* 登录 */
	public List<User> loginUser(User user){
		List<User> userList = new ArrayList<User>();
		User newUser = null;
		
		String sql = "select * from users where username=? and password=?";
		conn =JDBCUtil.getConnection();
		
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUname());
			pstmt.setString(2, user.getUpwd());
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				newUser = new User();
				newUser.setUid(rs.getInt("userid"));
				newUser.setUname(rs.getString("username"));
				newUser.setUpwd(rs.getString("password"));
				userList.add(newUser);
			}
		}catch (SQLException e){
			e.printStackTrace();
		}
		return userList;
	}

		
	public List<Sheet> showSheet(User user) {
		// TODO Auto-generated method stub
		List<Sheet> sheetList = new ArrayList<Sheet>();
		Sheet newSheet = null;
		String sql = "select sid, uid, fname, sname,sstyle,sno from sheets where uname = ? group by sno";
		conn = JDBCUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUname());
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				 newSheet = new Sheet();
				 User theuser = new User();
				 Audio audio = new Audio();
				 newSheet.setSid(rs.getInt("sid"));
				 user.setUid(rs.getInt("uid"));
				 newSheet.setFname(rs.getString("fname"));
				 newSheet.setSname(rs.getString("sname"));
				 newSheet.setSstyle(rs.getString("sstyle"));
				 newSheet.setSno(rs.getInt("sno"));
				 newSheet.setUser(theuser);
				 newSheet.setAudio(audio);
				 sheetList.add(newSheet);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sheetList;
	}
	public List<Sheet> showSheetAll() {
		// TODO Auto-generated method stub
		List<Sheet> sheetListall = new ArrayList<Sheet>();
		Sheet newSheetall = null;
		String sql = "select sid, uid, fname, sname,sstyle,sno from sheets group by sno";
		conn = JDBCUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				 newSheetall = new Sheet();
				 User theuserall = new User();
				 Audio audioall = new Audio();
				 newSheetall.setSid(rs.getInt("sid"));
				 newSheetall.setFname(rs.getString("fname"));
				 newSheetall.setSname(rs.getString("sname"));
				 newSheetall.setSstyle(rs.getString("sstyle"));
				 newSheetall.setSno(rs.getInt("sno"));
				 newSheetall.setUser(theuserall);
				 newSheetall.setAudio(audioall);
				 sheetListall.add(newSheetall);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sheetListall;
	}
	public List<Audio> showAudioAll(){
		List<Audio> audioListnall = new ArrayList<Audio>();
		Audio nowAudio = null;
		String sql = "select audioid,audioname,audioplayer,audioadd,audiostyle,audioplayer,lrc,pic from audios order by audioid DESC limit 10";
		conn = JDBCUtil.getConnection();
		try{
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				nowAudio = new Audio();
				nowAudio.setAid(rs.getInt("audioid"));
				nowAudio.setAname(rs.getString("audioname"));
				nowAudio.setAudioplayer(rs.getString("audioplayer"));
				nowAudio.setAadd(rs.getString("audioadd"));
				nowAudio.setAstyle(rs.getString("audiostyle"));
				nowAudio.setAudioplayer(rs.getString("audioplayer"));
				nowAudio.setLrc(rs.getString("lrc"));
				nowAudio.setPic(rs.getString("pic"));
				
				audioListnall.add(nowAudio);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return audioListnall;
	}

}
