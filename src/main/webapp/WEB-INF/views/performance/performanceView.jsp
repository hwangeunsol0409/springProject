<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
     
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../hf/header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Masthead-->
        <header class="masthead bg-primary text-white text-center">
            <div class="container d-flex align-items-center flex-column">
                <!-- Masthead Heading-->
                <h1 class="masthead-heading text-uppercase mb-0">공연 상세정보</h1>
                <!-- Icon Divider-->
                <div class="divider-custom divider-light">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Masthead Subheading-->
                <p class="masthead-subheading font-weight-light mb-0">Performance details</p>
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
                <br/>
           <div class="item_view">
                <div class="thum">
                    <div class="b_thum">
                  <img src="/perUpload/display?fileName=${performance.fullname}" alt="${performance.alt}">
                  </div>
                     <div class="s_thum">
                    </div>
                </div>
         <div class="con">
               <h3>
                  <span class="ico_plan cate1"><c:out value="${performance.sname}"/></span>
                  <c:out value="${performance.name}"/>
               </h3>
         <div>
            <dl>
               <dt>공연기간</dt>
               <dd><c:out value="${performance.period}"/></dd>
               <dt>공연시간</dt>
               <dd><c:out value="${performance.ptime}"/></dd>
               <dt>관람시간</dt>
               <dd><c:out value="${performance.vtime}"/></dd>
               <dt>관람등급</dt>
               <dd><c:out value="${performance.grade}"/></dd>
               <dt>공연장소</dt>
               <dd><c:out value="${performance.place}"/></dd>
               <dt>가격정보</dt>
               <dd><c:out value="${performance.price}"/></dd>
            </dl>
         </div>
         
              <button  class="reservationBtn" type="button"  onclick="location.href='/performance/performanceReservation?num=${performance.num}&period=${performance.period}&ptime=${performance.ptime}&place=${performance.place}&price=${performance.price}'">예매하기</button>
              <button  type="button" onclick="location.href='/performance/performance'">목록</button>
           </div>
       </div>
            <div id="tabs" class="item_info">
                <ul class="tab_tit">
                    <li class="on"><button id="btn1" type="button" class="on">상세정보</button></li>
                    <li class=""><button id="btn2" type="button">할인정보</button></li>
                </ul>
                <!-- 상세정보 : 관리자 에디터 내용 들어갑니다. -->
                <div class="tab_cont t1" style="display:block">
                    <p class="t_center">
                    <img style="BORDER-TOP: 0px; BORDER-RIGHT: 0px; VERTICAL-ALIGN: top; BORDER-BOTTOM: 0px; TEXT-ALIGN: left; BORDER-LEFT: 0px" border="0" src="https://www.hhiarts.co.kr/common/popup/download.jsp?save_dir=board&amp;distinct=physical&amp;file_name=editor/20230626/20230626168774246663101.JPG&amp;file_mask=1.JPG" width="100%" align="left" valign="top"><img style="BORDER-TOP: 0px; BORDER-RIGHT: 0px; VERTICAL-ALIGN: top; BORDER-BOTTOM: 0px; TEXT-ALIGN: left; BORDER-LEFT: 0px" border="0" src="https://www.hhiarts.co.kr/common/popup/download.jsp?save_dir=board&amp;distinct=physical&amp;file_name=editor/20230626/20230626168774248679401.JPG&amp;file_mask=2.JPG" width="100%" align="left" valign="top"><img style="BORDER-TOP: 0px; BORDER-RIGHT: 0px; VERTICAL-ALIGN: top; BORDER-BOTTOM: 0px; TEXT-ALIGN: left; BORDER-LEFT: 0px" border="0" src="https://www.hhiarts.co.kr/common/popup/download.jsp?save_dir=board&amp;distinct=physical&amp;file_name=editor/20230613/20230613168662147887301.jpg&amp;file_mask=포스터_친정엄마와2박3일_l-01.jpg" width="100%" align="left" valign="top"><img style="BORDER-TOP: 0px; BORDER-RIGHT: 0px; VERTICAL-ALIGN: top; BORDER-BOTTOM: 0px; TEXT-ALIGN: left; BORDER-LEFT: 0px" border="0" src="https://www.hhiarts.co.kr/common/popup/download.jsp?save_dir=board&amp;distinct=physical&amp;file_name=editor/20230613/20230613168662291180901.jpg&amp;file_mask=상세페이지 복사.jpg" width="100%" align="left" valign="top">
                    <!-- <img src="http://www.hhiarts.co.kr/common/popup/download.jsp?save_dir=board&distinct=physical&file_name=editor/20180419/20180419152411101756301.JPG&file_mask=ticket_hhiarts-%EC%82%AC%EB%B3%B8.JPG" /> -->

                    </p>
                </div>
                <!-- 할인정보 : 관리자 에디터 내용 들어갑니다. -->
                <div class="tab_cont t2" style="display: none">
                    <img style="BORDER-TOP: 0px; BORDER-RIGHT: 0px; VERTICAL-ALIGN: top; BORDER-BOTTOM: 0px; TEXT-ALIGN: left; BORDER-LEFT: 0px" border="0" src="https://www.hhiarts.co.kr/common/popup/download.jsp?save_dir=board&amp;distinct=physical&amp;file_name=editor/20230626/20230626168774248679401.JPG&amp;file_mask=2.JPG" width="100%" align="left" valign="top">
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
   $(document).ready(function() {
      $('.t1').show(); //페이지를 로드할 때 표시할 요소
      $('.t2').hide(); //페이지를 로드할 때 숨길 요소
      $('#btn1').click(function(){
         //버튼 클릭할 때, css적용하는 것!
         $(".tab_tit li").eq(0).addClass("on");
         $(".tab_tit li").eq(1).removeClass("on");
         //버튼 클릭 했을 때 보이는 div
         $ ('.t2').hide(); //클릭 시 첫 번째 요소 숨김
         $ ('.t1').show(); //클릭 시 두 번째 요소 표시
      });
      $('#btn2').click(function(){
         //버튼 클릭할 때, css적용하는 것!
         $(".tab_tit li").eq(1).addClass("on");
         $(".tab_tit li").eq(0).removeClass("on");
         //버튼 클릭 했을 때 보이는 div
         $ ('.t1').hide(); //클릭 시 첫 번째 요소 숨김
         $ ('.t2').show(); //클릭 시 두 번째 요소 표시
      });
      });
   </script>
</section>
<%@ include file="../hf/footer.jsp" %>