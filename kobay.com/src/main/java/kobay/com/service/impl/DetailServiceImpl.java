package kobay.com.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import kobay.com.service.BidVO;
import kobay.com.service.DetailService;
import kobay.com.service.DetailVO;


@Repository(value="DetailService")
public class DetailServiceImpl implements DetailService {

	@Resource(name="detailDAO")
	private DetailDAO detailDao;
	
	/** Detail Select **/
	@Override
	public DetailVO selectDetail(DetailVO vo) throws Exception {
		
		return (DetailVO) detailDao.selectDetail(vo);

	}
	
	/** Detail Select Winner **/
	@Override
	public DetailVO selectWinner(int auctionUnq) throws Exception {
		
		return (DetailVO) detailDao.selectWinner(auctionUnq);
	}
	
	/** Detail ePrice Update **/
	@Override
	public void epriceUpdate(BidVO bidVO) throws Exception {
		detailDao.epriceUpdate(bidVO);
	}

	@Override
	public int getMaxBidprice(int auctionUnq) throws Exception {
		// TODO Auto-generated method stub
		return detailDao.getMaxBidprcie(auctionUnq);
	}


}
