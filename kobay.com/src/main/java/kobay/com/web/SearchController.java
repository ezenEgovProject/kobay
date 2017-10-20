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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import kobay.com.service.SearchService;
import kobay.com.service.SearchVO;

/**
 * Kobay Project Search Controller
 * @author SuyeonKang
 * @category search
 */

@Controller
public class SearchController {

	@Resource
	SearchService searchService;
	
	private SearchVO searchVO;
	
	/**
	 * SearchView
	 * @param searchContent(searchKeyword)
	 * @return KobayAuction List
	 * @throws SqlException, ParseException
	 */
	@RequestMapping("/search")
	public ModelAndView searchView(@RequestParam("search_content") String searchContent, Model model)throws Exception {
		ModelAndView mv = new ModelAndView();
		searchVO = new SearchVO();
		searchVO.setSearchKeyword(searchContent);
		
		// !--getCategory
		List<?> lCtgList = searchService.selectctglist();
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
					searchVO.setCtgcd(value);
					mCtgList = searchService.selectctgmlist(searchVO);
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
			}
			lListCnt.add(cnt);
		}
		
		model.addAttribute("listSize", lCtgList.size());
		model.addAttribute("lCtgList", lCtgList);
		model.addAttribute("lCtgCnt", lListCnt);
		model.addAttribute("mList", mList);
		// !--getCategory
	
		if(searchVO!= null) {
			model.addAttribute("searchVO", searchVO);
		}

		mv.setViewName("others/search");
		return mv;
	}
	
	/**
	 * @return KobayAuction ItemList
	 * @throws sqlException
	 */
	@RequestMapping("/itemList")
	public String loadList(Model model) throws Exception {
		List<?> itemList = new ArrayList<>();
		itemList = searchService.getSearchList(searchVO);
		model.addAttribute("itemList", itemList);
		return "others/item/list";
	}

	/**
	 * 카테고리에따른 리스트 재검색
	 * @param vo - mCtgList(카테고리)
	 * @return String - 카테고리별 재검색 대한 쿼리성공여부
	 */
	@RequestMapping("/reConditionalList")
	@ResponseBody Map<String, Object> reConditionalList(Model model, SearchVO vo) {
		Map<String, Object> map = new HashMap<>();
		searchVO.setmCtgList(vo.getmCtgList());
		
		try {
			map.put("result", "success");
			model.addAttribute("searchVO", vo);
		}catch (Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}
		return map;
	}

	/**
	 * 정렬기준에 따른 리스트 재정렬
	 * @param vo - orderCodition(카테고리)
	 * @return String - 리스트 재정렬에 대한 쿼리성공여부
	 */
	@RequestMapping("/reOrderingList")
	@ResponseBody Map<String, Object> listReOrder(Model model, SearchVO vo) {
		Map<String, Object> map = new HashMap<>();
		searchVO.setOrderCondition(vo.getOrderCondition());
		try {
			map.put("result", "success");
			model.addAttribute("searchVO", vo);
		} catch (Exception e) {

			e.printStackTrace();
			map.put("result", "fail");
		}
		return map;
	}
}
