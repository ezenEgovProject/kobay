package kobay.com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import kobay.com.service.BidService;
import kobay.com.service.BidVO;
import kobay.com.service.QnaVO;
import kobay.com.service.TestService;
import kobay.com.service.TestVO;

@Repository(value="BidService")
public class BidServiceImpl implements BidService {

	@Resource(name="bidDAO")
	private BidDAO bidDao;
	
	@Override
	public List<?> selectBidList(int auction_unq) throws Exception {
		return bidDao.selectBidList(auction_unq);
	}
	
	@Override
	public void insertBid(BidVO vo) throws Exception {
		bidDao.insertBid(vo);
	}

	@Override
	public BidVO selectBid(int auction_unq) throws Exception {
		
		return (BidVO) bidDao.selectBid(auction_unq);
	}

	@Override
	public void udateBid(BidVO vo) throws Exception {
		bidDao.updateBid(vo);
	}
}
