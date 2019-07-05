package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
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
import pojo.UserWithVote;
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
    	User user=(User) session.getAttribute("useronline");
    	int id=0;
    	System.out.println("前");
    	vote.setVU_USER_ID(user.getVU_USER_ID());
      	int j1 = voteDao.insertVote(vote);
      	System.out.println("添加："+j1);
      	System.out.println(user.toString());
      	vote1=voteDao.searchOne();
      	id=vote1.getVS_ID();
        System.out.println("voteid="+vote1.getVS_ID());
    	OptionsVo opv=vo;
    	ArrayList<Options> op=(ArrayList<Options>) opv.getLis();
    	for(int i=0;i<op.size();i++){
    		op.get(i).setVS_ID(id);
    		Options options=op.get(i);
    		System.out.println(options.toString());
    		optionsDao.insertOptions(options);
    		
    	}
    	System.out.println("后");
    	return "login";
    }
    
    @RequestMapping(value="/searchvote")
    public String searchadd(@ModelAttribute Model model){
		return "main";
    }
    
    @RequestMapping(value="/votelist")
    public String votelist(HttpServletRequest request,HttpSession session){
    	System.out.println("前");
    	ArrayList<SubjectList> list=new ArrayList<SubjectList>();
    	ArrayList<Vote> vote=voteDao.searchAll();
    	ArrayList<Integer> flag=new ArrayList<Integer>();
    	User user=(User) session.getAttribute("useronline");
    	System.out.println(vote.size());
    	for(int i=0;i<vote.size();i++){
    		SubjectList sl=new SubjectList();
    		UserWithVote uwv=new UserWithVote();
    		System.out.println("id前");
    		if(user==null)
    		uwv.setVU_USER_ID(null);
    		else
    		uwv.setVU_USER_ID(user.getVU_USER_ID());	
    		System.out.println("id后");
    		uwv.setVS_ID(vote.get(i).getVS_ID());
    		User us=voteDao.selectUser(vote.get(i));
    		ArrayList<Options> opts= optionsDao.selectOptions(vote.get(i));
    		sl.setOptions(opts);
    		sl.setUser(us);
    		sl.setVote(vote.get(i));
    		
    		flag.add(itemDao.isEmpty(uwv));
    		list.add(sl);
    	}
    	System.out.println("list="+list.size());
    	int u;
    	for( u=0;u<list.size();u++){
    		System.out.println("qwe");
    		System.out.println(list.get(u).toString());
    	}
    	System.out.println("后");
    	request.setAttribute("flag", flag);
    	request.setAttribute("votelist", list);
		return "main";
    }
    
    @RequestMapping(value="/vote")
    public String vote(HttpServletRequest request){
    	String stringid=request.getParameter("subjectid");
    	int id=Integer.parseInt(stringid);
    	Vote vote=voteDao.searchById(id);
    	ArrayList<Options> option=optionsDao.selectOptions(vote);
    	System.out.println(vote.toString());
    	for(Options e:option)
    		System.out.println(e.toString());
    	request.setAttribute("option", option);
    	request.setAttribute("vote", vote);
    	return "vote";
    }
    
    @RequestMapping(value="/changevote")
    public String changevote(HttpServletRequest request){
    	String svoteid=request.getParameter("subjectid");
    	Vote vote=voteDao.searchById(Integer.parseInt(svoteid));
    	ArrayList<Options> options=optionsDao.selectOptions(vote);
    	
    	request.setAttribute("vote", vote);
    	request.setAttribute("options", options);
		return "changevote";
    	
    }
    
    @RequestMapping(value="/savechange")
    public String savechange(@ModelAttribute Vote vot,OptionsVo vo,HttpSession session,HttpServletRequest request){
    	Vote vote=vot;
        int voteid=Integer.parseInt(request.getParameter("subjectid"));
        System.out.println("voteid="+voteid);
        vote.setVS_ID(voteid);
    	User user=(User) session.getAttribute("useronline");
    	vote.setVU_USER_ID(user.getVU_USER_ID());
    	ArrayList<Options> options=optionsDao.selectOptions(vote);
    	System.out.println(vote.toString());
        voteDao.updateVote(vote);
    	OptionsVo opv=vo;
    	ArrayList<Options> op=(ArrayList<Options>) opv.getLis();
    	for(int i=0;i<op.size();i++){
    		System.out.println(op.get(i).getVO_TITLE());
    		if(i<options.size()){
    			if(options.get(i).getVO_TITLE()==null){
    				itemDao.deleteByOptions(options.get(i));
    				optionsDao.deleteById(options.get(i));
    			}else{
    				op.get(i).setVO_ID(options.get(i).getVO_ID());
        		    optionsDao.update(op.get(i));
    			}
    			
    		}else{
    			op.get(i).setVS_ID(voteid);
        		Options option=op.get(i);
    			optionsDao.insertOptions(option);
    		}
    	}
        if(op.size()<options.size()){
        	for(int i=op.size();i<options.size();i++){
        		optionsDao.deleteById(options.get(i));
        	}
        }
    	return "forward:/vote/maintainvote";
    }
    
    @RequestMapping(value="/maintainvote")
    public String maintainvote(HttpSession session,HttpServletRequest request){
    	User user = (User) session.getAttribute("useronline");
       ArrayList<Vote> vote=voteDao.searchByUser(user);
       ArrayList<Integer> votenum=new ArrayList<Integer>();
       for(int i=0;i<vote.size();i++){
    	  votenum.add( itemDao.selectvotenumber(vote.get(i)));
       }
      request.setAttribute("vote", vote);
      request.setAttribute("votenum", votenum);
      request.setAttribute("user", user);
    	return "maintainvote";
    }
    
    @RequestMapping(value="/deletevote")
    public String deletevote(HttpServletRequest request){
    	int voteid=Integer.parseInt(request.getParameter("subjectid"));
    	Vote vote=voteDao.searchById(voteid);
        itemDao.deleteByVote(vote);
        optionsDao.deleteByVote(vote);
        voteDao.deleteVote(vote);
    	return "forward:/vote/maintainvote";
    }
    
}
