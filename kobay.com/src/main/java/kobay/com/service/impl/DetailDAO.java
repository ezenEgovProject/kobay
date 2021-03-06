package kobay.com.service.impl;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import kobay.com.service.BidVO;
import kobay.com.service.DetailVO;



@Repository(value="detailDAO")
public class DetailDAO extends EgovAbstractDAO {
	
	/** Detail Select **/
	public DetailVO selectDetail (DetailVO vo) {
		return (DetailVO) select("detail.selectDetail", vo);
	}
	
	/** Detail Select Winner **/
	public DetailVO selectWinner (int auctionUnq) {
		return (DetailVO) select("detail.selecWinner", auctionUnq);
	}
	
	
	/** Detail ePrice Update **/
	public void epriceUpdate(BidVO bidVO) throws Exception {
		update("detail.epriceUpdate", bidVO);
	}

	public int getMaxBidprcie(int auctionUnq) {
		// TODO Auto-generated method stub
		return (int)select("bid.maxPrice", auctionUnq);
	}

	
}
