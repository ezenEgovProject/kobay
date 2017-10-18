package kobay.com.search;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kobay.com.cmmn.PageVO;

@Service("searchService")
public class SearchServiceImpl implements SearchService {

	@Resource
	SearchDAO dao;
	
	@Override
	public List<?> selectctglist() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectctglist();
	}

	@Override
	public List<?> selectctgmlist(String lCtg) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectctgmlist(lCtg);
	}

	@Override
	public List<?> getSearchList(PageVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.getSearchList(vo);
	}



}
