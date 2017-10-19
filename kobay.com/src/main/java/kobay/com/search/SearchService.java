package kobay.com.search;

import java.util.List;

import kobay.com.cmmn.PageVO;


public interface SearchService {

	List<?> selectctglist() throws Exception;
	
	List<?> selectctgmlist(PageVO pageVO) throws Exception;
	
	List<?> getSearchList(PageVO vo) throws Exception;
	
	public int getMCtgList(PageVO pageVO) throws Exception;
	
	
	public List<?> getlCtgCodes() throws Exception;
	public List<?> getmCtgCodes() throws Exception;
}
