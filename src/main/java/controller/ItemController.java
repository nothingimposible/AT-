package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.CommitDao;
import dao.ItemDao;
import dao.OptionsDao;
import dao.VoteDao;
import pojo.CommitText;
import pojo.Item;
import pojo.Options;
import pojo.User;
import pojo.UserWithOptions;
import pojo.Vote;

@Controller
@RequestMapping("/item")
public class ItemController {
    @Autowired
    private OptionsDao optionsDao;
    @Autowired
    private VoteDao voteDao;
    @Autowired
    private ItemDao itemDao;
    @Autowired
    private CommitDao commitDao;

@RequestMapping(value="/additem")
public String additem(HttpServletRequest request,HttpSession session){
	
	String[] value=request.getParameterValues("single");
	for(int i=0;i<value.length;i++)
	value[i]=value[i].substring(0, value[i].length()-1);
	System.out.println("前");
	int voteid=Integer.parseInt(request.getParameter("voteId"));
	System.out.println(voteid);
	Vote vote=voteDao.searchById(voteid);
	ArrayList<Options> options=optionsDao.selectOptions(vote);
	ArrayList<Integer> num=new ArrayList<Integer>();
	User user=(User) session.getAttribute("useronline");
	for(int i=0;i<value.length;i++){
		System.out.println(value[i]);
		Item item=new Item();
		item.setVS_ID(vote.getVS_ID());
		if(user==null)
			item.setVU_USER_ID(null);
		else
		item.setVU_USER_ID(user.getVU_USER_ID());
		item.setVO_ID(options.get(Integer.parseInt(value[i])-1).getVO_ID());
		itemDao.insertItem(item);
	}
	for(int i=0;i<options.size();i++){
		int number=itemDao.selectnumber(options.get(i));
		num.add(number);
	}
	ArrayList<CommitText> ct=commitDao.selectByVote(vote);
	request.setAttribute("user", user);
	request.setAttribute("ct", ct);
	request.setAttribute("options", options);
	request.setAttribute("num", num);
	request.setAttribute("vote", vote);
	return "voteview";
}

@RequestMapping(value="/result")
public String result(HttpServletRequest request,HttpSession session){
	int voteid=Integer.parseInt(request.getParameter("subjectid"));
	Vote vote=voteDao.searchById(voteid);
	ArrayList<Options> options=optionsDao.selectOptions(vote);
	ArrayList<Integer> num=new ArrayList<Integer>();
	ArrayList<Integer> flag=new ArrayList<Integer>();
	User user=(User) session.getAttribute("useronline");
	UserWithOptions uwp=new UserWithOptions();
	if(user!=null)
	uwp.setVU_USER_ID(user.getVU_USER_ID());
	else
	uwp.setVU_USER_ID("");
	for(int i=0;i<options.size();i++){
		int number=itemDao.selectnumber(options.get(i));
		System.out.println("投票数："+number);
		uwp.setVO_ID(options.get(i).getVO_ID());
		flag.add(itemDao.getflag(uwp));
		num.add(number);
	}
	ArrayList<CommitText> ct=commitDao.selectByVote(vote);
	request.setAttribute("user", user);
	request.setAttribute("ct", ct);
	request.setAttribute("flag", flag);
	request.setAttribute("options", options);
	request.setAttribute("num", num);
	request.setAttribute("vote", vote);
	return "voteview";
}
}
