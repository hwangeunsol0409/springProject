<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     ﻿<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../hf/header.jsp" %>
<!-- Masthead-->
        <header class="masthead bg-primary text-white text-center">
            <div class="container d-flex align-items-center flex-column">
                <!-- Masthead Heading-->
                <h1 class="masthead-heading text-uppercase mb-0">나의 정보</h1>
                <!-- Icon Divider-->
                <div class="divider-custom divider-light">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Masthead Subheading-->
                <p class="masthead-subheading font-weight-light mb-0">My Page</p>
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
                

         
         
         
         
<h2 style="color:red;">예매정보</h2>
<c:forEach items="${list}" var="reservation">
       <div class="total_wrap">
            <div class="s_inner">
                <!-- 주문내역 --->
                <ul class="total_list">
                    <li>
                    	 <span class="poster">  <img src="/perUpload/display?fileName=${reservation.fullname}" alt="${reservation.alt}"></span>
	                        <div class="total_tit">공연제목</div>
	                        <div>  <c:out value="${reservation.name}"/></div>
                    </li>      
	     			<li>
                        <div class="total_tit">공연 장소 및 일시</div>
                        <div>
                            <!-- 날짜선택, 시간선택 -->
                            <!--  <p>2018년 06월 13일 수요일</p> -->
 		   					<c:out value="${reservation.viewday}"/>
                            <!-- <p>2회 14:00</p>  -->
		     				<c:out value="${reservation.viewday2}"/>
                       </div>
				  </li>
		           <li>
                        <div class="total_tit">공연 장소 및 일시</div>
                        <div>
                            <!-- 날짜선택, 시간선택 -->
                            <!--  <p>2018년 06월 13일 수요일</p> -->
 		   					<c:out value="${reservation.viewday}"/>
                            <!-- <p>2회 14:00</p>  -->
		     				<c:out value="${reservation.viewday2}"/>
                      </div>
				 </li>
		         <li>
                       <div class="total_tit">관람시간</div>
                       <div><c:out value="${reservation.vtime}"/></div>
               </li>
		       <li>
                      <div class="total_tit">선택좌석</div>
                      <div>
                           <!-- 좌선선택
                           A석 2층 E10-9번, A석 2층 E10-10번-->
             	           <c:out value="${reservation.peoplenum}"/>
             	           // 좌석 번호 :
                           <c:out value="${reservation.seatnum}"/>
                     </div>
               </li>
               <li>
                     <div class="total_tit">결제 수단</div>
                     <div><c:out value="${reservation.paycd}"/></div>
	   	      </li>
	   	       <li>
                     <div class="total_tit">티켓금액</div>
                     <div><c:out value="${reservation.price}"/></div>
	   	      </li>
	   	      <li>
                     <div class="total_tit">총 결제 금액</div>
                     <div><c:out value="${reservation.total}"/></div>
	   	      </li>
           </ul>
       </div>
    </div>
</c:forEach>

                
                
                
                
             <!-- Icon Divider-->
		<div class="divider-custom">
		<div class="divider-custom-line"></div>
		<div class="divider-custom-icon"><i class="fas fa-star"></i></div>
		<div class="divider-custom-line"></div>
		</div>
		</div>
   </section>
<%@ include file="../hf/footer.jsp" %>