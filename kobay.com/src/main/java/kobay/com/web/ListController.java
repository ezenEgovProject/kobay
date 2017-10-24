package kobay.com.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import kobay.com.service.ListService;
import kobay.com.service.ListVO;

@Controller
public class ListController {

	private ListVO listVO;
	
	@Resource(name="listService")
	private ListService listService;

	/* 진행중인 리스트 */
	@RequestMapping(value="/list_1")
	public String selectList1(Model model) throws Exception{
		
		ListVO vo = new ListVO();
		vo.setOrderCondition("best");
		List<?> list = listService.selectList1(vo);
		
		model.addAttribute("count", "4");
		model.addAttribute("bestList", list); 
		
		return "auction/list_1";
	}
	 
	@RequestMapping(value="/list1")
	public String selectReList1(Model model) throws Exception{
		
		//Map<String, Object> map = new HashMap<String,Object>();
		ListVO vo = listVO;
		List<?> list = listService.selectList1(vo);
		int totcnt1 = listService.selectListTotal1(vo);
		
		model.addAttribute("totcnt1", totcnt1);
		model.addAttribute("resultList", list); 
		
		return "auction/item/list1";
	}
	
	/* 진행예정중인 리스트 */
	@RequestMapping(value="/list_2")
	public String selectList2(@ModelAttribute("listVO") ListVO vo,Model model) throws Exception{
		
		List<?> list = listService.selectList2(vo);
		int totcnt2 = listService.selectListTotal2(vo);
		
		model.addAttribute("totcnt2", totcnt2);
		model.addAttribute("resultList", list); 
		
		return "auction/list_2";
	}
	
	@RequestMapping(value="/list2")
	public String selectReList2(Model model) throws Exception{
		
		ListVO vo = listVO;
		List<?> list = listService.selectList2(vo);
		int totcnt2 = listService.selectListTotal2(vo);
		
		model.addAttribute("totcnt2", totcnt2);
		model.addAttribute("resultList", list); 
		
		return "auction/item/list2";
	}
	
	/* 마감된 리스트 */
	@RequestMapping(value="/list_3")
	public String selectList3(@ModelAttribute("listVO") ListVO vo,Model model) throws Exception{
		
		List<?> list = listService.selectList3(vo);
		int totcnt3 = listService.selectListTotal3(vo);
		
		model.addAttribute("totcnt3", totcnt3);
		model.addAttribute("resultList", list); 
		
		return "auction/list_3";
	}
	
	@RequestMapping(value="/list3")
	public String selectReList3(Model model) throws Exception{
		
		ListVO vo = listVO;
		List<?> list = listService.selectList3(vo);
		int totcnt3 = listService.selectListTotal3(vo);
		
		model.addAttribute("totcnt3", totcnt3);
		model.addAttribute("resultList", list); 
		
		return "auction/item/list3";
	}
	
	/* 리스트 정렬 */
	@RequestMapping(value = "/order")
	@ResponseBody
	public Map<String,Object> selectList(Model model, ListVO vo){

		Map<String,Object> resultMap = new HashMap<String,Object>();
		listVO = vo;
		try{
			resultMap.put("result", "ok");
			model.addAttribute("listVO", vo);
		}catch(Exception e){
			e.printStackTrace();
			resultMap.put("message", e.getMessage());
		}
		return resultMap;
	}
	
}
