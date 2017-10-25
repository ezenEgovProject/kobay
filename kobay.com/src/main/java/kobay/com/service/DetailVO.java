package kobay.com.service;

public class DetailVO {

	private int memberUnq = 0;
	private int auctionUnq = 0;
	private String lCtg;
	private String mCtg;
	private String sDate;
	private String eDate;
	private String aucTitle;
	private String aucImageMain;
	private String aucImageSub1;
	private String aucImageSub2;
	private String aucImageSub3;
	private int sPrice = 0;
	private int ePrice = 0;
	private int deliveryWay = 0;
	private int deliveryFee = 0;
	private String sellerName;
	private String sellerPhone;
	private String aucDetail;
	private int aucStatus = 0;
	private int delStatus = 0;
	
	/** auctionBid테이블에서 가져올 정보*/
	private int bidUnq = 0;
	private int bidPrice = 0;
	private int bidmemberUnq = 0;
	private String bidRdate;
	
	public int getMemberUnq() {
		return memberUnq;
	}
	public void setMemberUnq(int memberUnq) {
		this.memberUnq = memberUnq;
	}
	public int getAuctionUnq() {
		return auctionUnq;
	}
	public void setAuctionUnq(int auctionUnq) {
		this.auctionUnq = auctionUnq;
	}
	public String getlCtg() {
		return lCtg;
	}
	public void setlCtg(String lCtg) {
		this.lCtg = lCtg;
	}
	public String getmCtg() {
		return mCtg;
	}
	public void setmCtg(String mCtg) {
		this.mCtg = mCtg;
	}
	
	public String getsDate() {
		return sDate;
	}
	public void setsDate(String sDate) {
		this.sDate = sDate;
	}
	public String geteDate() {
		return eDate;
	}
	public void seteDate(String eDate) {
		this.eDate = eDate;
	}
	public String getAucTitle() {
		return aucTitle;
	}
	public void setAucTitle(String aucTitle) {
		this.aucTitle = aucTitle;
	}
	public String getAucImageMain() {
		return aucImageMain;
	}
	public void setAucImageMain(String aucImageMain) {
		this.aucImageMain = aucImageMain;
	}
	public String getAucImageSub1() {
		return aucImageSub1;
	}
	public void setAucImageSub1(String aucImageSub1) {
		this.aucImageSub1 = aucImageSub1;
	}
	public String getAucImageSub2() {
		return aucImageSub2;
	}
	public void setAucImageSub2(String aucImageSub2) {
		this.aucImageSub2 = aucImageSub2;
	}
	public String getAucImageSub3() {
		return aucImageSub3;
	}
	public void setAucImageSub3(String aucImageSub3) {
		this.aucImageSub3 = aucImageSub3;
	}
	public int getsPrice() {
		return sPrice;
	}
	public void setsPrice(int sPrice) {
		this.sPrice = sPrice;
	}
	public int getePrice() {
		return ePrice;
	}
	public void setePrice(int ePrice) {
		this.ePrice = ePrice;
	}
	public int getDeliveryWay() {
		return deliveryWay;
	}
	public void setDeliveryWay(int deliveryWay) {
		this.deliveryWay = deliveryWay;
	}
	public int getDeliveryFee() {
		return deliveryFee;
	}
	public void setDeliveryFee(int deliveryFee) {
		this.deliveryFee = deliveryFee;
	}
	public String getSellerName() {
		return sellerName;
	}
	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}
	public String getSellerPhone() {
		return sellerPhone;
	}
	public void setSellerPhone(String sellerPhone) {
		this.sellerPhone = sellerPhone;
	}
	public String getAucDetail() {
		return aucDetail;
	}
	public void setAucDetail(String aucDetail) {
		this.aucDetail = aucDetail;
	}
	
	public int getAucStatus() {
		return aucStatus;
	}
	public void setAucStatus(int aucStatus) {
		this.aucStatus = aucStatus;
	}
	public int getDelStatus() {
		return delStatus;
	}
	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}
	public int getBidUnq() {
		return bidUnq;
	}
	public void setBidUnq(int bidUnq) {
		this.bidUnq = bidUnq;
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
	public int getBidmemberUnq() {
		return bidmemberUnq;
	}
	public void setBidmemberUnq(int bidmemberUnq) {
		this.bidmemberUnq = bidmemberUnq;
	}	
	
	
	
}
