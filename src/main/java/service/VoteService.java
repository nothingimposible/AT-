package service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.VoteDao;
import pojo.User;
import pojo.Vote;

@Service("voteService")
@Transactional
public class VoteService {
	  @Autowired
	  private VoteDao voteDao;
	  public int insertVote(Vote vote){
		  return voteDao.insertVote(vote);
	  }
	  
	  public ArrayList<Vote> searchAll(){
		  return voteDao.searchAll();
	  }
	  
	  public Vote searchOne(Vote vote){
		  return voteDao.searchOne(vote);
	  }
	  
	  public ArrayList<Vote> searchName(Vote vote){
		  return voteDao.searchName(vote);
	  }
	  
	  public int selectId(){
		  return voteDao.selectId();
	  }
	  public User selectUser(Vote vote){
		  return voteDao.selectUser(vote);
	  }
}
