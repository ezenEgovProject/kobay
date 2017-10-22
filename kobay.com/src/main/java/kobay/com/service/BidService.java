package kobay.com.service;

import java.util.List;

public interface BidService {
	
	//Bid List
	List<?> selectBidList(int auctionUnq) throws Exception;
	
	//Bid Insert 
	public void insertBid (BidVO vo) throws Exception;
	
	//Bid Select
	public BidVO selectBid(BidVO vo) throws Exception;
	
	//Max Bid Price
//	public BidVO selectMaxPrice (int auctionUnq) throws Exception;
	
	//Question Update
	public void udateBid(BidVO vo) throws Exception;

}
