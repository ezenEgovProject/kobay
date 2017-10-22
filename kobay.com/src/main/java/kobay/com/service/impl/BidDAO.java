package kobay.com.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import kobay.com.service.BidVO;

@Repository(value="bidDAO")
public class BidDAO extends EgovAbstractDAO {
	
	/** Bid List **/
	public List<?> selectBidList(int auctionUnq) {
		
		return list("bid.selectBidList", auctionUnq);
	}
	
	/** Bid Insert **/
	public void insertBid(BidVO bidVO) {
		insert("bid.insertBid", bidVO);
	}
	
	/** Bid Select **/
	public BidVO selectBid (BidVO vo) {
		return (BidVO) select("bid.selectBid", vo);
	}
	
//	/** Max Bid Price **/
//	public BidVO selectMaxPrice (int auctionUnq) {
//		return (BidVO) select("bid.selectMaxPrice", auctionUnq);
//	}
	
	/** Bid Update **/
	public void updateBid(BidVO vo) throws Exception {
		update("bid.updateBid", vo);
	}

	
}
