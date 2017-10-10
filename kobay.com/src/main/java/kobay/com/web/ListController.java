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

	@RequestMapping(value="/list_1")
	public String selectList(@ModelAttribute("listVO") ListVO vo,Model model) throws Exception{
		
		//Map<String, Object> map = new HashMap<String,Object>();
		List<?> list = listService.selectList(vo);
		int totcnt = listService.selectListTotal(vo);
		//ModelAndView mav = new ModelAndView();
		//String ListArrayType = request.getParamater("arrayType");
		//model.addAttribute("arrayType", ListArrayType);
		/*map.put("list", list);
		map.put("totcnt", totcnt);
		map.put("arrayType", arrayType);
		mav.addObject("map",map);
		mav.setViewName("auction/list_1");*/
		
		//return mav;
		
		model.addAttribute("totcnt", totcnt);
		model.addAttribute("resultList", list);  
		
		return "auction/list_1";
	}
	
	@RequestMapping(value="/list_1",method={RequestMethod.GET,RequestMethod.POST}) //정렬관련 controll
	@ResponseBody public Map<String, Object> selectListArray(@RequestParam("arrayType") String arrayType, HttpServletRequest request,
										HttpServletResponse response) throws Exception{
		
		String tag = request.getParameter(arrayType);
		System.out.println("=========arrayType========="+tag);
		
		String result="";
		HashMap<String, Object> map = new HashMap<String, Object>();		
		result = listService.selectListArray(tag);
		
		if(result == null) result = "ok";
		map.put("result", result);
		
		return map;
	}
	
	@RequestMapping(value="/list_2")
	public String ListView2(){
		return "auction/list_2";
	}
	
	@RequestMapping(value="/list_3")
	public String ListView3(){
		return "auction/list_3";
	}
}
