package kobay.com.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import kobay.com.service.SearchVO;

@Repository("searchDAO")
public class SearchDAO extends EgovAbstractDAO {

	/**
	 * get Category
	 * @return category list
	 */
	public List<?> selectctglist() throws Exception {
		return list("selectCtgList");
	}
	public List<?> selectctgmlist(SearchVO searchVO) throws Exception {
		return list("search.selectMCtgList",searchVO);
	}
	
	/**
	 * get List
	 * @return auction list
	 */
	public List<?> getSearchList(SearchVO searchVO) throws Exception {
		return list("search.getList", searchVO);
	}
	
	public int getSearchListCnt(SearchVO searchVO) throws Exception {
		return (int)select("search.getListCnt", searchVO);
	}
	
	public int getMCtgList(SearchVO searchVO) throws Exception {
		return (int) select("search.getMCtgList", searchVO);
	}
	public List<?> getNullList() {
		// TODO Auto-generated method stub
		return list("search.nullList");
	}
	
	
	/**
	 * main
	 */
	public List<?> getMainCtgList(String lctg) throws Exception {
		return list("main.selectLctgList", lctg);
	}
	
}
