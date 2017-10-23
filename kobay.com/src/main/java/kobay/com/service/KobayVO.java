package kobay.com.service;

public class KobayVO {
	
	private int memberunq;
	private int auctionunq;
	private String dateRange;
	/* view에서 등록기간을 범위로 입력받아 sdate, edate에 저장함 */
	private String sdate;
	private String edate;
	private String ctgcd;
	private String lctg;
	private String mctg;
	private String auctitle;
	private String aucimagemain;
	private String aucimagesub1;
	private String aucimagesub2;
	private String aucimagesub3;
	private int eprice;
	
	private String sellername;
	private String sellerphone;
	private String aucdetail;
	private int sprice;
	private int deliveryfee;
	private int deliveryway;
	
	private int aucstatus;
	private int delstatus;
	
	
	// write 페이지에서 int로 null값 받을때 에러나서 string 형태로 받은 다음 int 형태로 변환하여 vo에 넣어기 위해 만든 변수들
	private String phone1;
	private String phone2;
	private String phone3;
	private String sp;
	private String df;
	private String dw;
	

	

	public String getSp() {
		return sp;
	}

	public void setSp(String sp) {
		this.sp = sp;
	}

	public String getDf() {
		return df;
	}

	public void setDf(String df) {
		this.df = df;
	}

	public String getDw() {
		return dw;
	}

	public void setDw(String dw) {
		this.dw = dw;
	}

	public void setSprice(int sprice) {
		this.sprice = sprice;
	}

	public void setDeliveryfee(int deliveryfee) {
		this.deliveryfee = deliveryfee;
	}

	public void setDeliveryway(int deliveryway) {
		this.deliveryway = deliveryway;
	}

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getPhone3() {
		return phone3;
	}

	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}

	public int getMemberunq() {
		return memberunq;
	}

	public void setMemberunq(int memberunq) {
		this.memberunq = memberunq;
	}

	public int getAuctionunq() {
		return auctionunq;
	}

	public void setAuctionunq(int auctionunq) {
		this.auctionunq = auctionunq;
	}

	public String getCtgcd() {
		return ctgcd;
	}

	public void setCtgcd(String ctgcd) {
		this.ctgcd = ctgcd;
	}

	public String getDateRange() {
		return dateRange;
	}

	public void setDateRange(String dateRange) {
		this.dateRange = dateRange;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
	}

	public String getLctg() {
		return lctg;
	}

	public void setLctg(String lctg) {
		this.lctg = lctg;
	}

	public String getMctg() {
		return mctg;
	}

	public void setMctg(String mctg) {
		this.mctg = mctg;
	}

	public String getAuctitle() {
		return auctitle;
	}

	public void setAuctitle(String auctitle) {
		this.auctitle = auctitle;
	}

	public String getAucimagemain() {
		return aucimagemain;
	}

	public void setAucimagemain(String aucimagemain) {
		this.aucimagemain = aucimagemain;
	}

	public String getAucimagesub1() {
		return aucimagesub1;
	}

	public void setAucimagesub1(String aucimagesub1) {
		this.aucimagesub1 = aucimagesub1;
	}

	public String getAucimagesub2() {
		return aucimagesub2;
	}

	public void setAucimagesub2(String aucimagesub2) {
		this.aucimagesub2 = aucimagesub2;
	}

	public String getAucimagesub3() {
		return aucimagesub3;
	}

	public void setAucimagesub3(String aucimagesub3) {
		this.aucimagesub3 = aucimagesub3;
	}

	public int getSprice() {
		return sprice;
	}

	public int getDeliveryfee() {
		return deliveryfee;
	}

	public int getDeliveryway() {
		return deliveryway;
	}

	public int getEprice() {
		return eprice;
	}

	public void setEprice(int eprice) {
		this.eprice = eprice;
	}

	public String getSellername() {
		return sellername;
	}

	public void setSellername(String sellername) {
		this.sellername = sellername;
	}

	public String getSellerphone() {
		return sellerphone;
	}

	public void setSellerphone(String sellerphone) {
		this.sellerphone = sellerphone;
	}

	public String getAucdetail() {
		return aucdetail;
	}

	public void setAucdetail(String aucdetail) {
		this.aucdetail = aucdetail;
	}

	public int getAucstatus() {
		return aucstatus;
	}

	public void setAucstatus(int aucstatus) {
		this.aucstatus = aucstatus;
	}

	public int getDelstatus() {
		return delstatus;
	}

	public void setDelstatus(int delstatus) {
		this.delstatus = delstatus;
	}

}