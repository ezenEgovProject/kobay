package kobay.com.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import kobay.com.service.KobayVO;
import kobay.com.service.TableVO;

@Repository("kobayDAO")
public class KobayDAO extends EgovAbstractDAO {
	
	public String insertWrite(KobayVO vo){
		return (String) insert("kobayDAO.insertWrite",vo);
	}
	
	public List<?> selectctglist(){
		return list("selectCtgList");
	}
	
	public List<?> selectctgmlist(KobayVO vo){
		return list("selectMCtgList",vo);
	}
	
	public String createTable(TableVO tvo){
		return (String) insert("createTable",tvo);
	}
	
	public int selectSeqNumber(){
		return (int) select("selectSeqNumber");
	}
	
}
