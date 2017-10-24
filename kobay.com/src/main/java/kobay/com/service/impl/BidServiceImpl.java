package kobay.com.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import kobay.com.service.BidService;
import kobay.com.service.BidVO;

@Repository(value="BidService")
public class BidServiceImpl implements BidService {

	@Resource(name="bidDAO")
	private BidDAO bidDao;
	
	@Override
	public void insertBid(BidVO vo) throws Exception {
		bidDao.insertBid(vo);
	}

	@Override
	public BidVO myBid(BidVO bidVO) throws Exception {
		return bidDao.myBid(bidVO);
	}
	
}
