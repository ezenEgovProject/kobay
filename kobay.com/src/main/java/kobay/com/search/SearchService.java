package kobay.com.search;

import java.util.List;

import kobay.com.cmmn.PageVO;


public interface SearchService {

	List<?> selectctglist() throws Exception;
	
	List<?> selectctgmlist(String lCtg) throws Exception;
	
	List<?> getSearchList(PageVO vo) throws Exception;
}
