package sarin.app.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import sarin.app.entities.Student;
import sarin.app.services.StudentServices;
import sarin.app.services.implement.StudentServicesImplement;



@Controller
@RequestMapping("/")
public class MainController {
	
	@Autowired
	StudentServices studentImplement; 
	
	@RequestMapping(value={"/" , "/index"}, method = RequestMethod.GET)
	/*public String homePage(ModelMap model) throws SQLException {
		//ModelAndView model=new ModelAndView("index");		
		model.addAttribute("list",studentImplement.list());	
		model.addAttribute("msg","Listing");
		System.out.println(studentImplement.list().size());
		System.out.println("index");
		return "index";
	}*/
	public ModelAndView homePage() throws SQLException {
		ModelAndView model=new ModelAndView("index");		
		model.addObject("list",studentImplement.list());	
		model.addObject("msg","Listing");
		System.out.println(studentImplement.list().size());
		System.out.println("index");
		return model;
	}
	
	@RequestMapping(value={"/add"}, method = RequestMethod.GET)
	public ModelAndView addForm() throws SQLException{			
		ModelAndView model=new ModelAndView("add");
		return model;
	}
	
	@RequestMapping(value={"/add"}, method = RequestMethod.POST)
	public ModelAndView insertStu(@ModelAttribute("student") Student student ) throws SQLException{			
		ModelAndView model=new ModelAndView("add");		
		studentImplement.insert(student);
		return model;
	}
	
	@RequestMapping(value={"/update/{id}"}, method = RequestMethod.GET)
	public ModelAndView updateForm(@PathVariable int id) throws SQLException{			
		ModelAndView model=new ModelAndView("update");				
		for(int i=0;i<studentImplement.list().size();i++){
			if(studentImplement.list().get(i).getId()==id){
				model.addObject("updateId",studentImplement.list().get(i));
			break;	
			}					
		}
		return model;
	}
	
	@RequestMapping(value={"/update1"}, method = RequestMethod.POST)
	public String updateStu(@ModelAttribute("student") Student student ) throws SQLException{						
		studentImplement.update(student);
		return "redirect:/";
	}
	
	@RequestMapping(value={"/view/{id}"}, method = RequestMethod.GET)
	public ModelAndView view(@PathVariable int id ) throws SQLException{						
		ModelAndView model=new ModelAndView("view");				
		for(int i=0;i<studentImplement.list().size();i++){
			if(studentImplement.list().get(i).getId()==id){
				model.addObject("updateId",studentImplement.list().get(i));
			break;	
			}					
		}
		return model;
	}

	@RequestMapping(value={"/search"}, method = RequestMethod.GET)
	public ModelAndView searchPage( ) throws SQLException{											
		ModelAndView model=new ModelAndView("search");
		return model;				
	}
	@RequestMapping(value={"/search"}, method = RequestMethod.POST)
	public ModelAndView searchAction(
			@RequestParam(value="search") String keyword, 
			@RequestParam(value="searchby") String type,
			@RequestParam(value="setrow") int row
			) throws SQLException{											
		ModelAndView model=new ModelAndView("search");		
		model.addObject("searchName",studentImplement.search(keyword,type,row));
		System.out.println(studentImplement.search(keyword,type,row).size());
		return model;				
	}

	
	@RequestMapping(value={"/delete/{id}"}, method = RequestMethod.GET)
	public String deleteStu(@PathVariable int id ) throws SQLException{											
		studentImplement.delete(id);
		
		return "redirect:/";
	}	
}
