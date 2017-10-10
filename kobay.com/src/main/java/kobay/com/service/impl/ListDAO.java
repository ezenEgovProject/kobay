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

	public String selectListArray(String arrayType) {
		
		return (String) select("listDAO.selectListArray", arrayType);
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
	
	
}
