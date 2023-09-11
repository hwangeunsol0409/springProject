<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file="../hf/header.jsp" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Masthead-->
        <header class="masthead bg-primary text-white text-center">
            <div class="container d-flex align-items-center flex-column">
                <!-- Masthead Heading-->
                <h1 class="masthead-heading text-uppercase mb-0">공연</h1>
                <!-- Icon Divider-->
                <div class="divider-custom divider-light">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Masthead Subheading-->
                <p class="masthead-subheading font-weight-light mb-0">Performance</p>
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
            <c:forEach items="${list}" var="performance">
               <img src="/perUpload/display?fileName=${performance.fullname}" alt="${performance.alt}">
               <h3>
                  <span class="ico_plan cate1"><c:out value="${performance.sname}"/></span>
                  <c:out value="${performance.name}"/>
               </h3>
            <dl>
               <dt>공연기간</dt>
               <dd><c:out value="${performance.period}"/></dd>
               <dt>공연장소</dt>
               <dd><c:out value="${performance.place}"/></dd>
               <dt>관람등급</dt>
               <dd><c:out value="${performance.grade}"/></dd>
               <dt>가격정보</dt>
               <dd><c:out value="${performance.price}"/></dd>  
            </dl>
            <button  class="reservationBtn" type="button"  onclick="location.href='/performance/performanceReservation?num=${performance.num}&period=${performance.period}&ptime=${performance.ptime}&place=${performance.place}&price=${performance.price}'">예매하기</button>
             <button type="button" onclick="location.href='/performance/performanceView?num=${performance.num}'">상세보기</button> 
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