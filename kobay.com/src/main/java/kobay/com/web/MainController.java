package kobay.com.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import kobay.com.service.TestService;
import kobay.com.service.TestVO;

@Controller
public class MainController {

	@RequestMapping (value="/main")
	public String mainView() {
		return "main/main";
	}
	
	@RequestMapping ("/intro")
	public String introView() {
		return "main/intro";
	}
	  
	/* list */
	
/*	@RequestMapping (value="/list_1")
	public String ListView1() {
		return "auction/list_1";
	}
	
	@RequestMapping (value="/list_2")
	public String ListView2() { 
		return "auction/list_2";
	}
	
	@RequestMapping (value="/list_3")
	public String ListView3() {
		return "auction/list_3";
	}*/

	/**
	 * Test Server
	 */
	@Resource(name="testSERVICE")
	TestService testService;
	
	@RequestMapping (value="/test")
	public String testView(@RequestParam("deptno") int deptno, Model model) throws Exception {
		TestVO dept = testService.getDept(deptno);
		model.addAttribute("dept", dept);
		
		return "main/test";
	}
}
