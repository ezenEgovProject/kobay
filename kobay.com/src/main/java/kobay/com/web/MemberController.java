package kobay.com.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kobay.com.cmmn.MemberVaildator;
import kobay.com.cmmn.PageVO;
import kobay.com.service.LoginService;
import kobay.com.service.MemberService;
import kobay.com.service.MemberVO;

@Controller
public class MemberController {
	
	@Resource(name = "memberService")
	private MemberService memberService;
	
	@Resource(name = "loginService")
	private LoginService loginService;
	
	@ModelAttribute("loginForm")
	protected Object loginBack() throws Exception {
		return new MemberVO();
	}
	
	@ModelAttribute("regForm")
	protected Object regBack() throws Exception {
		return new MemberVO();
	}
	
	@ModelAttribute("confirmForm")
	protected Object confirmBack() throws Exception {
		return new MemberVO();
	}
	
	@ModelAttribute("editForm")
	protected Object editBack() throws Exception {
		return new MemberVO();
	}
	
	@ModelAttribute("findIdForm")
	protected Object findIdBack() throws Exception {
		return new MemberVO();
	}
	
	@ModelAttribute("findPwdForm")
	protected Object findPwdBack() throws Exception {
		return new MemberVO();
	}
	
	@RequestMapping("/loginreg") /*로그인 회원가입 페이지*/
	public String loginRegPage(MemberVO vo, HttpSession session)  throws Exception {
		
		loginBack();
		regBack();
		
		String memberId = (String) session.getAttribute("id");
		
		if(memberId != null) {
			return "redirect:/main";
		}
	
		return "login/loginRegWrite";
	}
	
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
	
	
	@RequestMapping(value="/register") /*회원가입 실행*/
	@ResponseBody public Map<String, Object> Register(@ModelAttribute("memberVO") MemberVO vo, BindingResult bindingResult) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		String memberId = vo.getMemberId();
		
		int checkResult = memberService.memberCheckId(memberId);
		
		new MemberVaildator().validate(vo, bindingResult);
		if(bindingResult.hasErrors()) {
			/*유효성에 걸림*/
			System.out.println("폼 내용이 패턴과 일치하지 않습니다.");
			map.put("result", "fail");
			map.put("errors", bindingResult.getAllErrors());
		} else if(checkResult !=0 ) {
			map.put("result", "exists"); /*해당 아이디가 이미 존재*/
		}
		else {
			memberService.insertMember(vo);
			map.put("result", "ok");
		}

		return map;
	}
	
	@RequestMapping(value="/checkform")
	@ResponseBody public Map<String, Object> memberCheckForm(MemberVO vo,Model model, BindingResult bindingResult) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		String result="fail";
		String checkId="ok";
		String memberId = vo.getMemberId(); 
		
		int checkResult = memberService.memberCheckId(memberId); /*아이디 중복 확인*/
		
		if(checkResult != 0) {
			checkId="exists"; /*해당 아이디가 이미 존재*/
		} else if (checkResult == 0) {
			checkId="ok"; /*아이디 사용 가능*/
		}
		
		result = "ok"; /*메소드에 문제없음*/

		new MemberVaildator().validate(vo, bindingResult);
		if(bindingResult.hasErrors()){	
			map.put("errors", bindingResult.getAllErrors()); /*유효성 검사 후 에러 발생*/
		} else {
			result="perfect"; /*유효성에 문제없음*/
		}
		
		System.out.println("checkId : " + checkId);
		map.put("checkResult", checkId);
		map.put("result",result);
		return map;
	}
		
	@InitBinder /*validator 사용*/
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(new MemberVaildator());
	}
	
	static String authorization = ""; /*아이디 수정 시 패스워드 재입력 성공해야 권한 부여*/

	@RequestMapping(value="/confirm") /*패스워드 재입력 페이지*/
	public String confirmPage(HttpSession session) {
		if(session.getAttribute("id") != null)
		{	/*로그인 되어있음*/
			authorization = "fail";
			return "member/confirm";	
		}
		else 
		{
			/*로그인 안 되어있음*/
			return "redirect:/loginreg";
		}
	}	
	
	@RequestMapping(value="/confirmid") /*아이디 패스워드 확인 (ajax 사용)*/
	@ResponseBody
	public Map<String, Object> confirmId(MemberVO vo, Model model) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String result = "fail";
		authorization = "fail";
		int loginIdentify = loginService.loginCheck(vo); /*아이디 패스워드 일치하는지 확인*/

		if(loginIdentify == 1) {
			/*아이디 패스워드 일치하는지 확인 후 권한 부여*/
			authorization = "ok";
			result="ok";
		}
		
		map.put("result", result);
		
		return map;
	}
	
	@RequestMapping(value="/profile") /*회원정보 확인 페이지*/
	public String editProfilePage(MemberVO vo,Model model ,HttpSession session) throws Exception {	
		if(authorization == "ok" && session.getAttribute("id") != null) /*로그인이 되어있고 권한이 있는지 확인*/
		{	
			vo.setMemberId((String) session.getAttribute("id"));
			vo = memberService.selectMemberDetail(vo); /*회원정보 불러옴*/
			authorization = "end"; /*권한 확인 후 권한 다시 삭제*/
			
			model.addAttribute("vo",vo);
			
			return "member/editProfile";
		} 
		else 
		{
			return "redirect:/confirm"; /*권한이 없거나 로그인이 되어있지 않음*/
		}
		
	}
	
	@RequestMapping(value="/edit") /*정보 수정 (ajax 사용)*/
	@ResponseBody public Map<String, Object> EditProfile(@ModelAttribute("memberVO") MemberVO vo, BindingResult bindingResult,HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int unq = (int) session.getAttribute("unq"); /*unq값 저장*/
		
		new MemberVaildator().validate(vo, bindingResult); /*유효성 검사 실행*/
		if(bindingResult.hasErrors()) {
			/*유효성에 걸림*/
			System.out.println("폼 내용이 패턴과 일치하지 않습니다.");
			map.put("result", "fail");
			map.put("errors", bindingResult.getAllErrors());
		} 
		else {
			vo.setMemberUnq(unq); /*session에 저장되어있는 unq값을 기준으로 정보를 수정*/
			memberService.editProfile(vo); /*회원정보 수정*/
			map.put("result", "ok");
		}

		return map;
	}  
	
	@RequestMapping(value="/lost") /*아이디 패스워드 찾는 페이지*/
	public String lostPage(HttpSession session) {	
		if(session.getAttribute("id") != null)
		{	/*로그인 되어있음*/
			return "redirect:/main";	
		}
		else 
		{
			/*로그인 안 되어있음*/
			return "member/lost";
		}
	}
	
	@RequestMapping(value="/find") /*회원 정보 일치 확인 (ajax 사용)*/
	@ResponseBody public Map<String, Object> Find(MemberVO vo, Model model) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String result = "fail";
		
		if(!vo.getMemberName().isEmpty() && !vo.getMemberPhone().isEmpty()) 
		{
			int check = memberService.findMember(vo);
			if(check > 0)
			{
				result = "ok";
			}
			else
			{
				result = "fail";
			}
		} 
		else 
		{
			result="fail";
		}
		
		
		map.put("result", result);
		
		return map;
	}
	
	@RequestMapping(value="/foundid")
	public String foundId(MemberVO vo, HttpSession session, Model model) throws Exception {
		if(session.getAttribute("id") == null)
		{
			List<?> list = memberService.foundId(vo);
			model.addAttribute("foundid",list);
			return "member/pop/foundId";
		}
		else
		{
			return "redirect:/main";
		}	
	}
	
	@RequestMapping(value="/foundpwd")
	public String foundPwd(MemberVO vo, HttpSession session, Model model) throws Exception {
		if(session.getAttribute("id") == null)
		{
			String memberPwd = getRandomPassword(10);
			System.out.println("변경된 비밀번호 확인 : " + memberPwd);
			vo.setMemberPwd(memberPwd);
			memberService.updateRandomPassword(vo);
			model.addAttribute("foundpwd",memberPwd);
			return "member/pop/foundPwd";
		}
		else
		{
			return "redirect:/main";
		}	
	}
	
	public static String getRandomPassword(int len) { 
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' }; 
		int idx = 0; 
		StringBuffer sb = new StringBuffer(); 
		for (int i = 0; i < len; i++) { 
			idx = (int) (charSet.length * Math.random()); // 36 * 생성된 난수를 Int로 추출 (소숫점제거) 
			sb.append(charSet[idx]); 
		} 
		return sb.toString(); 
	}
}
