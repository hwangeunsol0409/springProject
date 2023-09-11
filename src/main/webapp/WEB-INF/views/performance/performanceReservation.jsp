<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  ﻿<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ include file="../hf/header.jsp" %>
<!-- Masthead-->
        <header class="masthead bg-primary text-white text-center">
            <div class="container d-flex align-items-center flex-column">
                <!-- Masthead Heading-->
                <h1 class="masthead-heading text-uppercase mb-0">공연 예매</h1>
                <!-- Icon Divider-->
                <div class="divider-custom divider-light">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Masthead Subheading-->
                <p class="masthead-subheading font-weight-light mb-0">Performance Reservation</p>
            </div>
        </header>
  <section class="page-section portfolio" id="portfolio">
            <div class="container">
               <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <br>
<!-- 모달추가   : alter창 띄우는거랑 같은 역할이다/ -->
   <div id="modal2">
      <div id="modalbox2">
         <h3>예매 안내</h3>
         <div>
             <p>&lt;예매 시 주의사항&gt;<br>해당공연은&nbsp;&lt;초등학생이상관람가(미취학아동&nbsp;관람불가)&gt;&nbsp;입니다.&nbsp;<br>관람등급&nbsp;미숙지로&nbsp;공연당일&nbsp;취소/변경/환불이&nbsp;일체&nbsp;불가능하오니&nbsp;유의하시기&nbsp;바랍니다.</p>
         </div>
         <button id="modalclose2">확인</button>
      </div>
   </div>
<!-- 모달추가 끝 -->
<!-- 예매정보 상단 -->

   <div class="total_wrap">
            <div class="s_inner">
                <!-- 예매 선택정보 --->
                <ul class="total_list">
                    <li>
                        <span class="poster">  <img src="/perUpload/display?fileName=${performance.fullname}" alt="${performance.alt}"></span>
                           <div class="total_tit">
                                   공연명
                           </div>
                           <div><c:out value="${performance.name}"/></div>
                    </li>
                   
                    <li>
                        <div class="total_tit">관람일시</div>
                        <div>
                           <p id="pvtime1" ></p>
                           <p id="pvtime2"  ></p>
                            <!-- 날짜선택, 시간선택 -->
                            <!--  <p>2018년 06월 13일 수요일</p> -->
                            <!-- <p>2회 14:00</p>  -->
                        </div>
                    </li>
                    <li>
                        <div class="total_tit">선택좌석</div>
                        <div id="sit">
                           <p id="sit1" class="totalresult"></p>
                           <p id="sit2" class="totalresult"></p>
                            <!-- 좌선선택
                            A석 2층 E10-9번, A석 2층 E10-10번-->
                        </div>
                    </li>
                    <li>
                        <div class="total_tit">결제정보</div>
                        <div>
                            <dl>
                                <dt>티켓금액</dt>
                                <dd><span><c:out value="${performance.price}"/></span></dd>
                            </dl>
                        </div>
                    </li>
                    <li>
                        <div class="total_tit">총 결제금액</div>
                        <div><span class="price totalresult">0</span><span class="won">원</span></div>
                    </li>
                </ul>
                <!-- //예매 선택정보 --->
            </div>
        </div>
 <!-- 예매정보 상단 끝 -->
 <!-- 예매선택  -->
        <div class="performance1" style="display: block;">
                <div class="box_step">
                    <dl>
                        <dt><span class="round">STEP 1</span> 관람일 선택</dt>
                        <dd id="period">
                            <ul class="list_type">
                           <c:forEach items="${period}" var="date">
                                <li class="">
                                    <button class="period1"><c:out value="${date}"/></button>
                               
                                    <!-- <input type="hidden" value="20230916"> -->
                                </li>
                            </c:forEach> 
                            </ul>
                        </dd>
                    </dl>
                    <dl>
                        <dt><span class="round">STEP 2</span> 관람시간 선택</dt>
                        <dd id="ptimere">
                            <!-- 선택 날짜에 관한 관람시간 리스트 -->
                            <ul class="list_type">
                            <c:forEach items="${ptime}" var="date">
                                <li class="">
                                    <button class="ptime"><c:out value="${date}"/></button>
                               
                                    <!-- <input type="hidden" value="20230916"> -->
                                </li>
                            </c:forEach> 
                            </ul>
                            <!--  선택 전
                            -->
                            
                        </dd>
                        <dd id="txt_comment1">관람일을 선택해주세요 </dd>
                    </dl>
                    
                    <dl>
                        <dt><span class="round">STEP 3</span> 좌석 및 잔여석 확인</dt>
                        <dd id="set">
                        
                            <!-- 선택 시간에 관한 좌석 및 잔여석 -->
                            <ul>
                               <li>인원 수  (* 최대 인원수 선택은 8명입니다.)</li>
                        <li>
                           <input type='button' onclick='count("minus")'value='-'/>
                           <div id='result'>1</div>
                           <input type='button' onclick='count("plus")' value='+'/>
                           명
                        </li>
                            </ul>
                            <ul id="sul">
                               <li>좌석선택 : 
                                   <select class="selects"   onchange="changeSelect(this.value)" name="selects">
                              <option value="" selected disabled>==좌석 선택==</option>
                              <option value="1">1</option>
                              <option value="2">2</option>
                              <option value="3">3</option>
                              <option value="4">4</option>
                              <option value="5">5</option>
                              <option value="6">6</option>
                              <option value="7">7</option>
                              <option value="8">8</option>
                              <option value="9">9</option>
                              <option value="10">10</option>
                              <option value="11">11</option>
                              <option value="12">12</option>
                              <option value="13">13</option>
                              <option value="14">14</option>
                              <option value="15">15</option>   
                           </select>번
                        </li>
                            </ul>
                             <button value="choice" id="choice">선택 완료</button>
                            <div> <img src="/resources/img/s.PNG" alt="공연장"></div>
                           
                            <!--  선택 전
                            -->
                        </dd>
                        <dd id="txt_comment2">관람시간을 선택해주세요. </dd>
                    </dl>
                </div>
                <div class="btn_step">
                	<!-- 버튼 클릭------------ -->
                    <button type="button" class="bt_next performancebtn1" onclick="onperformance()" > 다음단계 </button>
                </div>
                </div>
 <!-- 예매선택 끝  -->


<form class="reservation" name="reservationForm" method="post" action="/performance/performanceReservation"> 
 <!-- 결제선택 -->
  <div class="performance2" style="display: none;">
        <div>
                <div class="box_step">
                    <dl>
                        <dt><span class="round">STEP 4</span> 결제수단</dt>
                        <dd>
                            <ul id="paycd">
                                <li><input type="radio" name="paycd" value="신용/체크카드">신용/체크카드</li>
                                <li><input type="radio" name="paycd" value="실시간계좌이체" >실시간계좌이체</li>
                                <li><input type="radio" name="paycd" value="카카오페이">카카오페이</li>
                            </ul>
                         </dd>
                     </dl>
                </div>    
            </div>
               <div class="btn_step2">
                	<button type="button" class="bt_prev performancebtn"  onclick="onperformance2()">이전단계</button>
                    <button type="button" class="bt_next performancebtn2">다음단계</button>  
                </div>
    </div>
 
    
<!-- 결제선택 끝-->
 <!-- 모달-->
 		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
 		<input type="hidden" name="num" value="${performance.num}"/>
 		<input type="hidden" name="id" value="<sec:authentication property="principal.member.id"/>"/>
 		<input type="hidden" name="photo" value="${performance.photo}"/>
 		<input type="hidden" name="name" value="${performance.name}"/>
 		<input type="hidden" id="viewday" name="viewday"/>
 		<input type="hidden" id="viewday2" name="viewday2"/>
 		<input type="hidden" id="peoplenum" name="peoplenum"/>
 		<input type="hidden" id="seatnum" name="seatnum"/>
 		<input type="hidden" name="vtime" value="${performance.vtime}"/>
 		<input type="hidden" name="price" value="${performance.price}"/>
 		<input type="hidden" id="total" name="total"/>
 		<input type="hidden" name="filename" value="${performance.filename}"/>
 		<input type="hidden" name="uploadpath" value="${performance.uploadpath}"/>
 		<input type="hidden" name="fullname" value="${performance.fullname}"/>
 		<input type="hidden" name="alt" value="${performance.alt}"/>
 	
		<div id="modal3">
		       <div id="modalbox3">
		            <h4 class="b_tit">예매내역 확인</h4>
		            <div class="b_con">
		                <div>
		                    <div class="final_info">
		                        <div>
		                            <h5>예매정보 <span class="desc">결제하시기 전 예매내역을 다시 한번 확인해 주세요.</span></h5>
		                            <div>
		                               <span class="poster">  <img src="/perUpload/display?fileName=${performance.fullname}" alt="${performance.alt}"></span>
		                                <div class="set">
		                                    <dl>
		                                        <dt>공연제목</dt>
		                                        <dd><strong class="t_navy"><c:out value="${performance.name}"/></strong></dd>
		                                    </dl>
		                                    <dl>
		                                        <dt>공연 장소 및 일시</dt>
		                                        <dd id="pdate1"></dd>
		                                        <dd id="pdate2"></dd>
		                                    </dl>
		                                    <dl>
		                                        <dt>선택좌석</dt>
		                                        <dd id="pseat1"></dd>
		                                         <dd id="pseat2"></dd>
		                                    </dl>
		                                </div>
		                            </div>
		                        </div>
		                        <div class="pay_info">
		                            <h5>결제정보 <span class="desc">결제하기 버튼을 클릭하시면 결제가 진행됩니다.</span></h5>
		                            <div class="set">
		                                <dl>
		                                    <dt>결제수단</dt>
		                                    <dd><strong id="pay"></strong></dd>
		                                </dl>
		                                <dl>
		                                    <dt>결제금액</dt>
		                                    <dd>
		                                        <ul class="calc">
		                                            <li><em>티켓금액</em><span><c:out value="${performance.price}"/></span></li>
		                                            <li><em>최종결제금액</em><span class="price"></span><span class="won">원</span></li>
		                                        </ul>
		                                    </dd>
		                                </dl>
		
		                            </div>
		                        </div>
		                    </div>
		                    <div class="final_rule">
		                        <div class="agree_box">
		                            <div>
		                                <p>해당공연은 &lt;초등학생이상관람가(미취학아동 관람불가)&gt; 입니다. 
		관람등급 미숙지로 공연당일 취소/변경/환불이 일체 불가능하오니 유의하시기 바랍니다.</p>
		                            </div>
		                            
		<div class="con">
		          <p>1. 티켓 수령 : 마이페이지 &gt; 예매 및 등록현황 &gt; 출력 시 나오는 예매확인증 지참 </p>
		      <!--     <p>2. 좌석 변경 : 마이페이지 &gt; 예매내역현황 &gt; 좌석변경에서 가능</p> -->
		          <p>2. 공연 결제완료 후 결제 수단 등 변경 시 취소 후 재결제하셔야 합니다. 이로 인해 좌석이 변경될 수 있으며, 환불수수료는 고객 부담입니다.</p>
		          <p>3. 공연당일 공연 날짜, 시간 변동 불가</p>
		          <p>&nbsp;</p>
		    <p>&nbsp;</p>
		    <ul>
		        <li>☆예매취소 및 환불규정☆</li>
		        <li>&nbsp;&nbsp;· 예매 후 7일 이내 취소 (단, 공연일로부터 14일 이전 예매에 한함) : 수수료 없음</li>
		        <li>&nbsp;&nbsp;· 예매 후 8일 ~ 공연일 7일 전 : 티켓금액의 10% 취소수수료 공제 후 환급</li>
		        <li>&nbsp;&nbsp;· 공연일 6일 전 ~ 공연일 3일 전 : 티켓금액의 20% 취소수수료 공제 후 환급</li>
		        <li>&nbsp;&nbsp;· 공연일 2일 전 ~ 공연일 1일 전 17시 : 티켓금액의 30% 취소수수료 공제 후 환급</li>
		        <li>&nbsp;&nbsp;· 공연일 1일 전 17시 이후 ~ 공연 당일 : 환급불가</li>
		        
		    </ul>
		</div>
		                        </div>
		                        <div class="mb20"><input type="checkbox" id="all_chk1" class="checkbox">예매 유의사항에 동의합니다.</div>
		                        <!-- //공연별 예매 유의사항 -->
		
		                    </div>
		                </div>
		                <div class="btn_canOk">
		                    <button type="reset" class="bt_cancle">취소하기</button>
		                    
		                        <button type="button" class="bt_ok" onclick="OnPay()">결제하기</button>
		                    
		                </div>
		            </div>
		            <button type="button"  id="bt_close">닫기</button>
		            </div>
		        </div>
		 </form>
<!-- 모달 끝 -->
 
 
 

 <div class="reserve_note">
    <div class="tit"><strong>예매 시 주의사항</strong></div>                        
   <div class="con">
          <p>1. 티켓 수령 : 마이페이지 &gt; 예매 및 등록현황 &gt; 출력 시 나오는 예매확인증 지참 </p>
      <!--     <p>2. 좌석 변경 : 마이페이지 &gt; 예매내역현황 &gt; 좌석변경에서 가능</p> -->
          <p>2. 공연 결제완료 후 결제 수단 등 변경 시 취소 후 재결제하셔야 합니다. 이로 인해 좌석이 변경될 수 있으며, 환불수수료는 고객 부담입니다.</p>
          <p>3. 공연당일 공연 날짜, 시간 변동 불가</p>
          <p>&nbsp;</p>
          <ul>
              <li>☆예매취소 및 환불규정☆</li>
              <li>&nbsp;&nbsp;· 예매 후 7일 이내 취소 (단, 공연일로부터 14일 이전 예매에 한함) : 수수료 없음</li>
              <li>&nbsp;&nbsp;· 예매 후 8일 ~ 공연일 7일 전 : 티켓금액의 10% 취소수수료 공제 후 환급</li>
              <li>&nbsp;&nbsp;· 공연일 6일 전 ~ 공연일 3일 전 : 티켓금액의 20% 취소수수료 공제 후 환급</li>
              <li>&nbsp;&nbsp;· 공연일 2일 전 ~ 공연일 1일 전 17시 : 티켓금액의 30% 취소수수료 공제 후 환급</li>
              <li>&nbsp;&nbsp;· 공연일 1일 전 17시 이후 ~ 공연 당일 : 환급불가</li>   
          </ul>
      </div>     
    </div>
<!-- Icon Divider-->
      <div class="divider-custom">
      <div class="divider-custom-line"></div>
      <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
      <div class="divider-custom-line"></div>
      </div>
   </div>
   <script type="text/javascript">
   let sarr = [];
   
      //닫기 누르면 모달창 안보이게!
      document.querySelector("#modalclose2").addEventListener("click", function() {
    	  console.log("Aaa");
         document.querySelector("#modal2").style.display = 'none';
      });
      $(document).ready(function() {
          
          $('.period1').click(function(){
            let period1= $('.period1');
            period1.css({"background-color":"#f5f5f5"});
             document.querySelector('#ptimere').style.display = 'block';
              document.querySelector("#txt_comment1").style.display = 'none';
              $(this).css({"background-color":"#bbccdd"});
              $("#pvtime1").html($(this).text()); //0000년 00월 00일 
              
              //공연날짜를 값을 변수에 넣는 것! 
              let totaldate =  document.querySelector('#pvtime1').innerText;
              console.log("+++++" + totaldate);
      
              $("#pdate1").text(totaldate);
              //input에 값을 넣어주는 것.
           	  $("#viewday").val(totaldate);
             
         });   
         $('.ptime').click(function(){
             
             let ptime= $('.ptime');
             ptime.css({"background-color":"#f5f5f5"});
             $(this).css({"background-color":"#bbccdd"});
             $("#pvtime2").html($(this).text()); //00시 00분 
             
             //공연시간을 값을 변수에 넣는 것! 
             let totaldate2 =  document.querySelector('#pvtime2').innerText;
             console.log("+++++" + totaldate2);
             
             $("#pdate2").text(totaldate2);
             $("#viewday2").val(totaldate2);
          
            
          });
          $('.ptime').click(function(){
             document.querySelector("#set").style.display = 'block';
             document.querySelector("#txt_comment2").style.display = 'none';
             
          });
        $('#choice').click(function(){
           let str = "";
           str += "인원수 : " + $('#result').text()+"명";
           let str2 = ""; 
           $('.selects').each((index,selects)=>{
              str2 += selects.value;
              if(index < Number($('#result').text())-1){
                 str2 += ", ";
              }
           })
           $("#sit1").text(str); ///인원수
           //input에 값을 넣어주는 것.
           $("#peoplenum").val(str);
           $("#sit2").text("좌석번호 : " + str2); //좌석번호(STring)
           //input에 값을 넣어주는 것.
           $("#seatnum").val(str2);
           
          
           let price1 = ${price};
             console.log(price1);
             let pricetotal = price1 * $('#result').text();
             console.log(pricetotal);
             $('.price').text(pricetotal); //총 가격
             $("#total").val(pricetotal);
             
             //인원수를 값을 변수에 넣는 것! 
             let seat =  document.querySelector('#sit1').innerText;
             console.log("+++++" + seat);
             
             $("#pseat1").text(seat);
             
             
             //인원수를 값을 변수에 넣는 것! 
             let seat2 =  document.querySelector('#sit2').innerText;
             console.log("+++++" + seat2);
             
             $("#pseat2").text(seat2);
         });
      });
      function count(type)  {
          // 결과를 표시할 element
          const resultElement = document.getElementById('result');
          
          // 현재 화면에 표시된 값
          let number = resultElement.innerText;
          
          // 더하기/빼기
          if(type === 'plus' && parseInt(number) < 8) {
            number = parseInt(number) + 1;
            reset();
          }else if(type === 'minus' && parseInt(number) > 1)  {
            number = parseInt(number) - 1;
            reset();
          }
          // 결과 출력
          resultElement.innerText = number;
          viewSelect(number);
        }
         // 인원수만큼 select를 생성 
         function viewSelect(num){
            console.log(num);
            let ul = $("#sul");
            let str = "<li>좌석선택 :<select class='selects' onchange='changeSelect(this.value, this)' name='selects'>"
                    +"<option value='' selected disabled>==좌석 선택==</option>"
                    +"<option value='1'>1</option>"
                    +"<option value='2'>2</option>"
                    +"<option value='3'>3</option>"
                    +"<option value='4'>4</option>"
                    +"<option value='5'>5</option>"
                    +"<option value='6'>6</option>"
                    +"<option value='7'>7</option>"
                    +"<option value='8'>8</option>"
                    +"<option value='9'>9</option>"
                    +"<option value='10'>10</option>"
                    +"<option value='11'>11</option>"
                    +"<option value='12'>12</option>"
                    +"<option value='13'>13</option>"
                    +"<option value='14'>14</option>"
                    +"<option value='15'>15</option>"   
                    +"</select>번</li>";
           let resultli ="";
            for(let i=0; i<num; i++){
               console.log(i);
               resultli += str+"<span id='resultspan'>"+i+"</span>";
            }
            ul.html(resultli);
           
           
         }
         //select에 선택시 호출
         function changeSelect(select, sel){
            let sIndex = sel.parentElement.nextElementSibling.innerHTML;
            let aa = true;
            //선택한 좌석번호 select
            console.log(select);
            //배열에 인덱스가 있는지 체크해서 있으면 배열에서 삭제하고 다시 추가 
            sarr.forEach((a,i)=>{
               if(a.select == select){
                  alert("이미 선택된좌석입니다.");
                  aa = false;
                  //같은 숫자일 경우에는 다시 좌석선택으로 바꿔주기!
                  sel.options[0].selected = true;
                  return;
               }
               if(a.index == sIndex){
                  sarr[i] = {index: sIndex, select: select};
                  aa = false;
                  
               }
            })
            if(aa){
               sarr.push({index: sIndex, select: select})
            }
            console.log(sarr)
         }
         function reset(){
            $('#sit1').text("");
            $('#sit2').text("");
            $('.price').text("0");
            sarr = [];
         }
         
         
         
         
         
        
       
        
        //체크박스 선택안했을 경우 체크하기!
        //결제완료되었습니다.  alert창 띄우기!
        //button에 submit을 주지 않고 따로 주는 방법!
         function OnPay(){
             var reservationForm = document.reservationForm;
             var bt_ok = document.querySelector("input[type='checkbox']");
             console.log(bt_ok.checked);
             if(!bt_ok.checked) {
                alert("예매 유의사항에 동의해주세요.");
                return false;
             }
             else{
                alert("결제가 완료되었습니다.");
                reservationForm.submit();
                
             }   
          }
        
        //선택좌석과 총결제금액 체크하는 방법
        function checktotal(){
       	 let totalresult = false;
       	 var ch_totalresult = document.querySelector('.totalresult');
       	 console.log("=====" + ch_totalresult.innerText.length);
       	 if(ch_totalresult.innerText.length >= 1 ){
       		 totalresult = true;
       	 }
       	 return totalresult;
        }
        
        //다음버튼 클릭할 때
        function onperformance() {
       	 if($(".btn_step button").hasClass("performancebtn1")){
       		
       		 console.log("performance1 버튼 클릭된다!");
       		 if(checktotal()){
       			 $(".performance1").css("display", "none");
                    $(".performance2").css("display", "block");
       			  
       		 }
       		 else{
       			 alert("선택완료 버튼을 클릭해주세요!");
       		 }
        	 }

        }
        //radio 체크 하는 방법
        function checkradio(){
           let result = false;
           var chk_paycd = document.getElementsByName('paycd');
           chk_paycd.forEach(chk=>{
              if(chk.checked){
                 result = true;
              }
           })
           return result;            
        }
        //다음버튼 누르면 모달창 띄우기
        document.querySelector(".performancebtn2").addEventListener("click", function() {
         if(checkradio()){
            document.querySelector("#modal3").style.display = 'block';
          //결제수단 선택!
          console.log("여기용!!");
          console.log(document.querySelector('#paycd input[name="paycd"]'));
            let pay =  document.querySelector('input[name="paycd"]:checked').value;
  		     console.log("+++++" +pay);
  		     $("#pay").text(pay);
  		     
         }else {
            alert("결제 방법을 선택해주세요.");
         }
      
      })
       //닫기 누르면 모달창 안보이게!
        document.querySelector("#bt_close").addEventListener("click", function() {
           document.querySelector("#modal3").style.display = 'none';
        })
        //취소버튼 누르면 모달창 안보이게!
        document.querySelector(".bt_cancle").addEventListener("click", function() {
           document.querySelector("#modal3").style.display = 'none';
        })
        
        
        //이전단계
          function onperformance2() {
       	 reset();
       	 if($(".btn_step2 button").hasClass("performancebtn")){
                console.log("performance2 버튼 클릭된다!");
                $(".performance2").css("display", "none");
                $(".performance1").css("display", "block");
            
        	 }

        }    
       
     
   </script>
</section>
 <%@ include file="../hf/footer.jsp" %>