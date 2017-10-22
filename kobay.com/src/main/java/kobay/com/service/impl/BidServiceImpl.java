package kobay.com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import kobay.com.service.BidService;
import kobay.com.service.BidVO;

@Repository(value="BidService")
public class BidServiceImpl implements BidService {

	@Resource(name="bidDAO")
	private BidDAO bidDao;
	
	@Override
	public List<?> selectBidList(int auctionUnq) throws Exception {
		return bidDao.selectBidList(auctionUnq);
	}
	
	@Override
	public void insertBid(BidVO vo) throws Exception {
		bidDao.insertBid(vo);
	}

	@Override
	public BidVO selectBid(BidVO vo) throws Exception {
		
		return (BidVO) bidDao.selectBid(vo);
	}
	
//	@Override
//	public BidVO selectMaxPrice(int auctionUnq) throws Exception {
//		
//		return (BidVO) bidDao.selectMaxPrice(auctionUnq);
//	}

	@Override
	public void udateBid(BidVO vo) throws Exception {
		
		
		bidDao.updateBid(vo);
	}

	
}
