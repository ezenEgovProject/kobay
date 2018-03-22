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
		

		new MemberVaildator().validate(vo, bindingResult);
		if(bindingResult.hasErrors()){	
			map.put("errors", bindingResult.getAllErrors()); /*유효성 검사 후 에러 발생*/
			result = "fail";
		} else {
			result="ok"; /*유효성에 문제없음*/
		}

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
		
		/*이름과 핸드폰 번호 빈칸 아니여야 실행*/
		if(!vo.getMemberName().isEmpty() && !vo.getMemberPhone().isEmpty()) 
		{
			int check = memberService.findMember(vo); /*회원 정보 찾기 실행*/
			if(check > 0)
			{
				result = "ok"; /*성공*/
			}
			else
			{
				result = "fail"; /*실패*/
			}
		} 
		else 
		{
			result="fail"; /*빈칸 있음*/
		}
		
		
		map.put("result", result);
		
		return map;
	}
	
	@RequestMapping(value="/foundid") /*아이디 찾는 팝업창*/
	public String foundId(MemberVO vo, HttpSession session, Model model) throws Exception {
		if(session.getAttribute("id") == null)
		{
			List<?> list = memberService.foundId(vo); /*아이디 불러오기*/
			model.addAttribute("foundid",list);
			return "member/pop/foundId";
		}
		else
		{
			return "redirect:/main";
		}	
	}
	
	@RequestMapping(value="/foundpwd") /*비밀번호 찾는 팝업창*/
	public String foundPwd(MemberVO vo, HttpSession session, Model model) throws Exception {
		if(session.getAttribute("id") == null)
		{
			String memberPwd = getRandomPassword(10); /*임시 비밀번호 자릿수와 랜덤 실행*/
			vo.setMemberPwd(memberPwd); /*임시 비밀번호 vo에 담기*/
			memberService.updateRandomPassword(vo); /*임시 비밀번호 업데이트*/
			model.addAttribute("foundpwd",memberPwd);
			return "member/pop/foundPwd";
		}
		else
		{
			return "redirect:/main";
		}	
	}
	
	public static String getRandomPassword(int len) { /*임시 비밀번호 생성*/
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
