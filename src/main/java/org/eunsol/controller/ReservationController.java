package org.eunsol.controller;

import org.eunsol.domain.ReservationVO;

import org.eunsol.service.ReservaionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/performance/*")
@Controller
@AllArgsConstructor
public class ReservationController {
	@Setter(onMethod_= {@Autowired})
	private ReservaionService service;
	
	@PostMapping("/performanceReservation")
	public String performanceReservation(ReservationVO rvo, RedirectAttributes rttr) {
		  log.info("==================================================");
		  log.info(rvo);
		  log.info("==================================================");
		  service.register(rvo);
	      return "redirect:/performance/myPage";
	}
	//상품 상세페이지로 이동하는 것.
	@GetMapping("/myPage")
	public void myPage(Model model) {
			model.addAttribute("list", service.getList());
	}
}
