package dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import pojo.Item;
import pojo.Options;
import pojo.Vote;

@Repository("itemDao")
@Mapper
public interface ItemDao {
  public int insertItem(Item item);
  public int isEmpty(Vote vote);
  public int selectnumber(Options option);
}
