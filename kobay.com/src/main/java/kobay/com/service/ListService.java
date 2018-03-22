package kobay.com.service;

import java.util.List;

public interface ListService {

	public List<?> selectList1(ListVO vo) throws Exception; //진행중인 리스트
	public List<?> selectList2(ListVO vo) throws Exception; //진행예정인 리스트
	public List<?> selectList3(ListVO vo) throws Exception; //마감된 리스트
	
	public List<?> selectReList1(ListVO vo) throws Exception; //진행중인 리스트 div부분 새로고침용
	public List<?> selectReList2(ListVO vo) throws Exception; //진행예정인 리스트 div부분 새로고침용
	public List<?> selectReList3(ListVO vo) throws Exception; //마감된 리스트 div부분 새로고침용
	
	public int selectListTotal1(ListVO vo) throws Exception; //진행중인 데이터 갯수
	public int selectListTotal2(ListVO vo) throws Exception; //진행예정인 데이터 갯수
	public int selectListTotal3(ListVO vo) throws Exception; //마감된 데이터 갯수
	
}

