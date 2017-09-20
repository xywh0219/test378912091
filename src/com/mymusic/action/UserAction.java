package com.mymusic.action;

import java.util.List;

import com.mymusic.dao.UserDao;
import com.mymusic.model.Audio;
import com.mymusic.model.Sheet;
import com.mymusic.model.User;
import com.mymusic.dao.SheetDao;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport {
	public User user;
	UserDao userDao = null;
	SheetDao sheetDao = null;
	public List<User> listu = null;
	public List<Sheet> lists = null;
	public List<Sheet> listsall = null;
	public List<Audio> listall = null;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<User> getListu() {
		return listu;
	}

	public void setListu(List<User> listu) {
		this.listu = listu;
	}

	public List<Sheet> getLists() {
		return lists;
	}

	public void setLists(List<Sheet> lists) {
		this.lists = lists;
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	public SheetDao getSheetDao() {
		return sheetDao;
	}

	public void setSheetDao(SheetDao sheetDao) {
		this.sheetDao = sheetDao;
	}

public List<Audio> getListall() {
		return listall;
	}

	public void setListall(List<Audio> listall) {
		this.listall = listall;
	}

public List<Sheet> getListsall() {
		return listsall;
	}

	public void setListsall(List<Sheet> listsall) {
		this.listsall = listsall;
	}

/* 存用户*/
public String saveUser(){
	int count= userDao.saveUser(user);
	 if(count>0){
		 listu = userDao.showUserAll();
		 return "success";
	 }else{
		 return "fail";
	 }
  }
/* 删用户 */
public String removeUser(){
	userDao.removeUser(user);
	listu = userDao.showUserAll();
	return "success";
	
}
/* 改用户 */
public String updateUser(){
	userDao.updateUser(user);
	listu = userDao.showUserAll();
	return "success";
}
/* 查询所有用户 */ 
public String searchUser(){
	listu = userDao.showUserAll();
	return "success";
}
/* 登录 */
public String loginUser(){	
	listu = userDao.loginUser(user);
	if(!listu.isEmpty()){
		if(user.getUname().equals("admin")){
			return "adminown";
		}else{
			lists = userDao.showSheet(user);
			listall = userDao.showAudioAll();
			listsall = userDao.showSheetAll();
			return "userown";
		}
	}else{
		return "fail";
	}
}

public String mySheet(){
	listu = userDao.loginUser(user);
	lists = userDao.showSheet(user);
	return "userown";
	
}
}