package kobay.com.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kobay.com.service.KobayService;
import kobay.com.service.KobayVO;
import kobay.com.service.TableVO;

@Service("kobayService")
public class KobayServiceImpl extends EgovAbstractServiceImpl implements KobayService {
	
	@Resource(name="kobayDAO")
	private KobayDAO kobayDAO;

	@Override
	public String insertWrite(KobayVO vo) throws Exception {
		
		return kobayDAO.insertWrite(vo);
	}

	@Override
	public List<?> selectctglist() throws Exception {
		
		return kobayDAO.selectctglist();
	}

	@Override
	public List<?> selectctgmlist(KobayVO vo) throws Exception {
		return kobayDAO.selectctgmlist(vo);
	}

	@Override
	public String createTable(TableVO tvo) throws Exception {
		
		return kobayDAO.createTable(tvo);
	}

	@Override
	public int selectSeqNumber() throws Exception {
		
		return kobayDAO.selectSeqNumber();
	}

}
