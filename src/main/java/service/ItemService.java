package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.ItemDao;
import pojo.Item;
import pojo.Options;
import pojo.UserWithOptions;
import pojo.UserWithVote;
import pojo.Vote;
@Service("itemService")
@Transactional
public class ItemService {
	@Autowired
	private ItemDao itemDao;
	 public int insertItem(Item item) {
		return itemDao.insertItem(item);
	}
	  public int isEmpty(UserWithVote userwithvote){
		  return itemDao.isEmpty(userwithvote);
	  }
	  public int selectnumber(Options option){
		  return itemDao.selectnumber(option);
	  }
	  public int getflag(UserWithOptions userwithoptions){
		  return itemDao.getflag(userwithoptions);
	  }
	  public int selectvotenumber(Vote vote){
		  return itemDao.selectvotenumber(vote);
	  }
	  public int deleteByOptions(Options options){
		  return itemDao.deleteByOptions(options);
	  }
	  public int deleteByVote(Vote vote){
		  return itemDao.deleteByVote(vote);
	  }
}
