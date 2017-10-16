package kobay.com.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kobay.com.cmmn.PageVO;
import kobay.com.search.SearchService;


/**
 * Kobay Project Search Controller
 * @author SuyeonKang
 * @category search
 */

@Controller
public class SearchController {

	@Resource
	SearchService service;
	
	private PageVO pageVO;
	
	@RequestMapping("/search")
	public ModelAndView searchView(Model model)throws Exception {
		ModelAndView mv = new ModelAndView();
		// !--getCategory
		List<?> lCtgList = service.selectctglist();
		List<?> mCtgList = null;
		List<List<?>> mList = new ArrayList<>();
		
		Map<?, ?> map = null;
		
		for(int i = 0; i < lCtgList.size(); i++) {
			map = (Map<?, ?>) (lCtgList.get(i));
			
			Iterator<?> it = map.keySet().iterator();
			
			while(it.hasNext()) {
				String key = (String)it.next();
				if(key.equals("ctgcd")) {
					String value = (String)map.get(key);
					
					mCtgList = service.selectctgmlist(value);
					//System.out.println("===================" + value);
					// model.addAttribute(value, mCtgList);
					mList.add(mCtgList);

				}
			
			}
		}
		model.addAttribute("listSize", lCtgList.size());
		model.addAttribute("lCtgList", lCtgList);
		model.addAttribute("mList", mList);
		// !--getCategory
		
		// !--getList
		List<?> itemList = getList(pageVO);
		model.addAttribute("itemList", itemList);
		if(pageVO!= null) {
			model.addAttribute("pageVO", pageVO);
		}
		
	
		mv.setViewName("others/search");
		return mv;
	}
	
	// 조건에따라 리스트 가져오기
	private List<?> getList(PageVO vo) throws Exception {
		// TODO Auto-generated method stub
		List<?> list = service.getSearchList(vo);
		return list;
	}
	
	@RequestMapping("/listReOrder")
	@ResponseBody Map<String, Object> listReOrder(Model model, PageVO vo) {
		
		Map<String, Object> map = new HashMap<>();
		pageVO = vo;
		try {
			//List<?> list = getList(vo);
			map.put("result", "success");
			//map.put("itemList", list);
			model.addAttribute("pageVO", vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put("result", "fail");
		}
		return map;
	}

	@RequestMapping("/stest")
	public String test() {
		return "others/tab";
	}

}
