package kobay.com.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import kobay.com.service.Editor;
import kobay.com.service.KobayService;
import kobay.com.service.KobayVO;

@Controller
public class KobayController {
	@Resource(name = "kobayService")
	private KobayService kobayService;

	@Resource(name = "multipartResolver")
	CommonsMultipartResolver multipartResolver;

	@RequestMapping("/write")
	public String Write(Model model) throws Exception {
		KobayVO vo;
		List<?> ctgList = kobayService.selectctglist();

		model.addAttribute("resultList", ctgList);
		
		return "write/kobayWrite";
	}

	@RequestMapping(value = "selectMlist")
	@ResponseBody
	public Map<String, Object> SelectMlist(KobayVO vo, Model model) throws Exception {

		List<?> ctgMlist = kobayService.selectctgmlist(vo);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resultMList", ctgMlist);

		return map;

	}

	@RequestMapping(value = "/uploadFileSave")
	@ResponseBody
	public Map<String, Object> multipartProcess(final MultipartHttpServletRequest multiRequest,
			HttpServletResponse response, KobayVO vo, Model model, HttpServletRequest request,HttpSession session ) throws Exception {
		
		System.out.println("=================================");
		System.out.println(vo.getAuctitle());
		
		
//		int munq = (int) session.getAttribute("memberUnq");
//		
//		vo.setMemberunq(munq);
			
		int a;
		int b;
		int c;
		
		a = Integer.parseInt(vo.getDw());
		System.out.println("===============================" + vo.getDf());
		
		if(vo.getDf()==null){
			System.out.println("sadfljsdafjsdajfkl");
			b = 0;
		}else{
			b = Integer.parseInt(vo.getDf());
		}

		c = Integer.parseInt(vo.getSp());

		vo.setDeliveryway(a);
		vo.setDeliveryfee(b);
		vo.setSprice(c);

		MultipartFile file;
		String filePath = "";
		int cnt = 0;

		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, MultipartFile> files = multiRequest.getFileMap();

		String uploadPath = request.getSession().getServletContext().getRealPath("upload");

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

		String[] filelist = filename.split("／");

		for(int i=0;i<filelist.length;i++){
			vo.setAucimagemain(filelist[i]);
		}
		
		String[] dr = vo.getDateRange().split(" ~ ");

		try {
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

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String fullphone = vo.getPhone1() + vo.getPhone2() + vo.getPhone3(); 
		
		vo.setSellerphone(fullphone);
		
		String result = "";

		try {
			result = kobayService.insertWrite(vo);
		} catch (Exception e) {
			// TODO: handle exception
			map.put("cnt", 0);
//			e.printStackTrace();
			return map;
		}
		

		if (result == null) {
			cnt = cnt + 1;
		}

		map.put("cnt", cnt);
		System.out.println("cnt -> " + cnt);
		
		
		
		return map;
	}
	
	@RequestMapping(value="/image")
	public void profileUpload(String email, MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 업로드할 폴더 경로
		String realFolder = request.getSession().getServletContext().getRealPath("SummernoteImg");
		UUID uuid = UUID.randomUUID();
		
		System.out.println(realFolder);

		// 업로드할 파일 이름
		String org_filename = file.getOriginalFilename();
		String str_filename = uuid.toString() + org_filename;

		System.out.println("원본 파일명 : " + org_filename);
		System.out.println("저장할 파일명 : " + str_filename);

		String filepath = realFolder + "\\" + str_filename;
		System.out.println("파일경로 : " + filepath);

		File f = new File(filepath);
		if (!f.exists()) {
			f.mkdirs();
		}
		
		file.transferTo(f);
		out.println("SummernoteImg/"+str_filename);
		out.close();
	}
	

}
