package kobay.com.cmmn;

import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * @author SuyeonKang
 */
public class PageVO {
	/**
	 * Page Value
	 */
	
	/** 현재페이지 */
	private int pageIndex = 1;

	/** 페이지갯수 */
	private int pageUnit = 10;

	/** 페이지사이즈 */
	private int pageSize = 12;

	/** firstIndex */
	private int firstIndex = 1;

	/** lastIndex */
	private int lastIndex = 1;

	/** recordCountPerPage */
	private int recordCountPerPage = 12;
	
	public int getFirstIndex() {
		return firstIndex;
	}

	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}

	public int getLastIndex() {
		return lastIndex;
	}

	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getPageUnit() {
		return pageUnit;
	}

	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	/**
	 * Search Value
	 */
	private List<String> mCtgList;
	
	public List<String> getmCtgList() {
		return mCtgList;
	}
	public void setmCtgList(List<String> mCtgList) {
		this.mCtgList = mCtgList;
	}
	
	private String mCtgcd;

	public String getmCtgcd() {
		return mCtgcd;
	}
	public void setmCtgcd(String mCtgcd) {
		this.mCtgcd = mCtgcd;
	}
	
	private String ctgcd;
	public String getCtgcd() {
		return ctgcd;
	}

	public void setCtgcd(String ctgcd) {
		this.ctgcd = ctgcd;
	}
	
	/** 검색조건 */
	private String searchCondition = "";

	/** 검색Keyword */
	private String searchKeyword = "";

	/** 검색사용여부 */
	private String searchUseYn = "";

	private String orderCondition = "";
	
	public String getOrderCondition() {
		return orderCondition;
	}
	
	public void setOrderCondition(String orderCondition) {
		this.orderCondition = orderCondition;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
			this.searchKeyword = searchKeyword;
	}

	public String getSearchUseYn() {
		return searchUseYn;
	}

	public void setSearchUseYn(String searchUseYn) {
		this.searchUseYn = searchUseYn;
	}

	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

	
}
