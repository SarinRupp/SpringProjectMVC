package sarin.app.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	
	@RequestMapping(value={"/","/home"},method= RequestMethod.GET)
	public String homePage(ModelMap m){
		m.addAttribute("msg","Home Page"+getPrincipal());
		return "home";		
	}
	@RequestMapping(value={"/about"},method= RequestMethod.GET)
	public String aboutPage(ModelMap m){
		m.addAttribute("msg","ABOUT Page"+getPrincipal());
		return "about";		
	}
	@RequestMapping(value={"/user"},method= RequestMethod.GET)
	public String userPage(ModelMap m){
		m.addAttribute("me","USER Page");
		return "user/user";		
	}
	@RequestMapping(value={"/admin"},method= RequestMethod.GET)
	public String adminPage(ModelMap m){
		m.addAttribute("msg","ADMIN Page"+getPrincipal());
		return "admin/admin";		
	}
	@RequestMapping(value={"/accessdeniced"},method= RequestMethod.GET)
	public String accessdenicedPage(ModelMap m){
		m.addAttribute("msg","accessdeniced"+getPrincipal());
		return "accessdeniced";		
	}
	@RequestMapping(value={"/dba"},method= RequestMethod.GET)
	public String dbaPage(ModelMap m){
		m.addAttribute("msg","DBA Page"+getPrincipal());
		return "dba/dba";		
	}
	@RequestMapping(value={"/logout"},method= RequestMethod.GET)
	public String logoutPage(HttpServletRequest request,HttpServletResponse response){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if(auth !=null){
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/home";		
		/*return "login";*/
	}
	@RequestMapping(value={"/login"},method= RequestMethod.GET)
	public String loginPage(){
		
		return "login";		
	}
	public String getPrincipal(){
		String username =null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(principal instanceof UserDetails){
			username = ((UserDetails) principal).getUsername();
		}
		else{
			username = principal.toString();
		}
		return username;
	}
	@RequestMapping(value="/login", params="errorLogin")
	public String directToLoginPageWithError(ModelMap model){
	 // Adding an attribute to flag that an error happened at login
	 model.addAttribute("loginFailed", true);
	 
	 return "login";
	}
}
