package kobay.com.service;

public class BidVO {
	
	private int bidUnq = 0;
	private int auctionUnq = 0;
	private int memberUnq = 0;
	private int bidPrice = 0;
	private String bidRdate;
	private int aucStatus = 0;
	public int getBidUnq() {
		return bidUnq;
	}
	public void setBidUnq(int bidUnq) {
		this.bidUnq = bidUnq;
	}
	public int getAuctionUnq() {
		return auctionUnq;
	}
	public void setAuctionUnq(int auctionUnq) {
		this.auctionUnq = auctionUnq;
	}
	public int getMemberUnq() {
		return memberUnq;
	}
	public void setMemberUnq(int memberUnq) {
		this.memberUnq = memberUnq;
	}
	public int getBidPrice() {
		return bidPrice;
	}
	public void setBidPrice(int bidPrice) {
		this.bidPrice = bidPrice;
	}
	public String getBidRdate() {
		return bidRdate;
	}
	public void setBidRdate(String bidRdate) {
		this.bidRdate = bidRdate;
	}
	public int getAucStatus() {
		return aucStatus;
	}
	public void setAucStatus(int aucStatus) {
		this.aucStatus = aucStatus;
	}
	
}