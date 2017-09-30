package kobay.com.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Kobay Project Search Controller
 * @author SuyeonKang
 * @category search
 */
@Controller
@RequestMapping("/action/search")
public class SearchController {

	
	public ModelAndView searchView() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("others/search");
		return mv;
	}

}
