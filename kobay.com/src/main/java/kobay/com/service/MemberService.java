package kobay.com.service;

import java.util.List;

import kobay.com.cmmn.PageVO;

public interface MemberService {

	void insertMember(MemberVO vo) throws Exception;

	int selectMemberTotal(PageVO pageVO);

	List<?> selectMemberList(PageVO pageVO);
	
}
