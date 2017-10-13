package kobay.com.service.impl;

import java.util.List;
import java.util.Map;

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
	public String selectListArray(String orderCondition) throws Exception {
		
		return listDAO.selectListArray(orderCondition);
	}

	@Override
	public List<?> selectList2(ListVO vo) throws Exception {
	
		return listDAO.selectList2(vo);
	}

	@Override
	public List<?> selectList3(ListVO vo) throws Exception {
		
		return listDAO.selectList3(vo);
	}

	@Override
	public void selectListArray(Map<String, Object> orderCondition) {

		return ;
	}
	
	@Override
	public ListVO selectAucImageMain(ListVO vo) {
	
		return listDAO.selectAucImageMain(vo);
	}

	@Override
	public List<?> selectAucImageMain2(int auctionUnq) throws Exception {
	
		return listDAO.selectAucImageMain2(auctionUnq);
	}
}
