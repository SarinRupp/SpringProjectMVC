package sarin.app.controller;

import java.awt.List;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;







import sarin.app.entities.UserDTO;
import sarin.app.services.UserServices;




@Controller
@RequestMapping("/")
public class MainController {
	
	@Autowired
	UserServices studentImplement; 
	
	/*@RequestMapping(value={"/" , "/index"}, method = RequestMethod.GET)*/
	/*public String homePage(ModelMap model) throws SQLException {
		//ModelAndView model=new ModelAndView("index");		
		model.addAttribute("list",studentImplement.list());	
		model.addAttribute("msg","Listing");
		System.out.println(studentImplement.list().size());
		System.out.println("index");
		return "index";
	}*/
	/*public ModelAndView homePage() throws SQLException {
		ModelAndView model=new ModelAndView("index");		
		model.addObject("list",studentImplement.list());	
		model.addObject("msg","Listing");
		System.out.println(studentImplement.list().size());
		System.out.println("index");
		return model;
	}*/
	
	
	@RequestMapping(value="/list")
    public ModelAndView listOfUsers(@RequestParam(required = false) Integer page) throws SQLException {
        ModelAndView modelAndView = new ModelAndView("home");
        System.out.println(page);
        
       
       ArrayList<UserDTO> users = studentImplement.list(5,page);
      
        PagedListHolder<UserDTO> pagedListHolder = new PagedListHolder<>(users);
        System.out.println(pagedListHolder.getPageList());
        System.out.println(pagedListHolder.getPageSize());
        
        pagedListHolder.setPageSize(1);                
        	modelAndView.addObject("data", pagedListHolder.getSource());
        	modelAndView.addObject("maxPages", pagedListHolder.getPageCount());

        if(page==null || page < 1 || page > pagedListHolder.getPageCount())page=1;
        	modelAndView.addObject("page", page);
        if(page == null || page < 1 || page > pagedListHolder.getPageCount()){
            pagedListHolder.setPage(0);
            modelAndView.addObject("users", pagedListHolder.getPageList());
        }
        else if(page <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(page-1);
            modelAndView.addObject("users", pagedListHolder.getPageList());
        }

        return modelAndView;
    }
	
	
	
	
	@RequestMapping(value={"/add"}, method = RequestMethod.GET)
	public ModelAndView addForm() throws SQLException{			
		ModelAndView model=new ModelAndView("add");
		return model;
	}
	
	@RequestMapping(value={"/add"}, method = RequestMethod.POST)
	public ModelAndView insertStu(@ModelAttribute("user") UserDTO user ) throws SQLException{			
		ModelAndView model=new ModelAndView("add");		
		studentImplement.insert(user);
		return model;
	}
	
	/*@RequestMapping(value={"/update/{id}"}, method = RequestMethod.GET)
	public ModelAndView updateForm(@PathVariable int id) throws SQLException{			
		ModelAndView model=new ModelAndView("update");				
		model.addObject("updateId",studentImplement.update(id));
		for(int i=0;i<studentImplement.list().size();i++){
			if(studentImplement.list().get(i).getId()==id){
				model.addObject("updateId",studentImplement.list().get(i));
			break;	
			}					
		}
		return model;
	}
	
	@RequestMapping(value={"/update1"}, method = RequestMethod.POST)
	public String updateStu(@ModelAttribute("student")  UserDTO user ) throws SQLException{						
		studentImplement.update(user);
		return "redirect:/";
	}
	
	@RequestMapping(value={"/view/{id}"}, method = RequestMethod.GET)
	public ModelAndView view(@PathVariable int id ) throws SQLException{						
		ModelAndView model=new ModelAndView("view");				
		model.addObject("updateId",studentImplement.update(id));
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
	}	*/
}
