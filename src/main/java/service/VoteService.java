package service;

import java.util.ArrayList;
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
	  
	  public Vote searchOne(){
		  return voteDao.searchOne();
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
	  public int selectNumber(){
		  return voteDao.selectNumber();
	  }
	  public Vote searchById(int v){
		  return voteDao.searchById(v);
	  }
	  public ArrayList<Vote> searchByUser(User user){
		  return voteDao.searchByUser(user);
	  }
	  public int updateVote(Vote vote){
		  return voteDao.updateVote(vote);
	  }
	  public int deleteVote(Vote vote){
		  return voteDao.deleteVote(vote);
	  }
	  
}
