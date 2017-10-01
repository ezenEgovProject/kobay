package kobay.com.service;

import java.util.List;

public interface QnaService {
	//QnA List
	List<?> selectQnaList(int auction_unq) throws Exception;
	
	//Question Insert 
	public void insertQuestion(QnaVO vo) throws Exception;
	
	//Question Select
	public QnaVO selectQuestion(int qna_unq) throws Exception;
	
	//Question Update
	public void udateQuestion(QnaVO vo) throws Exception;
}
