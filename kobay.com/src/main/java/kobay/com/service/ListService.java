package kobay.com.service;

import java.util.List;

public interface ListService {

	public List<?> selectList(ListVO vo) throws Exception;
	public int selectListTotal(ListVO vo) throws Exception;
	public String selectListArray(String arrayType) throws Exception;
}
