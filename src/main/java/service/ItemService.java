package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.ItemDao;
import pojo.Item;
import pojo.Vote;
@Service("itemService")
@Transactional
public class ItemService {
	@Autowired
	private ItemDao itemDao;
	 public int insertItem(Item item) {
		return itemDao.insertItem(item);
	}
	  public int isEmpty(Vote vote){
		  return itemDao.hashCode();
	  }
}
