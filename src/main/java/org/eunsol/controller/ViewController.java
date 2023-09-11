package org.eunsol.controller;

import org.eunsol.domain.MemberVO;
import org.eunsol.domain.Member_authVO;
import org.eunsol.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/view/*")
@Controller
public class ViewController {
	@Setter(onMethod_= {@Autowired})
	private MemberService service;
	@GetMapping("/main")
	public void domain() {
		log.info("main");
	}
	@GetMapping("/membership")
	public void domembership() {
		log.info("membership");
	}
	@PostMapping("/membership")
	public String domembership(MemberVO mvo, Member_authVO mavo, RedirectAttributes rttr) {
		//mvo, mavo가 잘 만들어지는지 확인하기!
		log.info("=================================================");
		log.info("mvo :" + mvo);
		log.info("=================================================");
		log.info("=================================================");
		log.info("mavo : " + mavo);
		log.info("=================================================");
		mvo.setEmail(mvo.getUser_email()+'@'+mvo.getEmail_address());
		log.info(mvo.getEmail());
		mvo.setPhone(mvo.getPhone1()+'-'+mvo.getPhone2()+'-'+mvo.getPhone3());
		log.info(mvo.getPhone());
		mvo.setAddress(mvo.getSample6_postcode()+mvo.getSample6_address()+mvo.getSample6_detailAddress()+mvo.getSample6_extraAddress());
		log.info(mvo.getAddress());
	    rttr.addAttribute("result", "등록");
	    service.register(mvo, mavo);
	    return "redirect:/view/membershiplist";
		
	}
	@GetMapping("/membershiplist")
	public void domembershiplist(Model model) {
		log.info("membershiplist");
		model.addAttribute("list", service.getList());
	}
	@GetMapping("/login")
	public  void loginInput(String error, String logout, Model model) {
		log.info("에러 : " + error);
		log.info("로그아웃 : " + logout);
		
		//값이 있을 경우
		if(error != null) {
			model.addAttribute("error", "로그인오류");
		}
		if(logout != null) {
			model.addAttribute("logout", "로그아웃~!");
		}
	}
    @GetMapping("/logout")
	public void logoutGet() {
    	log.info("로그아웃");
	}
   
}
