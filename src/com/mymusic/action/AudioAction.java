package com.mymusic.action;

import java.util.List;

import com.mymusic.dao.AudioDao;
import com.mymusic.model.Audio;
import com.opensymphony.xwork2.ActionSupport;

public class AudioAction extends ActionSupport {
	public Audio audio;
	public Audio getAudio() {
		return audio;
	}

	public void setAudio(Audio audio) {
		this.audio = audio;
	}
	AudioDao audioDao = null;
	public List<Audio> lista = null;
	public List<Audio> listn = null;

	public List<Audio> getLista() {
		return lista;
	}

	public void setLista(List<Audio> lista) {
		this.lista = lista;
	}

	public List<Audio> getListn() {
		return listn;
	}

	public void setListn(List<Audio> listn) {
		this.listn = listn;
	}

	public AudioDao getAudioDao() {
		return audioDao;
	}

	public void setAudioDao(AudioDao audioDao) {
		this.audioDao = audioDao;
	}
	public String nowadd;
	public String getNowadd() {
		return nowadd;
	}

	public void setNowadd(String nowadd) {
		this.nowadd = nowadd;
	}

/* 存歌 */
public String saveAudio(){
	int count = audioDao.saveAudio(audio);
	if(count>0){
		lista = audioDao.showAudioAll();
		return "success";
	}else{
		return "fail";
	}
}
/* 删歌 */
public String removeAudio(){
	int count = audioDao.removeAudio(audio);
	if(count>0){
		lista = audioDao.showAudioAll();
		return "success";
	}else{
		return "fail";
	}
}
/* 改歌 */
public String updateAudio(){
	int count = audioDao.updateAudio(audio);
	if(count>0){
		lista = audioDao.showAudioAll();
		return "success";
	}else{
		return "fail";
	}
}
/* 查歌 */
public String searchAudioAll(){
	lista = audioDao.showAudioAll();
	return "success";
}
/* 播放  */
public String playAudio(){
	listn = audioDao.searchAudio(audio);
	return "play";
}


/* 单查 */

}
