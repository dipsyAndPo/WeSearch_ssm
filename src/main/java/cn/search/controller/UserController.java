package cn.search.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.search.pojo.UserInfo;
import cn.search.service.UserService;

@Controller
@RequestMapping("")
public class UserController{
	
	@Autowired
	private UserService us;
	
	@Autowired
	private HttpServletRequest request;

	
	@ResponseBody
	@RequestMapping(value="loginAjax")  
	public String loginAjax(UserInfo userInfo,HttpServletRequest request) {
		userInfo=us.Login(userInfo);
		if(userInfo!=null) {
			request.getSession().setAttribute("userId", userInfo.getUserId());
			return userInfo.getUserId()+"";
		}else {
			return "error";
		}
		
	}
	
	
	@RequestMapping("login")
	public ModelAndView login(UserInfo userInfo) {
		
		ModelAndView mav=new ModelAndView();
		userInfo=us.Login(userInfo);
		boolean login=null==userInfo?false:true;
		//判断是否是管理员登录
		if (login&&userInfo.getUserId()==0) {
			mav.setViewName("redirect:/urlSort_list");
		}else {
			mav.setViewName("error");
		}
		return mav;
			
	}
	
	@RequestMapping("register")
	public ModelAndView register() {
		ModelAndView mav=new ModelAndView();
		return mav;
	}
	
	
	
	
	
	@RequestMapping("toPage")
	public ModelAndView toPage(String url) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName(url);
		return mav;
			
	}
	
}
