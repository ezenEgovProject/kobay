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
	public List<?> selectctgmlist(PageVO pageVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectctgmlist(pageVO);
	}

	@Override
	public List<?> getSearchList(PageVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.getSearchList(vo);
	}

	@Override
	public int getMCtgList(PageVO pageVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.getMCtgList(pageVO);
	}

	@Override
	public List<?> getlCtgCodes() throws Exception {
		// TODO Auto-generated method stub
		return dao.getlCtgCodes();
	}

	@Override
	public List<?> getmCtgCodes() throws Exception {
		// TODO Auto-generated method stub
		return dao.getmCtgCodes();
	}



}
