package org.eunsol.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/hf/*")
@Controller
public class HeaderFooterController {
	@GetMapping("/header")
	public void doheader() {
		log.info("header");
	}
	@GetMapping("/footer")
	public void dofooter() {
		log.info("footer");
	}
}
