package kobay.com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kobay.com.service.KobayService;
import kobay.com.service.KobayVO;
import kobay.com.service.TestVO;

@Service("kobayService")
public class KobayServiceImpl extends EgovAbstractServiceImpl implements KobayService {
	
	@Resource(name="kobayDAO")
	private KobayDAO kobayDAO;

	@Override
	public String insertWrite(KobayVO vo) throws Exception {
		
		return kobayDAO.insertWrite(vo);
	}

	@Override
	public List<?> selectctglist(KobayVO vo) throws Exception {
		
		return kobayDAO.selectctglist(vo);
	}

	@Override
	public List<?> selectctgmlist(KobayVO vo) throws Exception {
		return kobayDAO.selectctgmlist(vo);
	}

}
