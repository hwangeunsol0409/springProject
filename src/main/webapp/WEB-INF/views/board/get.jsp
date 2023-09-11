<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
     <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="../hf/header.jsp" %>
 <!-- Masthead-->
        <header class="masthead bg-primary text-white text-center">
            <div class="container d-flex align-items-center flex-column">
                <!-- Masthead Heading-->
                <h1 class="masthead-heading text-uppercase mb-0">게시판글 상세조회</h1>
                <!-- Icon Divider-->
                <div class="divider-custom divider-light">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Masthead Subheading-->
                <p class="masthead-subheading font-weight-light mb-0">Detail Check</p>
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
	<h1>상세조회 페이지</h1>
<table>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>내용</td>
			<td>작성일</td>
			<td>수정일</td>
		</tr>
		<tr>
			<td><c:out value="${board.bno}"/></td>
			<td><c:out value="${board.title}"/></td>
			<td><c:out value="${board.writer}"/></td>
			<td><c:out value="${board.content}"/></td>
			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/></td>
			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updatedate}"/></td>
		</tr>
	</table>

	<p>
		<button onclick="location.href='/board/list?pageNum=${cri.pageNum}&amount=${cri.amount}&type=${cri.type}&keyword=${cri.keyword}'">목록</button>
		
	</p>	
	<!-- 로그인해야 수정버튼 생기도록 접근 권한 부여 -->
	<sec:authorize access="isAuthenticated()">
		<!-- 로그인한 사용자랑 글쓴이랑 같아야함! -->
		<sec:authentication property="principal.member.name" var="pinfo"/>
		<c:if test="${pinfo eq board.writer}">
		<button onclick="location.href='/board/modify?bno=${board.bno}&pageNum=${cri.pageNum}&amount=${cri.amount}'">수정</button>
		<form action="/board/remove" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
			<input type="hidden" name="bno" value="${board.bno}"/>
			<button type="submit">삭제</button>
		</form>
		</c:if>
	</sec:authorize>
		<!-- Icon Divider-->
		<div class="divider-custom">
		<div class="divider-custom-line"></div>
		<div class="divider-custom-icon"><i class="fas fa-star"></i></div>
		<div class="divider-custom-line"></div>
		</div>
	</div>
	</section>
 <%@ include file="../hf/footer.jsp" %>