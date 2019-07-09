package dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import pojo.CommitText;
import pojo.Vote;

@Repository("commitDao")
@Mapper
public interface CommitDao {
   public int insertcommit(CommitText ct);
   public ArrayList<CommitText> selectByVote(Vote vote);
   public int selectNumber(Vote vote);
}
