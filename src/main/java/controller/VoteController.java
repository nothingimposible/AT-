package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.ItemDao;
import dao.OptionsDao;
import dao.VoteDao;
import pojo.Item;
import pojo.Options;
import pojo.OptionsVo;
import pojo.SubjectList;
import pojo.User;
import pojo.Vote;

@Controller
@RequestMapping("/vote")
public class VoteController {
    @Autowired
    private OptionsDao optionsDao;
    @Autowired
    private VoteDao voteDao;
    @Autowired
    private ItemDao itemDao;
    @RequestMapping(value="/send")
    public String sendvote(){
    	return "sendvote";
    }
    
    @RequestMapping(value="/addvote")
    public String addvote(@ModelAttribute Vote vot,OptionsVo vo,HttpSession session){
    	Vote vote=vot;
        Vote vote1;
    	int id=voteDao.selectId()+1;
    	System.out.println("前");
      	voteDao.insertVote(vote);
      	User user=(User) session.getAttribute("useronline");
      	System.out.println(user.toString());
        vote1=voteDao.searchOne(vote);
        System.out.println(id);
    	OptionsVo opv=vo;
    	ArrayList<Options> op=(ArrayList<Options>) opv.getLis();
    	for(int i=0;i<op.size();i++){
    		Item item=new Item();
    		op.get(i).setVS_ID(id);
    		Options options=op.get(i);
    		item.setVU_USER_ID(user.getVU_USER_ID());
    		item.setVS_ID(options.getVS_ID());
    		item.setVU_VISION(0);
    		int itemId=optionsDao.selectId()+1;
    		item.setVO_ID(itemId);
    		System.out.println(item.toString());
    		itemDao.insertItem(item);
    		System.out.println(options.toString());
    		optionsDao.insertOptions(options);
    	}
    	System.out.println("后");
    	return "main";
    }
    
    @RequestMapping(value="/seachvote")
    public String searchadd(@ModelAttribute Vote vot,OptionsVo vo,HttpSession session){
		return null;
    }
    
    @RequestMapping(value="/votelist")
    public String votelist(@ModelAttribute Model model,HttpSession session){
    	ArrayList<SubjectList> list=new ArrayList<SubjectList>();
    	ArrayList<Vote> vote=voteDao.searchAll();
    	for(int i=0;i<vote.size();i++){
    		SubjectList sl=new SubjectList();
    		
    		
    		sl.setVote(vote.get(i));
    		
    	}
    	SubjectList subj;
    	
		return "main";
    }
    
}
