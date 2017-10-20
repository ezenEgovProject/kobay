package kobay.com.service;

import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;

public class SearchVO {
	
	
	/** 검색Keyword */
	private String searchKeyword = "";
	/** 정렬조건  */
	private String orderCondition = "";
	/** 카테고리values */
	private List<String> mCtgList;
	/** mCategory*/
	private String mCtgcd;
	/** lCategory*/
	private String ctgcd;
	
	
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

	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
