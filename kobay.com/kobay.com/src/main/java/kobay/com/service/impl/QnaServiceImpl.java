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
	public List<?> selectQnaList(int auction_unq) throws Exception {
		return qnaDao.selectQnaList(auction_unq);
	}

	@Override
	public void insertQuestion(QnaVO vo) throws Exception {
		qnaDao.insertQuestion(vo);
	}

	@Override
	public QnaVO selectQuestion(int qna_unq) throws Exception {
		return (QnaVO) qnaDao.selectQuestion(qna_unq);
	}

	@Override
	public void udateQuestion(QnaVO vo) throws Exception {
		qnaDao.updateQuestion(vo);
	}
}
