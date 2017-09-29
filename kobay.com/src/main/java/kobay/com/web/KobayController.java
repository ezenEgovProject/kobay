package kobay.com.web;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.ClientAbortException;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.ibatis.sqlmap.client.SqlMapClient;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kobay.com.service.KobayService;
import kobay.com.service.KobayVO;
import kobay.com.service.TableVO;

@Controller
public class KobayController {
	@Resource(name = "kobayService")
	private KobayService kobayService;
	
	@Resource(name = "multipartResolver")
	CommonsMultipartResolver multipartResolver;
	
	@RequestMapping("/Write")
	public String Write(Model model) throws Exception{
		
		List<?> ctgList = kobayService.selectctglist();
		
		model.addAttribute("resultList", ctgList);	
		
		return "write/kobayWrite";
	}
	
	@RequestMapping(value="selectMlist")
	@ResponseBody public Map<String, Object> SelectMlist(KobayVO vo,Model model) throws Exception{
		
		List<?> ctgMlist = kobayService.selectctgmlist(vo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultMList", ctgMlist);
		
		return map;
			
	}

	@RequestMapping(value = "/uploadFileSave")
	@ResponseBody public Map<String, String> multipartProcess(final MultipartHttpServletRequest multiRequest,
			HttpServletResponse response,KobayVO vo,Model model,TableVO tvo) throws Exception {
		
		MultipartFile file;
		String filePath = "";
		int cnt = 0;

		Map<String, String> map = new HashMap<String, String>();
		Map<String, MultipartFile> files = multiRequest.getFileMap();
		
		
		String uploadPath = "c:/upload";


		// 폴더의 존재 유무 및 생성

		File saveFolder = new File(uploadPath);
		if (!saveFolder.exists()) {
			saveFolder.mkdirs();
		}

		Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();

		/*
		 * 
		 * MultipartFile 의 주요 메소드는 String getName()파라미터 이름을 구한다. String
		 * getOriginalFilename()업로드 한 파일의 실제!! 이름을 구한다. boolean isEmpty()업로드 한
		 * 파일이 존재하지 않는 경우 true를 리턴 한다. long getSize()업로드한 파일의 크기를 구한다. byte[]
		 * getBytes() throws IOException업로드 한 파일 데이터를 구한다. --> 이걸로 파일 쓰면된다.
		 * InputStream getInputStream()InputStrem을 구한다. void transferTo(File
		 * dest)업로드 한 파일 데이터를 지정한 파일에 저장한다. --> 요고도 파일쓰는거다.
		 */
		
		String filename = "";
		
		while (itr.hasNext()) {
			Entry<String, MultipartFile> entry = itr.next();
			file = entry.getValue();
			if (!"".equals(file.getOriginalFilename())) {
				filePath = uploadPath + "/" + file.getOriginalFilename();
				file.transferTo(new File(filePath));
				
				filename += file.getOriginalFilename() + "／";
				
				cnt++;
			}
		}
			
		vo.setImage(filename);
		
		String[] dr = vo.getDateRange().split(" ~ ");	
				
		try{
		SimpleDateFormat org_frm = new SimpleDateFormat("yyyy-MM-dd H:mm a", Locale.US);
		SimpleDateFormat new_frm = new SimpleDateFormat("yyyy-MM-dd H:mm");
		
		System.out.println(dr[1]);
				
		Date std = org_frm.parse(dr[0]);
		Date end = org_frm.parse(dr[1]);
		
		System.out.println(dr[0]);
		
		String new_std = new_frm.format(std);
		String new_end = new_frm.format(end);
		
		vo.setSdate(new_std);
		vo.setEdate(new_end);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		
		String result="";
		
		result = kobayService.insertWrite(vo);
		
		if(result==null){
			cnt = cnt+1;
		}
		
		map.put("cnt", Integer.toString(cnt));
		System.out.println("cnt -> " + cnt);	
				
//		Map<String, Integer> createMap = new HashMap<String, Integer>();
//		
//		int auction_unq = 1;
//		int member_unq = 2;
//		
//		createMap.put("auction_unq", auction_unq);
//		createMap.put("member_unq", member_unq);
		
		int seqn = kobayService.selectSeqNumber();
		
		tvo.setAuction_unq(seqn);
		tvo.setMember_unq(1);
		
		kobayService.createTable(tvo);
		
		return map;
	}
	
	
	
}
