package kobay.com.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import kobay.com.service.SearchService;

@Controller
public class MainController {
	@Resource
	SearchService service;
	
	@RequestMapping (value="/main")
	public String mainView(Model model) throws Exception {
		List<?> lCtgList = service.selectctglist();
		model.addAttribute("lCtgList", lCtgList);
		for(int i = 0; i < lCtgList.size(); i++) {
			// EgovMap형태의  value 가져오기
			EgovMap record = (EgovMap) (lCtgList.get(i));
			String lctg = (record.get("ctgcd")).toString();
			
			List<?> mainCtgList = service.getMainCtgList(lctg);
			model.addAttribute(lctg+"List", mainCtgList);
		}
		
		return "main/main";
	}
	
	@RequestMapping ("/intro")
	public String introView() {
		return "main/intro";
	}
}
