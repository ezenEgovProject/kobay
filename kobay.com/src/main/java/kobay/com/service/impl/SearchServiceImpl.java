package kobay.com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kobay.com.service.SearchService;
import kobay.com.service.SearchVO;

@Service("searchService")
public class SearchServiceImpl implements SearchService {

	@Resource
	SearchDAO searchDao;
	
	@Override
	public List<?> selectctglist() throws Exception {
		// TODO Auto-generated method stub
		return searchDao.selectctglist();
	}
	@Override
	public List<?> selectctgmlist(SearchVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return searchDao.selectctgmlist(searchVO);
	}
	@Override
	public List<?> getSearchList(SearchVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return searchDao.getSearchList(searchVO);
	}
	@Override
	public int getSearchListCnt(SearchVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return searchDao.getSearchListCnt(searchVO);
	}
	@Override
	public List<?> getNullList() throws Exception {
		// TODO Auto-generated method stub
		return searchDao.getNullList();
	}

}
