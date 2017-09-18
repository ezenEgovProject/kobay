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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import kobay.com.service.LoginService;
import kobay.com.service.MemberVO;

@Controller
public class LoginController {
	
	private static final Logger log = LoggerFactory.getLogger(LoginController.class);
	
	@Resource(name = "loginService")
	private LoginService loginService;
	
	@Resource(name = "jsonView")
	protected MappingJackson2JsonView jsonView;
	
	@RequestMapping("/loginreg")
	public String loginRegPage(HttpSession session) {
		String member_id = (String) session.getAttribute("id");
		
		if(member_id != null) {
			return "redirect:/main";
		}
		return "login/loginRegWrite";
	}
	
	@RequestMapping(value="/login")
	@ResponseBody
	public Map<String, Object> login(MemberVO vo, HttpSession session) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();

		String id = vo.getMember_id();
		String pwd =  vo.getMember_pwd();
		String result = "";
		
		int loginIdentify = loginService.loginCheck(vo);

		if(loginIdentify == 1) {
			session.setAttribute("id", id);
			session.setAttribute("pwd", pwd);
			result = "ok";
			
			String curTime = new SimpleDateFormat("yyyy/MM/dd/HH:mm").format(new Date());
			log.info(session.getAttribute("id") + " Login 현재시간 : "+curTime);
		}
		
		map.put("result", result);
		return map;
	}
}
