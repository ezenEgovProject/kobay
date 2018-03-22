package kobay.com.service;

public class ListVO {
	
	private int memberUnq; //회원 unique
	private int auctionUnq; //경매 unique
	private String sDate; //경매시작시간
	private String eDate; //경매마감시간
	private String LCTG; //대분류
	private String MCTG; //중분류
	private int sPrice; //경매시작가격
	private int ePrice; //경매마감가격
	private String aucTitle; //경매글제목
	private int aucImageMain; //상품메인이미지
	private int delStatus; //게시글 삭제여부 (0=노출)
	private String uTime; //경매종료까지 남은시간 (경매마감시간-현재시간)
	private String vTime; //게시글 상세보기를 한 시간
	private String orderCondition; //리스트 정렬 조건
	private String curStatus; //경매 진행상태 (예정,진행,마감)-?사용?
	
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
	public String getLCTG() {
		return LCTG;
	}
	public void setLCTG(String lCTG) {
		LCTG = lCTG;
	}
	public String getMCTG() {
		return MCTG;
	}
	public void setMCTG(String mCTG) {
		MCTG = mCTG;
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
	public String getAucTitle() {
		return aucTitle;
	}
	public void setAucTitle(String aucTitle) {
		this.aucTitle = aucTitle;
	}
	public int getAucImageMain() {
		return aucImageMain;
	}
	public void setAucImageMain(int aucImageMain) {
		this.aucImageMain = aucImageMain;
	}
	public int getDelStatus() {
		return delStatus;
	}
	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}
	public String getuTime() {
		return uTime;
	}
	public void setuTime(String uTime) {
		this.uTime = uTime;
	}
	public String getvTime() {
		return vTime;
	}
	public void setvTime(String vTime) {
		this.vTime = vTime;
	}
	public String getOrderCondition() {
		return orderCondition;
	}
	public void setOrderCondition(String orderCondition) {
		this.orderCondition = orderCondition;
	}
	public String getCurStatus() {
		return curStatus;
	}
	public void setCurStatus(String curStatus) {
		this.curStatus = curStatus;
	}

}
