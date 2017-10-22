package kobay.com.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kobay.com.service.LoginService;
import kobay.com.service.MemberVO;

@Service("loginService")
public class LoginServiceImpl extends EgovAbstractServiceImpl implements LoginService {
	
	@Resource(name = "loginDAO")
	private LoginDAO loginDAO;
	
	@Override
	public int loginCheck(MemberVO vo) throws Exception{
		return loginDAO.loginCheck(vo);
	}

}
