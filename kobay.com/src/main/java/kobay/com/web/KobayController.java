package kobay.com.web;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import kobay.com.service.KobayService;
import kobay.com.service.KobayVO;
import kobay.com.service.TestVO;

@Controller
public class KobayController {
	@Resource(name = "kobayService")
	private KobayService kobayService;
	
	@Resource(name = "multipartResolver")
	CommonsMultipartResolver multipartResolver;
	
	@RequestMapping("/Write")
	public String Write(KobayVO vo,Model model) throws Exception{
		
		List<?> ctgList = kobayService.selectctglist(vo);
		
		model.addAttribute("resultList", ctgList);	
		
		return "write/kobayWrite";
	}
	
	@RequestMapping(value="selectMlist")
	@ResponseBody public Map<String, Object> SelectMlist(KobayVO vo,Model model) throws Exception{
		
		List<?> ctgMlist = kobayService.selectctgmlist(vo);
		
		//model.addAttribute("resultMList", ctgMlist);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultMList", ctgMlist);
		
		return map;
			
	}

	@RequestMapping(value = "/uploadFileSave")
	@ResponseBody public Map<String, String> multipartProcess(final MultipartHttpServletRequest multiRequest,
			HttpServletResponse response,KobayVO vo,  Model model) throws Exception {
		
		MultipartFile file;
		String filePath = "";
		int cnt = 0;

		Map<String, String> map = new HashMap<String, String>();
		Map<String, MultipartFile> files = multiRequest.getFileMap();
		
		
		String uploadPath = "c:/upload";
//		String uploadPath = egovMessageSource.getMessage("file.upload.path");

		System.out.println("title : " + vo.getTitle());
		System.out.println("path : " + uploadPath);

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
		
		System.out.println(filename);
		
		vo.setImage(filename);
		
		System.out.println("filePath : " + filePath);
		
		String result="";
		
		result = kobayService.insertWrite(vo);
		
		if(result==null){
			cnt = cnt+1;
		}
		
		map.put("cnt", Integer.toString(cnt));
		System.out.println("cnt -> " + cnt);
		return map;
	}
	
	
	
}
