package kobay.com.service;

public class KobayVO {
	private int member_unq;
	private int auction_unq;
	private String category;
	/* view에서 등록기간을 범위로 입력받아 sdate, edate에 저장함 */
	private String dateRange;
	private String sdate;
	private String edate;
	private String title;
	private String image;
	private int sprice;
	private String deliveryway;
	private int deliverypee;
	private String seller;
	private int sellerphone;
	private String detail;
	private int auction_del;
	private String ctgcd;
	private String ctgnm;
	private String Lcategory;
	private String Mcategory;
	
	public String getMcategory() {
		return Mcategory;
	}
	public void setMcategory(String mcategory) {
		Mcategory = mcategory;
	}
	public String getCtgcd() {
		return ctgcd;
	}
	public String getLcategory() {
		return Lcategory;
	}
	public void setLcategory(String lcategory) {
		Lcategory = lcategory;
	}
	public void setCtgcd(String ctgcd) {
		this.ctgcd = ctgcd;
	}
	public String getCtgnm() {
		return ctgnm;
	}
	public void setCtgnm(String ctgnm) {
		this.ctgnm = ctgnm;
	}
	public int getSprice() {
		return sprice;
	}
	public void setSprice(int sprice) {
		this.sprice = sprice;
	}
	public int getMember_unq() {
		return member_unq;
	}
	public void setMember_unq(int member_unq) {
		this.member_unq = member_unq;
	}
	public int getAuction_unq() {
		return auction_unq;
	}
	public void setAuction_unq(int auction_unq) {
		this.auction_unq = auction_unq;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getDeliveryway() {
		return deliveryway;
	}
	public void setDeliveryway(String deliveryway) {
		this.deliveryway = deliveryway;
	}
	public int getDeliverypee() {
		return deliverypee;
	}
	public void setDeliverypee(int deliverypee) {
		this.deliverypee = deliverypee;
	}
	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
	public int getSellerphone() {
		return sellerphone;
	}
	public void setSellerphone(int sellerphone) {
		this.sellerphone = sellerphone;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public int getAuction_del() {
		return auction_del;
	}
	public void setAuction_del(int auction_del) {
		this.auction_del = auction_del;
	}
}