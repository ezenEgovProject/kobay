package kobay.com.service;

public class ListVO {
	
/*	private int memberUnq; //회원 unique
	private int auctionUnq; //경매 unique
	private String sDate; //경매시작시간
	private int sPrice; //경매시작가격
	private int aucPrice; //낙찰 중 or 낙찰 된 가격
	private String aucTitle; //상품명
	private String aucImageMain; //상품메인이미지
	private String uTime; //경매종료까지 남은시간 (경매마감시간-현재시간)
	private int delStatus; //게시글 삭제여부 (0=노출)
	private String vTime; //게시글 상세보기를 한 시간
	private String orderCondition; //리스트 정렬 조건
	private String curStatus; //경매 진행상태 (예정,진행,마감)-?사용?
*/
	
	private int member_unq;
	private int action_unq;
	private int ar_unq;
	private int auction_price;
	private String grade;
	private String sdate;
	private int sprice;
	private String title;
	private String utime;
	private int auction_del;
	private String v_time;
	private String arrayType; //정렬 기준
	
	public String getArrayType() {
		return arrayType;
	}
	public void setArrayType(String arrayType) {
		this.arrayType = arrayType;
	}
	public int getMember_unq() {
		return member_unq;
	}
	public void setMember_unq(int member_unq) {
		this.member_unq = member_unq;
	}
	public int getAction_unq() {
		return action_unq;
	}
	public void setAction_unq(int action_unq) {
		this.action_unq = action_unq;
	}
	public int getAr_unq() {
		return ar_unq;
	}
	public void setAr_unq(int ar_unq) {
		this.ar_unq = ar_unq;
	}
	public int getAuction_price() {
		return auction_price;
	}
	public void setAuction_price(int auction_price) {
		this.auction_price = auction_price;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public int getSprice() {
		return sprice;
	}
	public void setSprice(int sprice) {
		this.sprice = sprice;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUtime() {
		return utime;
	}
	public void setUtime(String utime) {
		this.utime = utime;
	}
	public int getAuction_del() {
		return auction_del;
	}
	public void setAuction_del(int auction_del) {
		this.auction_del = auction_del;
	}
	public String getV_time() {
		return v_time;
	}
	public void setV_time(String v_time) {
		this.v_time = v_time;
	}
	
	
}
