package kobay.com.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kobay.com.service.ListService;
import kobay.com.service.ListVO;

@Controller
public class ListController {

	@Resource(name="listService")
	private ListService listService;

/*	@RequestMapping(value="/list_1")
	public String selectList(@ModelAttribute("listVO") ListVO vo,Model model) throws Exception{
		
		//Map<String, Object> map = new HashMap<String,Object>();
		List<?> list = listService.selectList(vo);
		int totcnt = listService.selectListTotal(vo);
		//ModelAndView mav = new ModelAndView();
		//String ListArrayType = request.getParamater("arrayType");
		//model.addAttribute("arrayType", ListArrayType);
		map.put("list", list);
		map.put("totcnt", totcnt);
		map.put("arrayType", arrayType);
		mav.addObject("map",map);
		mav.setViewName("auction/list_1");
		
		//return mav;
		
		model.addAttribute("totcnt", totcnt);
		model.addAttribute("resultList", list);  
		
		return "auction/list_1";
	}*/
	
	@RequestMapping(value="/list_1")
	public String selectList(@ModelAttribute("listVO") ListVO vo,Model model) throws Exception{
		
		//Map<String, Object> map = new HashMap<String,Object>();
		List<?> list = listService.selectList(vo);
		int totcnt = listService.selectListTotal(vo);
		
		model.addAttribute("totcnt", totcnt);
		model.addAttribute("resultList", list); 
		
		return "auction/list_1";
	}
	
	@RequestMapping(value="/list_2")
	public String selectList2(@ModelAttribute("listVO") ListVO vo,Model model) throws Exception{
		
		//Map<String, Object> map = new HashMap<String,Object>();
		List<?> list = listService.selectList2(vo);
		int totcnt = listService.selectListTotal(vo);
		
		model.addAttribute("totcnt", totcnt);
		model.addAttribute("resultList", list); 
		
		return "auction/list_2";
	}
	
	@RequestMapping(value="/list_3")
	public String selectList3(@ModelAttribute("listVO") ListVO vo,Model model) throws Exception{
		
		Map<String, Object> map = new HashMap<String,Object>();
		List<?> list = listService.selectList3(vo);
		int totcnt = listService.selectListTotal(vo);
		
		model.addAttribute("totcnt", totcnt);
		model.addAttribute("resultList", list); 
		
		return "auction/list_3";
	}
	
/*	@RequestMapping(value="/order" ,method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody public Map<String,Object> selectListArray(@RequestParam("orderCondition") String orderCondition,
					ListVO vo,HttpServletRequest request) throws Exception{
		
		Map<String,Object> map = new HashMap<String,Object>();
		String order = request.getParameter(orderCondition);
		System.out.println("===========order==========="+order);
		map.put("order", order);
		
		return map;
	}*/
	
	@RequestMapping(value = "/order", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> selectListArray(@RequestBody Map<String,Object> orderCondition){

		Map<String,Object> resultMap = new HashMap<String,Object>();
		try{
			listService.selectListArray(orderCondition);
		}catch(Exception e){
			resultMap.put("message", e.getMessage());
			return resultMap;
		}
		resultMap.put("message", "ok");
		return resultMap;
	}
}
