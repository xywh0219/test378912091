package com.mymusic.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.mymusic.dao.SheetDao;
import com.mymusic.model.Audio;
import com.mymusic.model.Sheet;
import com.mymusic.model.User;
import com.mymusic.util.JDBCUtil;

public class SheetDaoImpl implements SheetDao {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	/* 保存 */
	public int saveSheet(Sheet sheet) {
		// TODO Auto-generated method stub
		int count = 0;
		String sql = "insert into sheets(uid,aid,sno,sname,sstyle) values(?,?,?,?,?)";
		conn = JDBCUtil.getConnection();
		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sheet.getUser().getUid());
			pstmt.setInt(2, sheet.getAudio().getAid());
			pstmt.setInt(3, sheet.getSno());
			pstmt.setString(4, sheet.getSname());
			pstmt.setString(5, sheet.getSstyle());
			 
			count = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return count;
	}
/* 显示 */
	public List<Sheet> showSheetAll() {
		// TODO Auto-generated method stub
		List<Sheet> sheetList = new ArrayList<Sheet>();
		Sheet newSheet = null;
		String sql = "select sid, uid, aid, sname, sstyle, sno  from sheets";
		// conn
		conn = JDBCUtil.getConnection();
		// create pstmt
		try {
			pstmt = conn.prepareStatement(sql);
			// set ?
   
			rs = pstmt.executeQuery();
			// rs
			while (rs.next()) {
				 newSheet = new Sheet();
				 User user = new User();
				 Audio audio = new Audio();
				 newSheet.setSid(rs.getInt("sid"));
				 user.setUid(rs.getInt("uid"));
				 audio.setAid(rs.getInt("aid"));
				 newSheet.setSname(rs.getString("sname"));
				 newSheet.setSstyle(rs.getString("sstyle"));
				 newSheet.setSno(rs.getInt("sno"));
				 newSheet.setUser(user);
				 newSheet.setAudio(audio);
				 sheetList.add(newSheet);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// return
		return sheetList;
	}
	/* 删除 */
	public int removeSheet(Sheet sheet){
		int count = 0;
		String sql = "delete from sheets where sid= ?";
		conn = JDBCUtil.getConnection();
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sheet.getSid());
			
			count = pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return count;
	}	
	
	/* 更改 */
	public int updateSheet(Sheet sheet){
		int count = 0;
		String sql = "update sheets set sname=?,sstyle=?,aid=? where sno=?";
		conn = JDBCUtil.getConnection();
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sheet.getSname());
			pstmt.setString(2, sheet.getSstyle());
			pstmt.setInt(3, sheet.getAudio().getAid());
			pstmt.setInt(4, sheet.getSno());
			
			count = pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return count;
	}
/* 打开歌单 */
	public List<Sheet> openSheet(Sheet sheet){
		List<Sheet> sheetList = new ArrayList<Sheet>();
		Sheet newSheet = null;
		String sql = "select * from sheets,audios where sheets.sno = ? and audios.audioid =sheets.aid";
		conn = JDBCUtil.getConnection();
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sheet.getSno());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				newSheet = new Sheet();
				User user = new User();
				Audio audio = new Audio();
				newSheet.setSid(rs.getInt("sid"));
				user.setUid(rs.getInt("uid"));
				audio.setAid(rs.getInt("aid"));
				audio.setAname(rs.getString("audioname"));
				audio.setAudioplayer(rs.getString("audioplayer"));
				newSheet.setSname(rs.getString("sname"));
				newSheet.setSstyle(rs.getString("sstyle"));
				newSheet.setSno(rs.getInt("sno"));
				newSheet.setFname(rs.getString("fname"));
				newSheet.setUname(rs.getString("uname"));
				newSheet.setUser(user);
				newSheet.setAudio(audio);
				sheetList.add(newSheet);
				
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return sheetList;
	}
	/* 歌单播放 */
	public List<Audio> searchSheet(Sheet sheet){
		List<Audio> audioListn = new ArrayList<Audio>();
		Audio nowAudio = null;
		String sql = "select audioname,audioplayer,audioadd,audiostyle,lrc,pic from audios,sheets where sheets.sno =? and audios.audioid=sheets.aid";
		conn = JDBCUtil.getConnection();
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sheet.getSno());
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				nowAudio = new Audio();
				nowAudio.setAname(rs.getString("audioname"));
				nowAudio.setAudioplayer(rs.getString("audioplayer"));
				nowAudio.setAadd(rs.getString("audioadd"));
				nowAudio.setAstyle(rs.getString("audiostyle"));
				nowAudio.setLrc(rs.getString("lrc"));
				nowAudio.setPic(rs.getString("pic"));
				
				audioListn.add(nowAudio);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return audioListn;
	}
}
