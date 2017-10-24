package kobay.com.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import kobay.com.service.QnaVO;
import kobay.com.service.TestVO;

@Repository(value="qnaDAO")
public class QnaDAO extends EgovAbstractDAO {
	
	public List<?> selectQnaList(int auction_unq) throws Exception {
		return list("qna.selectQnaList", auction_unq);
	}
	
	/** Question Insert **/
	public void insertQuestion(QnaVO vo) {
		insert("qna.insertQuestion", vo);
	}
	
	/** Question Select **/
	public QnaVO selectQuestion (int qna_unq) {
		return (QnaVO) select("qna.selectQuestion", qna_unq);
	}
	
	/** Question Update **/
	public void updateQuestion(QnaVO vo) throws Exception {
		update("qna.updateQuestion", vo);
	}
}
