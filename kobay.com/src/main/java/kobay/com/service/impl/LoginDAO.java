package kobay.com.service.impl;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import kobay.com.service.MemberVO;

@Repository("loginDAO")
public class LoginDAO extends EgovAbstractDAO{

	public int loginCheck(MemberVO vo) {
		return (int) select("loginDAO.loginCheck",vo);
	}
}
