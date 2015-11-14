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

@Controller
public class MainController {
	
	@RequestMapping(value={"/","/home"})
	public String homePage(ModelMap m){
		m.addAttribute("msg","Home Page"+getPrincipal());
		return "home";		
	}
	@RequestMapping(value={"/about"})
	public String aboutPage(ModelMap m){
		m.addAttribute("msg","ABOUT Page"+getPrincipal());
		return "about";		
	}
	@RequestMapping(value={"/user"})
	public String userPage(ModelMap m){
		m.addAttribute("msg","USER Page");
		return "user";		
	}
	@RequestMapping(value={"/admin"})
	public String adminPage(ModelMap m){
		m.addAttribute("msg","ADMIN Page"+getPrincipal());
		return "admin";		
	}
	@RequestMapping(value={"/accessdeniced"})
	public String accessdenicedPage(ModelMap m){
		m.addAttribute("msg","accessdeniced"+getPrincipal());
		return "accessdeniced";		
	}
	@RequestMapping(value={"/dba"})
	public String dbaPage(ModelMap m){
		m.addAttribute("msg","DBA Page"+getPrincipal());
		return "dba";		
	}
	@RequestMapping(value={"/logout"})
	public String logoutPage(HttpServletRequest request,HttpServletResponse response){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if(auth !=null){
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		/*return "redirect:/home";*/		
		return "login";
	}
	@RequestMapping(value={"/login"})
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
}
