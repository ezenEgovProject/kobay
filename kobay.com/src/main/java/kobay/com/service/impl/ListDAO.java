package kobay.com.service.impl;

import java.util.List;
import org.springframework.stereotype.Repository;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import kobay.com.service.ListVO;

@Repository(value="listDAO")
public class ListDAO extends EgovAbstractDAO {

	/* 진행중인 리스트 */
	public List<?> selectList1(ListVO vo){

		return list("listDAO.selectList1", vo);
	}
	
	public List<?> selectReList1(ListVO vo) {
		
		return list("listDAO.selectReList1", vo);
	}
	
	public int selectListTotal1(ListVO vo) {
		
		return (int) select("listDAO.selectListTotal1", vo);
	}
	
	/* 진행예정중인 리스트 */
	public List<?> selectList2(ListVO vo) {
		return list("listDAO.selectList2", vo);
	}
	
	public List<?> selectReList2(ListVO vo) {
		
		return list("listDAO.selectReList2", vo);
	}
	
	public int selectListTotal2(ListVO vo) {
		
		return (int) select("listDAO.selectListTotal2", vo);
	}

	/* 마감된 리스트 */
	public List<?> selectList3(ListVO vo) {
		return list("listDAO.selectList3", vo);
	}

	public List<?> selectReList3(ListVO vo) {
		
		return list("listDAO.selectReList3", vo);
	}

	public int selectListTotal3(ListVO vo) {
	
		return (int) select("listDAO.selectListTotal3", vo);
	}
	
	
}
