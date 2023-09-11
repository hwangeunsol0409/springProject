package org.eunsol.controller;



import org.eunsol.domain.BoardVO;
import org.eunsol.domain.Criteria;
import org.eunsol.domain.PageDTO;
import org.eunsol.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/board/*")
@Controller
//의존성 주입
@AllArgsConstructor
public class BoardController {
	private BoardService service;
	
	 // 게시글 리스트 list?pageNum=1&amount=10
	   @GetMapping("/list")
	   public void list(Criteria cri, Model model) {
	      model.addAttribute("list", service.getList(cri));
	      int total = service.getTotal(cri);
	      model.addAttribute("pageMaker", new PageDTO(cri, total));
	   }

	   
	//게시글 등록페이지로 이동하는 것.
		@GetMapping("/register")
		public  void register() {
			
		}
	//게시글 등록
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		log.info("register : " + board);
		service.register(board);
		rttr.addAttribute("result", "등록");
		return "redirect:/board/list";
	}
	
	 // 게시글 1개 조회 
	   @GetMapping({"/get", "/modify"})
	   public void get(@RequestParam("bno") Long bno, 
			   @ModelAttribute("cri") Criteria cri,
			   Model model) {
	      log.info("get");
	      BoardVO bvo = service.get(bno);
	      model.addAttribute("board", service.get(bno));
	   }

	// 수정 
	   @PostMapping("/modify")
	   public String modify(BoardVO board, 
			   @ModelAttribute("cri") Criteria cri,
			   RedirectAttributes rttr) {
	      log.info("modify : " + board);
	      if(service.modify(board)) {
	         rttr.addAttribute("result", "수정");
	      }
	      rttr.addAttribute("pageNum", cri.getPageNum());
	      rttr.addAttribute("amount", cri.getAmount());
	      return "redirect:/board/list";
	   }

	//삭제
	@PostMapping("/remove")
	public String remove(Long bno, RedirectAttributes rttr) {
		log.info("remove : " + bno);
		if(service.remove(bno)) {
			rttr.addAttribute("result", "삭제");
		}
		return "redirect:/board/list";
	}

}
