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

	/* 진행중인 리스트 */
	@Override
	public List<?> selectList1(ListVO vo) throws Exception {
		
		return listDAO.selectList1(vo);
	}
	
	@Override
	public List<?> selectReList1(ListVO vo) throws Exception {
	
		return listDAO.selectReList1(vo);
	}
	
	@Override
	public int selectListTotal1(ListVO vo) throws Exception {
		
		return listDAO.selectListTotal1(vo);
	}
	
	/* 진행예정중인 리스트 */
	@Override
	public List<?> selectList2(ListVO vo) throws Exception {
	
		return listDAO.selectList2(vo);
	}

	@Override
	public List<?> selectReList2(ListVO vo) throws Exception {
		
		return listDAO.selectReList2(vo);
	}
	
	@Override
	public int selectListTotal2(ListVO vo) throws Exception {
		
		return listDAO.selectListTotal2(vo);
	}
	
	/* 마감된 리스트 */
	@Override
	public List<?> selectList3(ListVO vo) throws Exception {
		
		return listDAO.selectList3(vo);
	}

	@Override
	public List<?> selectReList3(ListVO vo) throws Exception {
		
		return listDAO.selectReList3(vo);
	}
	
	@Override
	public int selectListTotal3(ListVO vo) throws Exception {
		
		return listDAO.selectListTotal3(vo);
	}

}
