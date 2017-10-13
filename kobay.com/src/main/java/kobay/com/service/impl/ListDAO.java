package kobay.com.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import kobay.com.service.ListVO;

@Repository(value="listDAO")
public class ListDAO extends EgovAbstractDAO {

	public List<?> selectList(ListVO vo){

		return list("listDAO.selectList", vo);
	}

	public int selectListTotal(ListVO vo) {
		
		return (int) select("listDAO.selectListTotal", vo);
	}

	public String selectListArray(String orderCondition) {
		
		return (String) select("listDAO.selectListArray", orderCondition);
	}

	public List<?> selectList2(ListVO vo) {
		return list("listDAO.selectList2", vo);
	}

	public List<?> selectList3(ListVO vo) {
		return list("listDAO.selectList3", vo);
	}

	public Object selectListArray(Map<String, Object> orderCondition) {
		
		return list("listDAO.selectListArray", orderCondition);
	}

	public ListVO selectAucImageMain(ListVO vo) {
		
		return (ListVO) select("listDAO.selectAucImageMain", vo);
	}

	public List<?> selectAucImageMain2(int auctionUnq) {
		
		return (List<?>) select("listDAO.selectAunImageMain2", auctionUnq);
	}
	
	
}
