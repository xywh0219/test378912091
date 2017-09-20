package com.mymusic.action;

import java.util.List;

import com.mymusic.dao.SheetDao;
import com.mymusic.model.Audio;
import com.mymusic.model.Sheet;
import com.opensymphony.xwork2.ActionSupport;

public class SheetAction extends ActionSupport {
	public Sheet sheet;

	public Sheet getSheet() {
		return sheet;
	}

	public void setSheet(Sheet sheet) {
		this.sheet = sheet;
	}
	SheetDao sheetDao = null;
	public List<Sheet> lists = null;
	public List<Audio> listn = null;

	public SheetDao getSheetDao() {
		return sheetDao;
	}

	public void setSheetDao(SheetDao sheetDao) {
		this.sheetDao = sheetDao;
	}

	public List<Sheet> getLists() {
		return lists;
	}

	public void setLists(List<Sheet> lists) {
		this.lists = lists;
	}
	public List<Audio> getListn() {
		return listn;
	}

	public void setListn(List<Audio> listn) {
		this.listn = listn;
	}

/* 保存 */
public String saveSheet(){
	int count = sheetDao.saveSheet(sheet);
	if(count>0){
		lists = sheetDao.showSheetAll();
		return "success";
	}else{
		return "fail";
	}
}
/* 删除 */
public String removeSheet(){
	int count = sheetDao.removeSheet(sheet);
	if(count>0){
		lists = sheetDao.showSheetAll();
		return "success";
	}else{
		return "fail";
	}
}

/* 更改*/
public String updateSheet(){
	int count = sheetDao.updateSheet(sheet);
	if(count>0){
		lists = sheetDao.showSheetAll();
		return "success";
	}else{
		return "fail";
	}
}
/* 查询歌单 */
public String searchSheet(){
	lists = sheetDao.showSheetAll();
	return "success";
}
/* 打开歌单 */
public String openSheet(){
	lists = sheetDao.openSheet(sheet);
	if(!lists.isEmpty()){
		return "play";
	}else{
		return "fail";
	}
}
/* 播放全部 */
public String playAudioAll(){
	listn = sheetDao.searchSheet(sheet);
	return "playsheet";
}
}
