package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.CommitDao;
import dao.ItemDao;
import dao.OptionsDao;
import dao.VoteDao;
import pojo.CommitText;
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
    @Autowired
    private CommitDao commitDao;
    
    public String changetime(String time){
    	String s=time;
    	String s3;
    	s3=s.replace("T", " ");
    	return s3;
    }
  
    public Boolean isBetweenDate(String offDutyTime ,String endOffTime) {
        Date startOffDate = null;
        Date endOffDate = null;
        Date checkOffDate = null; //打开时间
        try {
            startOffDate = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse("1970-01-01 12:00"); //开始时间
            checkOffDate = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(offDutyTime);  //基准时间
            endOffDate = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(endOffTime);//结束时间
        } catch (ParseException e) {
            e.printStackTrace();
        }
        if (checkOffDate.getTime() == startOffDate.getTime() || checkOffDate.getTime() == endOffDate.getTime()) {
            return true;
        }
        Calendar date = Calendar.getInstance();
        date.setTime(checkOffDate);
     
        Calendar begin = Calendar.getInstance();
        begin.setTime(startOffDate);
     
        Calendar end = Calendar.getInstance();
        end.setTime(endOffDate);
     
        if (date.after(begin) && date.before(end)) {
            return true;
        } else {
            return false;
        }
    }
 
    
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
    	String stime=vote.getVS_TIME();
    	vote.setVS_TIME(changetime(stime));
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
    	return "forward:/vote/votelist";
    }
    
    @RequestMapping(value="/search")
    public String searchadd(HttpServletRequest request,HttpSession session){
    	String select=request.getParameter("search");
    	Vote vt=new Vote();
    	vt.setVS_TITLE("%"+select+"%");
    	System.out.println(select);
    	ArrayList<Vote> vote=voteDao.searchByName(vt);
        System.out.println("balaba");
    	ArrayList<SubjectList> list=new ArrayList<SubjectList>();
    	ArrayList<Integer> flag=new ArrayList<Integer>();
    	User user=(User) session.getAttribute("useronline");
    	
    	for(int i=0;i<vote.size();i++){
    		SubjectList sl=new SubjectList();
    		UserWithVote uwv=new UserWithVote();
    		
    		if(user==null)
    		uwv.setVU_USER_ID(null);
    		else
    		uwv.setVU_USER_ID(user.getVU_USER_ID());	
    		
    		uwv.setVS_ID(vote.get(i).getVS_ID());
    		User us=voteDao.selectUser(vote.get(i));
    		ArrayList<Options> opts= optionsDao.selectOptions(vote.get(i));
    		sl.setOptions(opts);
    		sl.setUser(us);
    		sl.setVote(vote.get(i));
    		flag.add(itemDao.isEmpty(uwv));
    		list.add(sl);
    	}
    	
    	request.setAttribute("flag", flag);
    	request.setAttribute("votelist", list);
		return "searchresult";
    }
    
    @RequestMapping(value="/votelist")
    public String votelist(HttpServletRequest request,HttpSession session){
    	String spage=request.getParameter("page");
    	int page=1;
    	if(spage!=null)
    		page=Integer.parseInt(spage);
    	
    	ArrayList<SubjectList> list=new ArrayList<SubjectList>();
    	ArrayList<Vote> vote=voteDao.searchAll((page-1)*10);
    	ArrayList<Integer> flag=new ArrayList<Integer>();
    	User user=(User) session.getAttribute("useronline");
    	 SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
    	   String nowtime=sdf.format(new Date());
    	   
    	for(int i=0;i<vote.size();i++){
    		SubjectList sl=new SubjectList();
    		UserWithVote uwv=new UserWithVote();
    		
    		if(user==null)
    		uwv.setVU_USER_ID(null);
    		else
    		uwv.setVU_USER_ID(user.getVU_USER_ID());	
    		
    		uwv.setVS_ID(vote.get(i).getVS_ID());
    		User us=voteDao.selectUser(vote.get(i));
    		ArrayList<Options> opts= optionsDao.selectOptions(vote.get(i));
    		sl.setOptions(opts);
    		sl.setUser(us);
    		sl.setVote(vote.get(i));
    		if(itemDao.isEmpty(uwv)<1&&isBetweenDate(nowtime,vote.get(i).getVS_TIME()))
    		flag.add(0);
    		else
    		flag.add(1);
    		list.add(sl);
    	}
    	
    	int zpage=voteDao.searchpage();
    	if(zpage%10==0)
    		zpage=zpage/10;
    	else
    		zpage=zpage/10+1;
    	request.setAttribute("flag", flag);
    	request.setAttribute("votelist", list);
    	request.setAttribute("page", page);
    	request.setAttribute("zpage", zpage);
		return "main";
    }
    
    @RequestMapping(value="/vote")
    public String vote(HttpServletRequest request,HttpSession session){
    	String stringid=request.getParameter("subjectid");
    	int id=Integer.parseInt(stringid);
    	Vote vote=voteDao.searchById(id);
    	ArrayList<Options> option=optionsDao.selectOptions(vote);
    	System.out.println(vote.toString());
    	User user=(User) session.getAttribute("useronline");
    	for(Options e:option)
    		System.out.println(e.toString());
    	ArrayList<CommitText> ct=commitDao.selectByVote(vote);
    	request.setAttribute("user", user);
    	request.setAttribute("ct", ct);
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
    	String stime=vote.getVS_TIME();
    	vote.setVS_TIME(changetime(stime));
        int voteid=Integer.parseInt(request.getParameter("subjectid"));
        System.out.println("voteid="+voteid);
        vote.setVS_ID(voteid);
    	User user=(User) session.getAttribute("useronline");
    	vote.setVU_USER_ID(user.getVU_USER_ID());
    	ArrayList<Options> options=optionsDao.selectOptions(vote);  //数据库
    	System.out.println(vote.toString());
        voteDao.updateVote(vote);
    	OptionsVo opv=vo;
    	ArrayList<Options> op=(ArrayList<Options>) opv.getLis();
    	for(int i=0;i<op.size();i++){ //前端获取
    		System.out.println(op.get(i).getVO_TITLE());
    		if(i<options.size()){
    			if(op.get(i).getVO_TITLE()==null){
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
       ArrayList<Integer> commitnum=new ArrayList<Integer>();
       ArrayList<String> time=new ArrayList<String>();
       ArrayList<String> timeflag=new ArrayList<String>();
       SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
  	   String nowtime=sdf.format(new Date());

       for(int i=0;i<vote.size();i++){
    	  votenum.add( itemDao.selectvotenumber(vote.get(i)));
    	  commitnum.add(commitDao.selectNumber(vote.get(i)));
    	  time.add(vote.get(i).getVS_TIME());
    	  if(isBetweenDate(nowtime,vote.get(i).getVS_TIME()))
    		  timeflag.add("进行中");
    	  else
    		  timeflag.add("已截止");
    	  System.out.println(isBetweenDate(nowtime,vote.get(i).getVS_TIME()));
       }
      request.setAttribute("time", time);
      request.setAttribute("timeflag", timeflag);
      request.setAttribute("commitnum", commitnum);
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
