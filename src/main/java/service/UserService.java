package service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.UserDao;
import pojo.User;

@Service("userService")
@Transactional
public class UserService {
  @Autowired
  private UserDao userDao;
  public int insertUser(User user){
	  return userDao.insertUser(user);
  }
  
  public int searchUser(User user){
	  return userDao.searchUser(user);
  }
  
  public String searchName(User user){
	  return userDao.searchName(user);
  }
}
