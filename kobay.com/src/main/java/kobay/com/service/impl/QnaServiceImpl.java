package kobay.com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import kobay.com.service.QnaService;
import kobay.com.service.QnaVO;

@Repository(value="QnaService")
public class QnaServiceImpl implements QnaService {

	@Resource(name="qnaDAO")
	private QnaDAO qnaDao;
	

	@Override
	public List<?> selectQnaList(int auctionUnq) throws Exception {
		return qnaDao.selectQnaList(auctionUnq);
	}

	@Override
	public void insertQuestion(QnaVO vo) throws Exception {
		qnaDao.insertQuestion(vo);
	}

	@Override
	public void deleteQuestion(QnaVO vo) throws Exception {
		qnaDao.deleteQuestion(vo);
	}
	
	@Override
	public QnaVO selectQuestion(int qnaUnq) throws Exception {
		return qnaDao.selectQuestion(qnaUnq);
	}

	@Override
	public void updateQuestion(QnaVO vo) throws Exception {
		qnaDao.updateQuestion(vo);
	}

	@Override
	public void insertAnswer(QnaVO vo) throws Exception {
		qnaDao.insertAnswer(vo);
		
	}


}
