package sarin.com.app.controller;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import sarin.com.app.dao.StudentDao;
import sarin.com.app.dto.Student;

@Controller
public class MainController {
	
	@Autowired
	StudentDao studentDao;
	
	@RequestMapping(value={"/" , "/index"}, method = RequestMethod.GET)
	public ModelAndView homepage() throws SQLException{			
		ModelAndView model=new ModelAndView("index");		
		model.addObject("StudentList",studentDao.list());	
		System.out.println(studentDao.list().size());
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
		studentDao.insert(student);
		return model;
	}
	
	@RequestMapping(value={"/update/{id}"}, method = RequestMethod.GET)
	public ModelAndView updateForm(@PathVariable int id) throws SQLException{			
		ModelAndView model=new ModelAndView("update");				
		for(int i=0;i<studentDao.list().size();i++){
			if(studentDao.list().get(i).getId()==id){
				model.addObject("updateId",studentDao.list().get(i));
			break;	
			}					
		}
		return model;
	}
	
	@RequestMapping(value={"/update1"}, method = RequestMethod.POST)
	public String updateStu(@ModelAttribute("student") Student student ) throws SQLException{						
		studentDao.update(student);
		return "redirect:/";
	}
	
	@RequestMapping(value={"/view/{id}"}, method = RequestMethod.GET)
	public ModelAndView view(@PathVariable int id ) throws SQLException{						
		ModelAndView model=new ModelAndView("view");				
		for(int i=0;i<studentDao.list().size();i++){
			if(studentDao.list().get(i).getId()==id){
				model.addObject("updateId",studentDao.list().get(i));
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
		model.addObject("searchName",studentDao.search(keyword,type,row));
		System.out.println(studentDao.search(keyword,type,row).size());
		return model;				
	}

	
	@RequestMapping(value={"/delete/{id}"}, method = RequestMethod.GET)
	public String deleteStu(@PathVariable int id ) throws SQLException{											
		studentDao.delete(id);
		
		return "redirect:/";
	}	
	
}
