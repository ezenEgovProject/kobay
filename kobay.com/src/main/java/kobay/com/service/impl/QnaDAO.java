package kobay.com.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import kobay.com.service.QnaVO;

@Repository(value="qnaDAO")
public class QnaDAO extends EgovAbstractDAO {
	
	public List<?> selectQnaList(int auctionUnq) throws Exception {
		return list("qna.selectQnaList", auctionUnq);
	}
	
	/** Question Insert **/
	public void insertQuestion(QnaVO vo) {
		insert("qna.insertQuestion", vo);
	}
	
	/** Question Delete **/
	public void deleteQuestion(QnaVO vo) {
		update("qna.deleteQuestion", vo);
	}
	
	/** Question Select **/
	public QnaVO selectQuestion (int qnaUnq) {
		return (QnaVO) select("qna.selectQuestion", qnaUnq);
	}
	
	/** Question Update **/
	public void updateQuestion(QnaVO vo) throws Exception {
		update("qna.updateQuestion", vo);
	}
	
	/** Answer Insert **/
	public void insertAnswer(QnaVO vo) {
		insert("qna.insertAnswer", vo);
	}
}
