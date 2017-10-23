package kobay.com.service;

public class BidVO {
	
	private int bid_unq;
	private int auction_unq;
	private int member_unq;
	private String member_name;
	private String member_phone;
	private String member_post;
	private String member_addr1;
	private String member_addr2;
	private int bid_price;
	private String bid_rdate;
	private int bid_status;
	public int getBid_unq() {
		return bid_unq;
	}
	public void setBid_unq(int bid_unq) {
		this.bid_unq = bid_unq;
	}
	public int getAuction_unq() {
		return auction_unq;
	}
	public void setAuction_unq(int auction_unq) {
		this.auction_unq = auction_unq;
	}
	public int getMember_unq() {
		return member_unq;
	}
	public void setMember_unq(int member_unq) {
		this.member_unq = member_unq;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_post() {
		return member_post;
	}
	public void setMember_post(String member_post) {
		this.member_post = member_post;
	}
	public String getMember_addr1() {
		return member_addr1;
	}
	public void setMember_addr1(String member_addr1) {
		this.member_addr1 = member_addr1;
	}
	public String getMember_addr2() {
		return member_addr2;
	}
	public void setMember_addr2(String member_addr2) {
		this.member_addr2 = member_addr2;
	}
	public int getBid_price() {
		return bid_price;
	}
	public void setBid_price(int bid_price) {
		this.bid_price = bid_price;
	}
	public String getBid_rdate() {
		return bid_rdate;
	}
	public void setBid_rdate(String bid_rdate) {
		this.bid_rdate = bid_rdate;
	}
	public int getBid_status() {
		return bid_status;
	}
	public void setBid_status(int bid_status) {
		this.bid_status = bid_status;
	}
	
	
}
