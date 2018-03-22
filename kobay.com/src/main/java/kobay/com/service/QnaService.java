package kobay.com.service;

import java.util.List;

public interface QnaService {
	//QnA List
	List<?> selectQnaList(int auctionUnq) throws Exception;
	
	//Question Insert 
	public void insertQuestion(QnaVO vo) throws Exception;
	
	//Question Delete
	public void deleteQuestion(QnaVO vo) throws Exception;
	
	//Question Select
	public QnaVO selectQuestion(int qnaUnq) throws Exception;
	
	//Question Update
	public void updateQuestion(QnaVO vo) throws Exception;
	
	//Answer Insert
	public void insertAnswer(QnaVO vo) throws Exception;
	
}
