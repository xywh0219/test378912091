package com.mymusic.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.mymusic.dao.AudioDao;
import com.mymusic.model.Audio;
import com.mymusic.model.Sheet;
import com.mymusic.util.JDBCUtil;


public class AudioDaoImpl implements AudioDao {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	
	/* 插入信息 */
	public int saveAudio(Audio audio) {
		// TODO Auto-generated method stub
		int count = 0;
		String sql = "insert into audios(audioid,audioname,audioadd,audiostyle,audiofrom,audioplayer,lrc,pic) values(?,?,?,?,?,?,?,?)";
		conn = JDBCUtil.getConnection();
		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, audio.getAid());
			pstmt.setString(2, audio.getAname());
			pstmt.setString(3, audio.getAadd());
			pstmt.setString(4, audio.getAstyle());
			pstmt.setString(5, audio.getAfrom());
			pstmt.setString(6, audio.getAudioplayer());
			pstmt.setString(7, audio.getLrc());
			pstmt.setString(8, audio.getPic());
			 
			count = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return count;
	}
	
	/* 显示信息 */
	public List<Audio> showAudioAll(){
		List<Audio> audioList = new ArrayList<Audio>();
		Audio newAudio = null;
		String sql = "select audioid,audioname,audioadd,audiostyle,audiofrom,audioplayer,lrc,pic  from audios order by audioid desc";
		// conn
		conn = JDBCUtil.getConnection();
		// create pstmt
		try {
			pstmt = conn.prepareStatement(sql);
			// set ?
   
			rs = pstmt.executeQuery();
			// rs
			while (rs.next()) {
				newAudio = new Audio();
				newAudio.setAid(rs.getInt("audioid"));
				newAudio.setAname(rs.getString("audioname"));
				newAudio.setAstyle(rs.getString("audiostyle"));
				newAudio.setAfrom(rs.getString("audiofrom"));
				newAudio.setAudioplayer(rs.getString("audioplayer"));
				newAudio.setLrc(rs.getString("lrc"));
				newAudio.setPic(rs.getString("pic"));
				audioList.add(newAudio);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// return
		return audioList;
	}
	
	/* 删除信息 */
	public int removeAudio(Audio audio){
		int count = 0;
		String sql = "delete from audios where audioid =?";
		conn = JDBCUtil.getConnection();
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,audio.getAid());
			
			count = pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return count;
	}
	
	/* 更新信息 */
	public int updateAudio(Audio audio){
		int count = 0;
		String sql = "update audios set audioname=?,audioadd=?,audiostyle=?,audiofrom=?,audioplayer=?,lrc=?,pic=? where audioid=?";
		conn = JDBCUtil.getConnection();
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, audio.getAname());
			pstmt.setString(2,audio.getAadd());
			pstmt.setString(3, audio.getAstyle());
			pstmt.setString(4, audio.getAfrom());
			pstmt.setInt(5, audio.getAid());
			pstmt.setString(6, audio.getAudioplayer());
			pstmt.setString(7, audio.getLrc());
			pstmt.setString(8, audio.getPic());
			 
			
			count = pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return count;
	}
/* 播放 */
	public int playAudio(Audio audio){
		int count = 1;
		return count;
	}
/* 单查 */
	public List<Audio> searchAudio(Audio audio){
		List<Audio> audioListn = new ArrayList<Audio>();
		Audio nowAudio = null;
		String sql = "select audioname,audioplayer,audioadd,audiostyle,audioplayer,lrc,pic from audios where audioid=?";
		conn = JDBCUtil.getConnection();
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, audio.getAid());
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				nowAudio = new Audio();
				nowAudio.setAname(rs.getString("audioname"));
				nowAudio.setAudioplayer(rs.getString("audioplayer"));
				nowAudio.setAadd(rs.getString("audioadd"));
				nowAudio.setAstyle(rs.getString("audiostyle"));
				nowAudio.setAudioplayer(rs.getString("audioplayer"));
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
