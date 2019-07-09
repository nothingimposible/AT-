package service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import dao.CommitDao;
import pojo.CommitText;
import pojo.Vote;

public class CommitService {
	@Autowired
	private CommitDao commitDao;
	   public int insertcommit(CommitText ct) {
		return commitDao.insertcommit(ct);
	}
	   public ArrayList<CommitText> selectByVote(Vote vote) {
		return commitDao.selectByVote(vote);
	}
	   public int selectNumber(Vote vote){
		   return commitDao.selectNumber(vote);
	   }
}
