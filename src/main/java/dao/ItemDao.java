package dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import pojo.Item;

@Repository("itemDao")
@Mapper
public interface ItemDao {
  public int insertItem(Item item);
 
}
