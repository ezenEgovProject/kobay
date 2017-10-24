package kobay.com.service;

public interface DetailService {
	//Detail Select
	public DetailVO selectDetail(int auctionUnq) throws Exception;
	
	//Detail Select Winner
	public DetailVO selectWinner(int auctionUnq) throws Exception;
	
	//Detail ePrice Update
	public void epriceUpdate(BidVO bidVO) throws Exception;
}
