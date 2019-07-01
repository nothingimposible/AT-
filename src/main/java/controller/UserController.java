package controller;

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
	@RequestMapping(value="/adduser")
	public String useradduser(@ModelAttribute User username){
        User us=username;
        us.setVU_STATUS(1);
        us.setVU_VERSION(123);
       System.out.println(us.toString());
        userDao.insertUser(us);
		return "login";
		
	}
	@RequestMapping(value="/login")
	public String login(){
		return "login";
	}
	@RequestMapping(value="/loginjudge")
	public String userlogin(@ModelAttribute User username,Model model,HttpSession session){
		User us=username;
		
		us.setVU_USER_NAME(userDao.searchName(us));
		System.out.println(us.toString());
		System.out.println(userDao.searchUser(us));
	    model.addAttribute("username", us.getVU_USER_NAME());
		if(userDao.searchUser(us)>0){
			session.setAttribute("useronline", us);
			return "main";
		}
        
		System.out.println("login");
		return "login";
	}
}
