package kobay.com.service.impl;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import kobay.com.service.DetailVO;


@Repository(value="detailDAO")
public class DetailDAO extends EgovAbstractDAO {
	
	/** Detail Select **/
	public DetailVO selectDetail (int auctionUnq) {
		return (DetailVO) select("detail.selectDetail", auctionUnq);
	}
}
