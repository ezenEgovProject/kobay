package kobay.com.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import kobay.com.cmmn.PageVO;
import kobay.com.search.SearchService;
import kobay.com.search.SearchVO;


/**
 * Kobay Project Search Controller
 * @author SuyeonKang
 * @category search
 */

@Controller
public class SearchController {

	@Resource
	SearchService service;
	
	private PageVO pageVO = new PageVO();
	
	@RequestMapping("/search")
	public ModelAndView searchView(@RequestParam("search_content") String searchContent, Model model)throws Exception {
		ModelAndView mv = new ModelAndView();
		
		pageVO.setSearchKeyword(searchContent);
		
		
		// !--getCategory
		List<?> lCtgList = service.selectctglist();
		List<?> mCtgList = null;
		List<List<?>> mList = new ArrayList<>();
		
		Map<?, ?> map = null;
		List<Integer> lListCnt = new ArrayList<>();
		
		for(int i = 0; i < lCtgList.size(); i++) {
			map = (Map<?, ?>) (lCtgList.get(i));
			
			Iterator<?> it = map.keySet().iterator();
			
			while(it.hasNext()) {
				String key = (String)it.next();
				if(key.equals("ctgcd")) {
					String value = (String)map.get(key);
					pageVO.setCtgcd(value);
					mCtgList = service.selectctgmlist(pageVO);
					//System.out.println("===================" + value);
					// model.addAttribute(value, mCtgList);
					mList.add(mCtgList);
				}
			}
		}
		
		for (int i = 0; i < mList.size(); i++) {
			int cnt = 0;
			for(int j = 0; j < mList.get(i).size(); j++) {
				EgovMap record = (EgovMap) ((mList.get(i)).get(j));//EgovMap으로 형변환하여 담는다.
				String str = (record.get("count")).toString();
				cnt = cnt + Integer.parseInt(str);
				System.out.println("===========================CodeList:" + str);
			}
			lListCnt.add(cnt);
		}
		
		model.addAttribute("listSize", lCtgList.size());
		model.addAttribute("lCtgList", lCtgList);
		model.addAttribute("lCtgCnt", lListCnt);
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

	
	public String[] getCtgLists(List<?> ctgList) throws Exception {
		String[] ctgcd = null;
		
		ctgcd = new String[ctgList.size()];
		if(ctgList != null) {
			for (int i = 0; i < ctgList.size(); i++) {
				EgovMap record = (EgovMap) ctgList.get(i);//EgovMap으로 형변환하여 담는다.
				String value = (String) record.get("ctgcd");
				//System.out.println("===========================CodeList:" + value);
				ctgcd[i] = value;
			}
		}
		
		return ctgcd;
	}
}
