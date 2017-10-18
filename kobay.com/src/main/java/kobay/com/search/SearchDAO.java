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
	public List<?> selectctglist(){
		return list("selectCtgList");
	}
	public List<?> selectctgmlist(String ctgcd){
		// ctgcd -> 미들 컬럼명
		return list("selectMCtgList",ctgcd);
	}
	
	/**
	 * get List
	 * @return auction list
	 */
	public List<?> getSearchList(PageVO vo) {
		return list("search.getList", vo);
	}
}
