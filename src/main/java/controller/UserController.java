package controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.UserDao;
import pojo.User;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserDao userDao;

	@RequestMapping(value="/add")
	public String useradd(){
		
		return "register";
		
	}
	@RequestMapping(value="/logout")
	public String logout(HttpSession session,HttpServletRequest request,HttpServletResponse response) throws IOException{
		session.invalidate();
		return "forward:/vote/votelist";
	}
	@RequestMapping(value="/adduser")
	public String useradduser(@ModelAttribute User username){
        User us=username;
        us.setVU_STATUS(1);
        us.setVU_VERSION(123);
       System.out.println(us.toString());
        userDao.insertUser(us);
		return "forward:/vote/votelist";
		
	}
	@RequestMapping(value="/login")
	public String login(){
		return "login";
	}
	@RequestMapping(value="/loginjudge")
	public String userlogin(@ModelAttribute User username,Model model,HttpSession session,HttpServletRequest request,HttpServletResponse response) throws IOException{
		User us=username;
		
		us.setVU_USER_NAME(userDao.searchName(us));
		System.out.println(us.toString());
		System.out.println(userDao.searchUser(us));
	    model.addAttribute("username", us.getVU_USER_NAME());
		if(userDao.searchUser(us)>0){
			session.setAttribute("useronline", us);
			session.setMaxInactiveInterval(60*60*24*7);
			return "forward:/vote/votelist";
			
		}
        
		System.out.println("login");
		return "login";
	}
}
