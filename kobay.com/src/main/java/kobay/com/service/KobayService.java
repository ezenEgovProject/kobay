package kobay.com.service;

import java.util.List;

public interface KobayService {
	String insertWrite(KobayVO vo) throws Exception;
	
	List<?> selectctglist(KobayVO vo) throws Exception;
	
	List<?> selectctgmlist(KobayVO vo) throws Exception;
}
