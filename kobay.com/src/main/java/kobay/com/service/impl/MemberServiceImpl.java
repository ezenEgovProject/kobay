package kobay.com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kobay.com.cmmn.PageVO;
import kobay.com.service.MemberService;
import kobay.com.service.MemberVO;

@Service(value="memberService")
public class MemberServiceImpl extends EgovAbstractServiceImpl implements MemberService {

	@Resource(name="memberDAO")
	private MemberDAO memberDAO;
	
	
	@Override
	public void insertMember(MemberVO vo) throws Exception {
		memberDAO.insertMember(vo);
	}


	@Override
	public int selectMemberTotal(PageVO pageVO) {
		return memberDAO.selectMemberTotal(pageVO);
	}


	@Override
	public List<?> selectMemberList(PageVO pageVO) {
		return memberDAO.selectMemberList(pageVO);
	}


	@Override
	public MemberVO selectMemberDetail(MemberVO vo) throws Exception {
		return memberDAO.selectMemberDetail(vo);
	}


	@Override
	public int memberCheckId(String memberId) {
		return  memberDAO.memberCheckId(memberId);
	}

}
