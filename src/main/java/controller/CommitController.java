package controller;

import java.io.IOException;
import java.util.Date; 
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.CommitDao;
import net.sf.json.JSONObject;
import pojo.CommitText;
import pojo.User;

@Controller
public class CommitController {
     @Autowired
     private CommitDao commitDao;
     @ResponseBody
     @RequestMapping(value="/addcommit")
     public void addcommit(String committext,String idtext,HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException{
    	 String stext=committext;
    	 int vs_id=Integer.parseInt(idtext);
    	 User user=(User) session.getAttribute("useronline");
    	 SimpleDateFormat sdf=new SimpleDateFormat("yyyy年MM月dd日 HH:mm");
         
    	 String str=sdf.format(new Date());

    	System.out.println("当前时间是："+str);
    	System.out.println("时间长度="+str.length());
    	CommitText ct=new CommitText();
    	ct.setVC_COMMIT(stext);
    	ct.setVC_TIME(str);
    	ct.setVU_USER_NAME(user.getVU_USER_NAME());
    	ct.setVS_ID(vs_id);
    	commitDao.insertcommit(ct);
    	System.out.println(ct.toString());
    	JSONObject jb=new JSONObject().fromObject(ct);
        System.out.println(jb.toString());
    	  response.getWriter().write(jb.toString());
    	  
     }
}
