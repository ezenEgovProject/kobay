package kobay.com.service;

import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;

public class SearchVO {
	
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
	
	/** 검색Keyword */
	private String searchKeyword = "";
	/** 정렬조건  */
	private String orderCondition = "";
	/** 카테고리values */
	private List<String> mCtgList;
	/** mCategory */
	private String mCtgcd;
	/** lCategory */
	private String ctgcd;
	
	/** 리스트 갯수 */
	private String listSize;
	
	
	public String getListSize() {
		return listSize;
	}

	public void setListSize(String listSize) {
		this.listSize = listSize;
	}
	
	public String getCtgcd() {
		return ctgcd;
	}

	public void setCtgcd(String ctgcd) {
		this.ctgcd = ctgcd;
	}
	
	public String getmCtgcd() {
		return mCtgcd;
	}
	
	public void setmCtgcd(String mCtgcd) {
		this.mCtgcd = mCtgcd;
	}
	
	public List<String> getmCtgList() {
		return mCtgList;
	}
	
	public void setmCtgList(List<String> mCtgList) {
		this.mCtgList = mCtgList;
	}
	
	public String getOrderCondition() {
		return orderCondition;
	}
	
	public void setOrderCondition(String orderCondition) {
		this.orderCondition = orderCondition;
	}


	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
			this.searchKeyword = searchKeyword;
	}

	
	private int minPrice = 0;
	private int maxPrice = 0;
	private String innerKeyword;
	private String deliveryWay;
	private String aucStatus;
	
	public int getMinPrice() {
		return minPrice;
	}
	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}
	public int getMaxPrice() {
		return maxPrice;
	}
	public void setMaxPrice(int maxPrice) {
		this.maxPrice = maxPrice;
	}
	public String getInnerKeyword() {
		return innerKeyword;
	}
	public void setInnerKeyword(String innerKeyword) {
		this.innerKeyword = innerKeyword;
	}

	public String getDeliveryWay() {
		return deliveryWay;
	}
	public void setDeliveryWay(String deliveryWay) {
		this.deliveryWay = deliveryWay;
	}
	public String getAucStatus() {
		return aucStatus;
	}
	public void setAucStatus(String aucStatus) {
		this.aucStatus = aucStatus;
	}
	
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
	

	
}
