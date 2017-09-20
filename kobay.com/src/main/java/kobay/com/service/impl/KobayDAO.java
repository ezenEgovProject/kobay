package kobay.com.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import kobay.com.service.KobayVO;
import kobay.com.service.TestVO;

@Repository("kobayDAO")
public class KobayDAO extends EgovAbstractDAO {
	
	public String insertWrite(KobayVO vo){
		return (String) insert("kobayDAO.insertWrite",vo);
	}
	
	public List<?> selectctglist(KobayVO vo){
		return list("selectCtgList",vo);
	}
	
	public List<?> selectctgmlist(KobayVO vo){
		return list("selectMCtgList",vo);
	}
	
}
