package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import pojo.User;
import pojo.Vote;

@Repository("voteDao")
@Mapper
public interface VoteDao {
  public int insertVote(Vote vote);
  public ArrayList<Vote> searchAll();
  public Vote searchOne(Vote vote);
  public ArrayList<Vote> searchName(Vote vote);
  public int selectId();
  public User selectUser(Vote vote);
  public int selectNumber();
  public Vote searchById(int v);
}
