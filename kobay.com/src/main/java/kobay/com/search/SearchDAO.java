package kobay.com.search;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import kobay.com.cmmn.PageVO;

@Repository("searchDAO")
public class SearchDAO extends EgovAbstractDAO {

	/**
	 * get Category
	 * @return category list
	 */
	public List<?> selectctglist() throws Exception {
		return list("selectCtgList");
	}
	public List<?> selectctgmlist(PageVO pageVO) throws Exception {
		// ctgcd -> 미들 컬럼명
		return list("search.selectMCtgList",pageVO);
	}
	
	/**
	 * get List
	 * @return auction list
	 */
	public List<?> getSearchList(PageVO vo) throws Exception {
		return list("search.getList", vo);
	}
	
	public int getMCtgList(PageVO pageVO) throws Exception {
		return (int) select("search.getMCtgList", pageVO);
	}
	
	public List<?> getlCtgCodes() throws Exception {
		return list("search.lCtgCodes");
	}
	public List<?> getmCtgCodes() throws Exception {
		return list("search.mctgCodes");
	}
}
