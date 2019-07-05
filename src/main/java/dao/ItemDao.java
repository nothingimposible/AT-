package dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import pojo.Item;
import pojo.Options;
import pojo.UserWithOptions;
import pojo.UserWithVote;
import pojo.Vote;

@Repository("itemDao")
@Mapper
public interface ItemDao {
  public int insertItem(Item item);
  public int isEmpty(UserWithVote userwithvote);
  public int selectnumber(Options option);
  public int getflag(UserWithOptions userwithoptions);
  public int selectvotenumber(Vote vote);
  public int deleteByOptions(Options options);
  public int deleteByVote(Vote vote);
}
