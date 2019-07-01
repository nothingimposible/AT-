package dao;


import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import pojo.User;

@Repository("userDao")
@Mapper
public interface UserDao {
  public int insertUser(User user);
  public int searchUser(User user);
  public String searchName(User user);
}
