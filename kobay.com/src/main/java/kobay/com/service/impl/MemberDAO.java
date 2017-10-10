package kobay.com.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import kobay.com.cmmn.PageVO;
import kobay.com.service.MemberVO;

@Repository(value="memberDAO")
public class MemberDAO extends EgovAbstractDAO {
	public void insertMember(MemberVO vo) throws Exception {
		insert("memberDAO.insertMember",vo);
	}

	public int selectMemberTotal(PageVO pageVO) {
		return (int) select("memberDAO.selectMemberTotal",pageVO);
	}
	
	public List<?> selectMemberList(PageVO pageVO) {
		return list("memberDAO.selectMemberList", pageVO);
	}
	
	public MemberVO selectMemberDetail(MemberVO vo) {
		return (MemberVO) select("memberDAO.selectMemberDetail", vo);
	}

	public int memberCheckId(String memberId) {
		return (int) select("memberDAO.memberCheckId",memberId);
	}

}
