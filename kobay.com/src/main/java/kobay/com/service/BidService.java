package kobay.com.service;


public interface BidService {
	
	//Bid Insert 
	public void insertBid (BidVO vo) throws Exception;
	
	//My Bid
	public BidVO myBid (BidVO bidVO) throws Exception;

}
