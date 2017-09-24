package kobay.com.service;

import java.util.List;

public interface KobayService {
	String insertWrite(KobayVO vo) throws Exception;
	
	// 대분류는 조건이 없으므로 vo를 넘기지 않아도 됨
	//List<?> selectctglist(KobayVO vo) throws Exception;
	List<?> selectctglist() throws Exception;
	
	// 중분류는 대분류의 카테고리 값을 넘겨줘야 하므로 매개 변수로  String Lcategory, 혹은  KobayVO vo 를 넘겨주어야 함
	List<?> selectctgmlist(KobayVO vo) throws Exception;
}
