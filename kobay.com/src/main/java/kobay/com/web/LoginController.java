package kobay.com.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kobay.com.service.LoginService;
import kobay.com.service.MemberService;
import kobay.com.service.MemberVO;

@Controller
public class LoginController {
	
	private static final Logger log = LoggerFactory.getLogger(LoginController.class);
	
	@Resource(name = "loginService")
	private LoginService loginService;
	
	@Resource(name = "memberService")
	private MemberService memberService;
	
	@ModelAttribute("loginForm")
	protected Object loginBack() throws Exception {
		return new MemberVO();
	}
	
	@ModelAttribute("regForm")
	protected Object regBack() throws Exception {
		return new MemberVO();
	}
		
	@RequestMapping(value="/login") /*로그인 실행*/
	@ResponseBody
	public Map<String, Object> login(MemberVO vo, HttpSession session) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int unq = 0;
		String id = vo.getMemberId();
		String name = "";
		String result = "";

		int loginIdentify = loginService.loginCheck(vo); /*아이디 패스워드 확인*/

		if(loginIdentify == 1) {
			/*로그인 성공*/
			session.setAttribute("id", id);
			result = "ok";
			
			String curTime = new SimpleDateFormat("yyyy/MM/dd/HH:mm").format(new Date());
			log.info(session.getAttribute("id") + " Login 현재시간 : "+curTime);
			
			vo = memberService.selectMemberDetail(vo);
			
			unq = vo.getMemberUnq();
			name = vo.getMemberName();
			
			session.setAttribute("unq", unq); 
			session.setAttribute("name", name);
			
			System.out.println(name);
		}
		
		map.put("result", result);
		
		return map;
	}
	
	
	@RequestMapping(value = "/logout") /*로그아웃 실행*/
	public String logout(HttpSession session) {
		
		String curTime = new SimpleDateFormat("yyyy/MM/dd/HH:mm").format(new Date());
		log.info(session.getAttribute("id") + " Logout 현재시간 : "+curTime);
		
		session.invalidate();
		
		return "redirect:/main";
	}
	
}