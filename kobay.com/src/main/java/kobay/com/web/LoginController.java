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
		
	@RequestMapping(value="/login")
	@ResponseBody
	public Map<String, Object> login(MemberVO vo, HttpSession session) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String id = vo.getMember_id();
		String pwd =  vo.getMember_pwd();
		String name = "";
		String result = "";

		int loginIdentify = loginService.loginCheck(vo);

		if(loginIdentify == 1) {
			session.setAttribute("id", id);
			session.setAttribute("pwd", pwd);
			result = "ok";
			
			String curTime = new SimpleDateFormat("yyyy/MM/dd/HH:mm").format(new Date());
			log.info(session.getAttribute("id") + " Login 현재시간 : "+curTime);
			
			vo = memberService.selectMemberDetail(vo);
			
			name = vo.getMember_name();
			session.setAttribute("name", name);
			System.out.println(name);
		}
		
		map.put("result", result);
		
		return map;
	}
	
	@RequestMapping(value = "/logout")
	@ResponseBody
	public  Map<String, Object> logout(HttpSession session) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		String curTime = new SimpleDateFormat("yyyy/MM/dd/HH:mm").format(new Date());
		String result = "";

		log.info(session.getAttribute("ld") + " Logout 현재시간 : "+curTime);
		
		result = "ok";
		session.invalidate();
		map.put("result", result);
		
		return map;
	}
}



/*
public String loginRegPage(MemberVO vo, HttpSession session) {
	String member_id = (String) session.getAttribute("id");
	
	if(member_id != null) {
		return "redirect:/main";
	}
	
	else if(vo.getMember_id().isEmpty() == false) {
	member_id = vo.getMember_id();
	int check = memberService.memberCheckId(member_id);
	}
	return "login/loginRegWrite";
}
*/