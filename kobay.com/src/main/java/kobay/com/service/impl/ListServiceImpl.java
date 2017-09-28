package kobay.com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import kobay.com.service.ListService;
import kobay.com.service.ListVO;

@Repository(value="listService")
public class ListServiceImpl implements ListService {

	@Resource(name="listDAO")
	private ListDAO listDAO;

	@Override
	public List<?> selectList(ListVO vo) throws Exception {
		
		return listDAO.selectList(vo);
	}

	@Override
	public int selectListTotal(ListVO vo) throws Exception {
		
		return listDAO.selectListTotal(vo);
	}

	@Override
	public String selectListArray(String arrayType) throws Exception {
		
		return listDAO.selectListArray(arrayType);
	}
}
