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

import kobay.com.cmmn.PageVO;
import kobay.com.service.MemberService;
import kobay.com.service.MemberVO;

@Controller
public class MemberController {
	
	@Resource(name = "memberService")
	private MemberService memberService;
	
	@RequestMapping(value="/memberList")
	public String memberList(@ModelAttribute("pageVO") PageVO pageVO,Model model) throws Exception {
		
	
		/*1. 한 화면에 출력할 행 개수, 한 화면에 출력할 페이지 개수*/
		int recordCountPerPage = 10;
		int pageSize = 5;
		/*2. 총 데이터 개수*/
		int totalCount = memberService.selectMemberTotal(pageVO);
		/*3. 화면 출력할 페이지 번호*/
		int pageIndex = pageVO.getPageIndex();
		/*4. 화면 출력할 페이징의 시작 번호, 끝 번호*/
		// 1,2,3,4,5 -> 1 / 6,7,8,9,10 -> 6 / 11,12,13,14,15 -> 11
		int firstPage = ((int) Math.floor((pageIndex-1)/pageSize)*pageSize) + 1;
		int lastPage = (firstPage + pageSize) - 1;
		/*5. 화면 출력할 행(데이터)의 시작 번호, 끝 번호*/
		int firstIndex = (pageIndex - 1) * 10 + 1;
		int lastIndex = (firstIndex + recordCountPerPage) - 1;
		/*6. 총 페이지 개수*/
		int totalPage = (int) Math.ceil((double)totalCount / recordCountPerPage);
		/*7. [이전] / [다음] 처리할 변수 지정*/
		int before = 0; //링크 없음
		if(firstPage > 1) before = 1;

		int next = 0;
		if(lastPage <= totalPage) next = 1;
		/*8. 행 번호*/
		int number = totalCount - ((pageIndex-1) * recordCountPerPage);
		
		pageVO.setFirstIndex(firstIndex);
		pageVO.setLastIndex(lastIndex);
				
		
		List<?> list = memberService.selectMemberList(pageVO);
		
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("firstPage",firstPage);
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("totalPage",totalPage);
		model.addAttribute("before",before);
		model.addAttribute("next",next);
		model.addAttribute("number",number);

		model.addAttribute("memberList",list);
		return "member/memberList";
	}
	
	@RequestMapping(value="/register")
	@ResponseBody public Map<String, Object> Register(MemberVO vo) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
//		String member_pwd = vo.getMember_pwd();
//		vo.setMember_pwd(member_pwd);
		memberService.insertMember(vo);
		
		map.put("result", "ok");
		return map;
	}
}
