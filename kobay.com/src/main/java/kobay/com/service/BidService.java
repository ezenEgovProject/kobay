package kobay.com.service;

import java.util.List;

public interface BidService {
	
	//Bid List
	List<?> selectBidList(int auction_unq) throws Exception;
	
	//Bid Insert 
	public void insertBid (BidVO vo) throws Exception;
	
	//Bid Select
	public BidVO selectBid(int auction_unq) throws Exception;
	
	//Question Update
	public void udateBid(BidVO vo) throws Exception;

}
