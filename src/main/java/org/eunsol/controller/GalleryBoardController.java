package org.eunsol.controller;



import org.eunsol.domain.Criteria;
import org.eunsol.domain.GalleryBoardVO;
import org.eunsol.domain.PageDTO;
import org.eunsol.service.GalleryBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/galleryboard/*")
@AllArgsConstructor
public class GalleryBoardController {
	@Setter(onMethod_= {@Autowired})
	private GalleryBoardService service;

	@GetMapping("/galleryList")
	public void galleryList(Criteria cri, Model model) {
		model.addAttribute("list", service.getList(cri));
		int total = service.getTotal(cri);
	    model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@GetMapping("/galleryRegister")
	public void galleryRegister() {
		
	}
	@PostMapping("/galleryRegister")
	public String postregister(GalleryBoardVO gvo, RedirectAttributes rttr) {
		  log.info("=====================================");
	      log.info("register : " + gvo);
	      log.info("=====================================");
	      service.register(gvo);
	      rttr.addAttribute("result",gvo.getGno());
	      return "redirect:/galleryboard/galleryList";
	}
		 // 게시글 1개 조회 
		   @GetMapping({"/galleryGet", "/galleryModify"})
		   public void get(@RequestParam("gno") int gno, 
				   @ModelAttribute("cri") Criteria cri,
				   Model model) {
		      log.info("get");
		      log.info("게시글 번호입니다" + gno);
		      model.addAttribute("galleryBoard", service.get(gno));
		   }

		//게시글 삭제 요청처리
		@PostMapping("/remove")
		public String remove(int gno, String uploadpath, String filename) {
			//deleteFile(uploadpath, filename);
			service.remove(gno);
			return "redirect:/galleryboard/galleryList";
		}

	// 게시글 수정 요청처리
		   @PostMapping("/galleryModify")
		   public String modify(GalleryBoardVO gvo, 
				   @ModelAttribute("cri") Criteria cri,
				   RedirectAttributes rttr) {
		      log.info("modify : " + gvo);
		      if(service.modify(gvo)) {
		         rttr.addAttribute("result", "수정");
		      }
		      rttr.addAttribute("pageNum", cri.getPageNum());
		      rttr.addAttribute("amount", cri.getAmount());
		      return "redirect:/galleryboard/galleryList";
		   }

}
