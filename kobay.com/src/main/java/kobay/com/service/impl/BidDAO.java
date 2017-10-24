package kobay.com.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import kobay.com.service.BidVO;

@Repository(value="bidDAO")
public class BidDAO extends EgovAbstractDAO {
	
	/** Bid List **/
	public List<?> selectBidList(int auction_unq) {
		
		return list("bid.selectBidList", auction_unq);
	}
	
	/** Bid Insert **/
	public void insertBid(BidVO vo) {
		insert("bid.insertBid", vo);
	}
	
	/** Bid Select **/
	public BidVO selectBid (int auction_unq) {
		return (BidVO) select("bid.selectBid", auction_unq);
	}
	
	/** Bid Update **/
	public void updateBid(BidVO vo) throws Exception {
		update("bid.updateBid", vo);
	}

	
}
