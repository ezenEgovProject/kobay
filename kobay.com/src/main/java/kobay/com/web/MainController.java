package kobay.com.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kobay.com.service.SearchService;

@Controller
public class MainController {
	@Resource
	SearchService service;
	
	@RequestMapping (value="/main")
	public String mainView(Model model) throws Exception {
		
		List<?> nullList = service.getNullList();
		model.addAttribute("nullList", nullList);
		
		return "main/main";
	}
	
	@RequestMapping ("/intro")
	public String introView() {
		return "main/intro";
	}
}
