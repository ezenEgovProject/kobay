package kobay.com.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kobay.com.service.BidService;
import kobay.com.service.BidVO;
import kobay.com.service.DetailService;
import kobay.com.service.DetailVO;
import kobay.com.service.QnaService;
import kobay.com.service.QnaVO;

@Controller
public class AuctionController {
	
	@Resource(name="DetailService")
	DetailService detailService;
	
	@Resource(name="QnaService")
	QnaService qnaService;
	
	@Resource(name="BidService")
	BidService bidService;
	
	// http://localhost:8080/kobayDetail_detail?auctionUnq=1
	@RequestMapping (value="/kobayDetail_detail")
	public String kobayDetail_detailView(DetailVO vo, Model model, HttpSession session) throws Exception {
		vo = detailService.selectDetail(vo.getAuctionUnq());
		model.addAttribute("detailResult", vo);
		
		BidVO bo = new BidVO();
		//bo.setMemberUnq(vo.getMemberUnq());
		bo.setBidmemberUnq((int) session.getAttribute("unq"));
		bo.setAuctionUnq(vo.getAuctionUnq());
		bo = bidService.myBid(bo);
		model.addAttribute("myBid", bo);

		List<?> list = qnaService.selectQnaList(vo.getAuctionUnq());
		model.addAttribute("qnaResult", list);
	
		return "auction/kobayDetail_detail";
	}
	
	
	/* Question Insert */
	@RequestMapping (value = "/kobayDetail_insertQuestion", method= RequestMethod.POST)
	@ResponseBody public Map<String, Object> insertQuestion (QnaVO vo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			qnaService.insertQuestion(vo);
			map.put("qnaResult", "success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put("qnaResult", "fail");
		}
		
		return map;
	}
	
	/* Question Delete */
	@RequestMapping (value="/kobayDetail_deleteQuestion", method= RequestMethod.POST)
	@ResponseBody public Map<String, Object> deleteQuestion (QnaVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			qnaService.deleteQuestion(vo);
			map.put("qnaResult", "success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put("qnaResult", "fail");
		}
		
		return map;
	}
	
	/* Question Select */
	@RequestMapping (value = "/kobayDetail_selectQuestion", method = RequestMethod.POST)
	@ResponseBody public Map<String, Object> modifyQuestionView(QnaVO vo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		vo = qnaService.selectQuestion(vo.getQnaUnq());
		map.put("qnaResult", vo);
		
		return map;
	}

	/* Question Modify Popup  */	
	@RequestMapping (value = "kobayDetail_modifyQuestion_popup")
	public String modifyQuestionPopup (@RequestParam("qnaUnq") String qnaUnq, Model model) throws Exception {
		
		int qnaunq = Integer.valueOf(qnaUnq);
		QnaVO vo = qnaService.selectQuestion(qnaunq);
		model.addAttribute("vo", vo);
		
		return "auction/popup/kobayDetail_modifypopup";
	}
	
	/* Question Update */	
	@RequestMapping (value="/kobayDetail_updateQuestion", method= RequestMethod.POST)
	@ResponseBody public Map<String, Object> updateQuestion (QnaVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			qnaService.updateQuestion(vo);
			map.put("vo", "success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put("vo", "fail");
		}
		
		return map;
	}
	
	/* Answer Insert */
	@RequestMapping (value = "/kobayDetail_insertAnswer", method= RequestMethod.POST)
	@ResponseBody public Map<String, Object> insertAnswer (QnaVO vo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			qnaService.insertAnswer(vo);
			map.put("qnaResult", "success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put("qnaResult", "fail");
		}
		
		return map;
	}
	
	
	/* Bid Insert */
	@RequestMapping (value = "/kobayDetail_bidInsert", method= RequestMethod.POST)
	@ResponseBody public Map<String, Object> kobayDetail_bidInsert(BidVO vo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			bidService.insertBid(vo);
			map.put("bidResult", "success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put("bidResult", "fail");
		}
		
		return map;
	}
	
	
	/* 상품 결제정보입력페이지 view 
	 * Auction board 테이블 생성 후 QnaVO -> AuctionVO로 변경필요
	 * 						  vo = qnaService 부분 AuctionService로 변경필요
	 * */
	
	@RequestMapping (value="/kobayDetail_pay")
	public String kobayDetail_payView(@RequestParam("bidPrice") String bidPrice, DetailVO vo, Model model) throws Exception {
		
		int bidP = Integer.valueOf(bidPrice);
		vo = detailService.selectDetail(bidP);
		model.addAttribute("vo", vo);
		
		vo = detailService.selectDetail(vo.getAuctionUnq());
		model.addAttribute("detailResult", vo);
		
		return "auction/kobayDetail_pay";
	}
	
}
