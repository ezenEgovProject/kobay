package kobay.com.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kobay.com.service.BidService;
import kobay.com.service.BidVO;
import kobay.com.service.QnaService;
import kobay.com.service.QnaVO;

@Controller
public class AuctionController {
	
	@Resource(name="QnaService")
	QnaService qnaService;
	
	@Resource(name="BidService")
	BidService bService;
	
	
	// http://localhost:8080/kobayDetail_detail?Auction_unq=1
	@RequestMapping (value="/kobayDetail_detail")
	public String kobayDetail_detailView(@RequestParam("Auction_unq") int auction_unq, Model model) throws Exception {
		
		List<?> list = qnaService.selectQnaList(auction_unq);
		model.addAttribute("qnaResult", list);
	
		return "auction/kobayDetail_detail";
	}
	
	/* QnA리스트 */
//	@RequestMapping (value="/qna")
//	@ResponseBody public Map<String, Object> kobayDetail_detailView(QnaVO vo) throws Exception {
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("qnaResult", vo);
//		
//		return map;
//	}
	
	/* 테스트 */
	@RequestMapping (value="/kobaytest")
	public String kobay_test(QnaVO vo, Model model) throws Exception {
			
		List<?> list = qnaService.selectQnaList(vo.getAuction_unq());
		model.addAttribute("qnaResult", list);
	
		return "auction/test";
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
	
	/* Question Select */
	@RequestMapping (value = "/kobayDetail_selectQuestion", method = RequestMethod.POST)
	@ResponseBody public Map<String, Object> modifyQuestionView(QnaVO vo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		vo = qnaService.selectQuestion(vo.getQna_unq());
		map.put("qnaResult", vo);
		
		return map;
	}

	/* Question Modify Popup  */	
	@RequestMapping (value = "kobayDetail_modifyQuestion_popup", method = RequestMethod.POST)
	public String modifyQuestionPopup (@RequestParam("qna_unq") String qna_unq, Model model) throws Exception {
		int qnaunq = Integer.valueOf(qna_unq);
		QnaVO vo = qnaService.selectQuestion(qnaunq);
		model.addAttribute("vo", vo);
		
		return "auction/popup/kobayDetail_modifypopup";
	}
	
	/* Question Update */
	
	/* 상품 결제정보입력페이지 view 
	 * Auction board 테이블 생성 후 QnaVO -> AuctionVO로 변경필요
	 * 						  vo = qnaService 부분 AuctionService로 변경필요
	 * */
	@RequestMapping (value="/kobayDetail_pay")
	public String kobayDetail_payView(QnaVO vo, Model model) throws Exception {
		
		vo = qnaService.selectQuestion(vo.getAuction_unq());
		model.addAttribute("vo", vo);
		
		return "auction/kobayDetail_pay";
	}
	
	// pop-up return
	@RequestMapping(value="/kobayDetail_BidPopup")
	public String kobayDetail_BidPopup(BidVO vo, Model model) throws Exception {
		
		vo = bService.selectBid(vo.getAuction_unq());
		model.addAttribute("bid", vo);
		//bService.insertBid(vo);
		
		
		return "auction/popup/kobayDetail_bidpopup";
	}
	
	@RequestMapping(value="/kobayDetail_BidInsert", method= RequestMethod.POST)
	public String kobayDetail_BidInsert(BidVO vo) throws Exception {
		
		bService.insertBid(vo);
		
		
		return "auction/test";
	}
}
