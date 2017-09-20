package com.mymusic.model;

public class Audio {
/*	id
	名称
	地址路径
	风格
	上传人
	演唱者
	歌词
	图片
*/
	private int aid;
	private String aname;
	private String aadd;
	private String astyle;
	private String afrom;
	private String audioplayer;
	private String lrc;
	private String pic;
	public int snno;
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getAadd() {
		return aadd;
	}
	public void setAadd(String aadd) {
		this.aadd = aadd;
	}
	public String getAstyle() {
		return astyle;
	}
	public void setAstyle(String astyle) {
		this.astyle = astyle;
	}
	public String getAfrom() {
		return afrom;
	}
	public void setAfrom(String afrom) {
		this.afrom = afrom;
	}
	public String getAudioplayer() {
		return audioplayer;
	}
	public void setAudioplayer(String audioplayer) {
		this.audioplayer = audioplayer;
	}
	public int getSnno() {
		return snno;
	}
	public void setSnno(int snno) {
		this.snno = snno;
	}
	public String getLrc() {
		return lrc;
	}
	public void setLrc(String lrc) {
		this.lrc = lrc;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}

}
