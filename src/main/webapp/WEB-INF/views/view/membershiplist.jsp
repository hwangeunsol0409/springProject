<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../hf/header.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	    <!-- Masthead-->
        <header class="masthead bg-primary text-white text-center">
            <div class="container d-flex align-items-center flex-column">
                <!-- Masthead Heading-->
                <h1 class="masthead-heading text-uppercase mb-0">회원목록</h1>
                <!-- Icon Divider-->
                <div class="divider-custom divider-light">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Masthead Subheading-->
                <p class="masthead-subheading font-weight-light mb-0">membership list</p>
			</div>
        </header>
          <!-- Portfolio Section-->
        <section class="page-section portfolio" id="portfolio">
            <div class="container">
            	<!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <br>
		   <div>
        		<h1>회원목록 페이지</h1>
				<table>
					<tr>
						<td>아이디</td>
						<td>비밀번호</td>
						<td>이름</td>
						<td>생년월일</td>
						<td>성별</td>
						<td>이메일</td>
						<td>전화번호</td>
						<td>주소</td>
					</tr>
					<c:forEach items="${list}" var="member">
					<tr>
						<td><c:out value="${member.id}"/></td>
						<td><c:out value="${member.passwd}"/></td>
						<td><c:out value="${member.name}"/></td>
						<td><c:out value="${member.birth}"/></td>
						<td><c:out value="${member.gender}"/></td>
						<td><c:out value="${member.email}"/></td>
						<td><c:out value="${member.phone}"/></td>
						<td><c:out value="${member.address}"/></td>
					</tr>
				</c:forEach>
			</table>
		  </div>
		</div>
               <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
       </section>
<%@ include file="../hf/footer.jsp" %>