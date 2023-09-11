package org.eunsol.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;


import org.eunsol.domain.PerformanceVO;
import org.eunsol.service.PerformanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
public class PerformanceController {
	@Setter(onMethod_= {@Autowired})
	private PerformanceService service;
	
	//상품 등록페이지로 이동하는 것.
	@GetMapping("/performance")
	public  void performance(Model model) {
		model.addAttribute("list", service.getList());
	}
	//상품 상세페이지로 이동하는 것.
	@GetMapping("/performanceView")
	public void performanceView(@ModelAttribute("num") int num, Model model) {
		log.info(num);
		model.addAttribute("performance", service.get(num));	
	}
	@GetMapping("/performanceRegister")
	public  void performanceRegister() {
		
	}
	@PostMapping("/performanceRegister")
	public String performanceRegister(PerformanceVO pvo, RedirectAttributes rttr) {
		 log.info("=====================================");
	      log.info("register : " + pvo);
	      log.info("=====================================");
		service.register(pvo);
		return "redirect:/performance/performance";
	}
	
	//상품 상세페이지로 이동하는 것.
	@GetMapping("/performanceReservation")
	public void performanceReservation(@ModelAttribute("num") int num,String period,String ptime, String place, String price, Model model) throws ParseException {
		//period 
		//보내줄 담길 날짜 리스트
		List<String> slist = new ArrayList<String>();
		log.info(num);
		log.info(period); //2023.09.16 ~ 2023.09.30
		//받아온 날짜 . 특수문자 제거 
		String period2 = period.replaceAll("[.]","");
		log.info(period2);//20230916 ~ 20230930
		//특수문자 제거된 문자열 분리
		//시작 날짜
		String sdate = period2.substring(0,8); //20230916
		//끝 날짜
		String edate = period2.substring(11); //20230930
		//시작 날짜와 끝 날짜를 Date타입으로 변환시켜주기한 포맷
		DateFormat s1 = new SimpleDateFormat("yyyyMMdd");
		//비교가 끝난 날짜를 년월일 형식으로 바꿔주기위한 포맷
		DateFormat s2 = new SimpleDateFormat("yyyy년MM월dd일 E요일");
		Date s = s1.parse(sdate); //20230916 Date타입
		Date e = s1.parse(edate); //20230930 Date타입
		Calendar c1 = Calendar.getInstance(); //날짜비교를 위한 캘린더
		Calendar c2 = Calendar.getInstance(); //날짜비교를 위한 캘린더
		c1.setTime(s); //시작날짜가 담긴 캘린더
		c2.setTime(e); //끝 날짜가 담긴 캘린더
		//시작날짜가 끝 날짜와 같은 날짜가 될때까지 반복
		//c1.compareTo( c2 ) = c1이 c2와 같아질 때까지
		while(c1.compareTo( c2 ) !=1) {
			//시작날짜와 끝 날짜가 같은날짜일때까지 리스트에 날짜를 넣어줌
			slist.add(s2.format(c1.getTime()));
			//날짜를 한번 비교하고난후 시작날짜에 1일을 더하라
			c1.add(Calendar.DATE, 1);
		}
		
		//ptime
		//보내줄 담길 날짜 리스트
		List<String> vlist = new ArrayList<String>();
		log.info(ptime);
		//첫공연시간
		String ptime1= ptime.substring(0,5);
		//마지막 공연시간
		String ptime2= ptime.substring(6);
		log.info(ptime1);
		log.info(ptime2);
		log.info(place);
		String ptime3 = ptime1+"("+place+")";
		String ptime4 = ptime2+"("+place+")";
		vlist.add(ptime3);
		vlist.add(ptime4);
		model.addAttribute("performance", service.get(num));
		model.addAttribute("period",slist);
		model.addAttribute("ptime",vlist);
		
		log.info("===============" + price);
		String price1 = price.substring(0, 2);
		String price2 = price.substring(3, 6);
		log.info(price1);
		log.info(price2);
		String price3 = price1 + price2;
		log.info(price3);
		model.addAttribute("price", price3);
	
		
	}
	//상품 상세페이지로 이동하는 것.
	@GetMapping("/performancePayment")
	public void performancePayment(@ModelAttribute("num") int num, String pvtime1, Model model)  {
		log.info("====================" + pvtime1);
		model.addAttribute("performance", service.get(num));	
		
	}
	

}
