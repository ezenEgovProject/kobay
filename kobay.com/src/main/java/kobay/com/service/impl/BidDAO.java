package kobay.com.service.impl;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import kobay.com.service.BidVO;

@Repository(value="bidDAO")
public class BidDAO extends EgovAbstractDAO {
	
	/** Bid Insert **/
	public void insertBid(BidVO bidVO) {
		insert("bid.insertBid", bidVO);
	}
	
	/** MyBid **/
	public BidVO myBid(BidVO bidVO) {
		return (BidVO) select("bid.myPrice", bidVO);
	}
}
