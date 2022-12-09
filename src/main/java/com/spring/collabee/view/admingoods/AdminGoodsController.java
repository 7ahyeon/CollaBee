package com.spring.collabee.view.admingoods;


import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.spring.collabee.biz.admingoods.AdminGoodsService;
import com.spring.collabee.biz.collections.CollectionsService;
import com.spring.collabee.biz.goods.GoodsVO;


@Controller
@RequestMapping("/adminGoods")
public class AdminGoodsController {
	@Autowired
	private AdminGoodsService adminGoodsService;
	@Autowired
	private CollectionsService collectionsService;
	
	public AdminGoodsController() {
		System.out.println(">> AdminGoodsController() 객체 생성");
	}
	

	//상품등록 페이지로 이동
	@RequestMapping("/adminGoodsInsertPage.do")
	public String adminGoodsInsertPage(HttpServletRequest request, Model model, GoodsVO vo) {
		System.out.println(">> 상품등록 페이지");
		
		model.addAttribute("divisionList", collectionsService.getDivision());
		model.addAttribute("goods", vo);
		return "/admin/adminGoodsInsertPage";
	}
	
	//상품등록하기
	@RequestMapping("/adminGoodsInsert.do")
	public String adminGoodsInsert(GoodsVO vo) throws IllegalStateException, IOException {
		System.out.println(">> 상품 등록 컨트롤러 호출");
		
		System.out.println("받아온 상품등록 데이터 : " + vo);
		
		vo.setDetaileOriFilename(vo.getUploadFileDetailPic().getOriginalFilename());
		vo.setThumOriFilename(vo.getUploadFileMainPic().getOriginalFilename());
		
		vo.setDetaileSysFilename(uploadFile(vo.getUploadFileDetailPic(), vo.getDetaileSysFilename()));
		vo.setThumSysFilename(uploadFile(vo.getUploadFileMainPic(), vo.getThumSysFilename()));
		
		adminGoodsService.adminGoodsInsert(vo);
		return "redirect:/adminGoods/adminGoodsList.do";
	}
		

	
	@RequestMapping("/adminGoodsModifyPage.do")
	public String adminGoodsModifyPage(GoodsVO vo, Model model) {
		System.out.println(">> 상품 수정 페이지로 이동");
		System.out.println("vo : " + vo);
		
		model.addAttribute("divisionList", collectionsService.getDivision());
		model.addAttribute("goods", vo);
		
		return "/admin/adminGoodsModify";
	}
		
	

	@RequestMapping("/adminGoodsModify.do")
	public String adminGoodsModify(GoodsVO vo) throws IllegalStateException, IOException {
		System.out.println(">> 상품 수정 컨트롤러 호출");
		System.out.println("vo : " + vo);
		
		vo.setThumOriFilename(vo.getUploadFileMainPic().getOriginalFilename());
		vo.setDetaileOriFilename(vo.getUploadFileDetailPic().getOriginalFilename());
		
		vo.setThumSysFilename(uploadFile(vo.getUploadFileMainPic(), vo.getThumSysFilename()));
		vo.setDetaileSysFilename(uploadFile(vo.getUploadFileDetailPic(), vo.getDetaileSysFilename()));
		
		adminGoodsService.adminGoodsModify(vo);
		return "redirect:/adminGoods/adminGoodsList.do";
	}
	
	
	@RequestMapping("/adminGoodsDelete.do")
	public String adminGoodsDelete(GoodsVO vo) {
		System.out.println(">> 상품 삭제 컨트롤러 호출 ");
		System.out.println("vo : " + vo);
		
		adminGoodsService.adminGoodsDelete(vo);
		
		
//		return "/admin/adminGoodsList";
		return "redirect:/adminGoods/adminGoodsList.do";
	}
	
	@RequestMapping("/adminGoodsSelect.do")
	public String adminGoodsSelect(GoodsVO vo, Model model) {
		System.out.println(">> 상품 상세 보여주기");
		System.out.println("vo : " + vo);
		
		GoodsVO goods = adminGoodsService.adminGoodsSelect(vo);
		
		model.addAttribute("divisionList", collectionsService.getDivision());
		model.addAttribute("goods", goods);
		System.out.println("goods : " + goods);
		
		return "/admin/adminGoodsSelect";
	}
	
	
	@RequestMapping("/adminGoodsList.do")
	public String adminGoodsList(GoodsVO vo, Model model) {
		System.out.println(">> 상품목록 페이지");
		System.out.println("vo : " + vo);
		
		List<GoodsVO> list = adminGoodsService.adminGoodsList(vo);
		
		model.addAttribute("goodsList", list);

		return "/admin/adminGoodsList";
	}
	
	private String uploadFile(MultipartFile file, String sysFileName) throws IllegalStateException, IOException {
		
		MultipartFile uploadFile = file;
		String saveFileName = null;
		
		if (uploadFile == null) {
			System.out.println("::: uploadFile 파라미터가 전달되지 않았을때~");
		} else if (!uploadFile.isEmpty()) {
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd_hhmmss");
			saveFileName = sysFileName + "_" + sdf.format(timestamp) + ".jpg";
			uploadFile.transferTo(new File("c:/Users/itwill/git/collabee/src/main/webapp/resources/imgs/goods/" + saveFileName));
		}
		return saveFileName;
	}
			
}
