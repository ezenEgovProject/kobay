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
import kobay.com.cmmn.PaginationInfo;
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
	
	private SearchVO searchVO = new SearchVO();
	private int listCount = 0;
	
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
		// 검색키워드 저장
		searchVO.setSearchKeyword(searchContent);
		int listCnt = searchService.getSearchListCnt(searchVO);
		if(listCnt == 0) {
			List<?> nullList = searchService.getNullList();
			model.addAttribute("nullList", nullList);
			model.addAttribute("searchVO", searchVO);
			mv.setViewName("others/null");
			return mv;
		}
		
		// !-- getCategory
		List<?> lCtgList = searchService.selectctglist();
		List<?> mCtgList = null;
		List<List<?>> mList = new ArrayList<>();
		List<Integer> lListCnt = new ArrayList<>();
		Map<?, ?> map = null;
		
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
				// EgovMap형태의  value 가져오기
				EgovMap record = (EgovMap) ((mList.get(i)).get(j));
				String str = (record.get("count")).toString();
				cnt = cnt + Integer.parseInt(str);
			}
			lListCnt.add(cnt);
		}
		
		model.addAttribute("listSize", lCtgList.size());
		model.addAttribute("lCtgList", lCtgList);
		model.addAttribute("lCtgCnt", lListCnt);
		model.addAttribute("mList", mList);
		
		// 페이지 로딩을 위한 정보
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
		
		searchVO.setPageUnit(12);
		searchVO.setPageSize(12);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		
		List<?> itemList = new ArrayList<>();
		itemList = searchService.getSearchList(searchVO);
		
		listCount = searchVO.getPageIndex();
		
		model.addAttribute("itemList", itemList);
		model.addAttribute("listName", "itemList"+listCount);
		model.addAttribute("pageSize", searchVO.getPageIndex());
		
		return "others/item/list";
	}
	
	/**
	 * 페이지 스크롤 시 추가 리스트로드
	 * @param model, SearchVO
	 * @return listItem View
	 * @throws SqlException
	 */
	@RequestMapping("/addItemList")
	@ResponseBody Map<String, Object> addItemList(Model model, SearchVO vo) {
		Map<String, Object> map = new HashMap<>();
		List<?> itemList = new ArrayList<>();
		
		// 현재 로드할 페이지가 첫번째가 아니면 add
		searchVO.setPageIndex(vo.getPageIndex());
		searchVO.setPageUnit(12);
		searchVO.setPageSize(12);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		int listCnt = 0;
		try {
			listCnt = searchService.getSearchListCnt(searchVO);
			// 전체 데이터 갯수를 로드했으면 return 
			if(searchVO.getFirstIndex() > listCnt) {
				model.addAttribute("searchVO", vo);
				map.put("result", "noMoreList");
				return map;
			}
			itemList = searchService.getSearchList(searchVO);
			listCount = searchVO.getPageIndex();
			
			model.addAttribute("listName", "itemList"+listCount);
			model.addAttribute("pageSize", searchVO.getPageIndex());
			map.put("result", "success");
			model.addAttribute("itemList", itemList);
			model.addAttribute("searchVO", vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put("result", "fail");
		} 
		return map;
	}

	/**
	 * 카테고리에따른 리스트 재검색
	 * @param vo - mCtgList(카테고리)
	 * @return String - 카테고리별 재검색 대한 쿼리성공여부
	 */
	@RequestMapping("/reConditionalList")
	@ResponseBody Map<String, Object> reConditionalList(Model model, SearchVO vo) {
		searchVO.setPageIndex(1);
		Map<String, Object> map = new HashMap<>();
		searchVO.setmCtgList(vo.getmCtgList());
		
		map.put("result", "success");
		model.addAttribute("searchVO", vo);
		return map;
	}

	/** 정렬 기준 설정 */
	@RequestMapping("/reOrderingList")
	@ResponseBody Map<String, Object> listReOrder(Model model, SearchVO vo) {
		searchVO.setPageIndex(1);
		searchVO.setOrderCondition(vo.getOrderCondition());
		
		Map<String, Object> map = new HashMap<>();

		map.put("result", "success");
		model.addAttribute("searchVO", vo);
		return map;
	}
	
	/** 가격범위 설정 */
	@RequestMapping("/priceRange")
	@ResponseBody Map<String, String> priceRange(Model model, SearchVO vo) {
		searchVO.setMinPrice(vo.getMinPrice());
		searchVO.setMaxPrice(vo.getMaxPrice());
		
		Map<String, String> map = new HashMap<>();
		map.put("result", "success");
		model.addAttribute("searchVO", vo);
		return map;
	}
	
	/** 결과내 재검색어 설정 */
	@RequestMapping("/innerKeywordSearch")
	@ResponseBody Map<String, String> innerKeyword(Model model, SearchVO vo) {
		searchVO.setInnerKeyword(vo.getInnerKeyword());

		Map<String, String> map = new HashMap<>();
		map.put("result", "success");
		model.addAttribute("searchVO", vo);
		return map;
	}
	
	/** 추가 검색조건 설정 */
	@RequestMapping("/otherConditionSearch")
	@ResponseBody Map<String, String> otherCondition(Model model, SearchVO vo) {
		if(vo.getDeliveryWay() != null){
			searchVO.setDeliveryWay(vo.getDeliveryWay());
		}
		else if (vo.getAucStatus() != null) {
			searchVO.setAucStatus(vo.getAucStatus());
		}
		
		Map<String, String> map = new HashMap<>();
		map.put("result", "success");
		model.addAttribute("searchVO", vo);
		return map;
	}
	
}
