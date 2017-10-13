package kobay.com.service;

import java.util.List;
import java.util.Map;

public interface ListService {

	public List<?> selectList(ListVO vo) throws Exception;
	public List<?> selectList2(ListVO vo) throws Exception;
	public List<?> selectList3(ListVO vo) throws Exception;
	
	public int selectListTotal(ListVO vo) throws Exception;
	public String selectListArray(String orderCondition) throws Exception;
	public void selectListArray(Map<String, Object> orderCondition);
	public ListVO selectAucImageMain(ListVO vo);
	
	public List<?> selectAucImageMain2(int auctionUnq) throws Exception;
	
}

