package kobay.com.service;

import java.util.List;

import kobay.com.cmmn.PageVO;

public interface MemberService {

	void insertMember(MemberVO vo) throws Exception;

	int selectMemberTotal(PageVO pageVO);

	List<?> selectMemberList(PageVO pageVO) throws Exception;

	MemberVO selectMemberDetail(MemberVO vo) throws Exception;

	int memberCheckId(String memberId);

	void editProfile(MemberVO vo);

	MemberVO findMember(MemberVO vo);
	
}
