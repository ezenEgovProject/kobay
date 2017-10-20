package kobay.com.service;

import java.util.List;

public interface SearchService {

	/**
	 * get AuctionCategory(대분류, 중분류)
	 * @return category List
	 * @throws SqlException 
	 */
	List<?> selectctglist() throws Exception;
	List<?> selectctgmlist(SearchVO searchVO) throws Exception;
	
	List<?> getSearchList(SearchVO searchVO) throws Exception;

}
