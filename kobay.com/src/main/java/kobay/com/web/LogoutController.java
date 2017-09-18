package kobay.com.web;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LogoutController {
	
	private static final Logger log = LoggerFactory.getLogger(LogoutController.class);
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		String curTime = new SimpleDateFormat("yyyy/MM/dd/HH:mm").format(new Date());
		
		log.info(session.getAttribute("id") + " Logout 현재시간 : "+curTime);
		
		session.invalidate();
		
		return "redirect:/loginreg";
	}
}
