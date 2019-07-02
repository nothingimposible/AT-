package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.ItemDao;

@Controller
@RequestMapping("/item")
public class ItemController {
@Autowired
 private ItemDao itemDao;

@RequestMapping(value="/additem")
public String additem(){
	
	return "voteview";
}

}
