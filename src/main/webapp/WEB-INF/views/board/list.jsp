<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 표준태그 라이브러리 -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../hf/header.jsp" %>
 <!-- Masthead-->
        <header class="masthead bg-primary text-white text-center">
            <div class="container d-flex align-items-center flex-column">
                <!-- Masthead Heading-->
                <h1 class="masthead-heading text-uppercase mb-0">게시판 목록</h1>
                <!-- Icon Divider-->
                <div class="divider-custom divider-light">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Masthead Subheading-->
                <p class="masthead-subheading font-weight-light mb-0">Board List</p>
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
	<h1>게시판 목록 페이지</h1>
	<table>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>수정일</td>
		</tr>
		<c:forEach items="${list}" var="board">
			<tr onClick="location.href='./get?bno=${board.bno}&pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}'">
				<td><c:out value="${board.bno}"/></td>
				<td><c:out value="${board.title}"/></td>
				<td><c:out value="${board.writer}"/></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updatedate}"/></td>
			</tr>
		</c:forEach>
	</table>
<!-- 페이징 추가 -->
	<div class="pull-right">
		<ul class="pagination">
			<c:if test="${pageMaker.prev}">
				<li>
					<a href="/board/list?pageNum=${pageMaker.startPage-1}&amount=10&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">prev</a>
				</li>
			</c:if>
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				<li>
					<a href="/board/list?pageNum=${num}&amount=10&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">${num}</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next}">
				<li>
					<a href="/board/list?pageNum=${pageMaker.endPage+1}&amount=10&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">next</a>
				</li>
			</c:if>
		</ul>		
	</div>
	<!-- 페이징 추가 끝 -->
	<!-- 검색추가하기 -->
	<div>
		<form method="get" action="/board/list">
			<select name="type">
				<option value="">-----</option>
				<option value="T" <c:out value="${pageMaker.cri.type == 'T' ? 'selected' : ''}"/>>제목</option>
				<option value="C"<c:out value="${pageMaker.cri.type == 'C' ? 'selected' : ''}"/>>내용</option>
				<option value="W" <c:out value="${pageMaker.cri.type == 'W' ? 'selected' : ''}"/>>작성자</option>
				<option value="TC" <c:out value="${pageMaker.cri.type == 'TC' ? 'selected' : ''}"/>>제목+내용</option>
				<option value="TW" <c:out value="${pageMaker.cri.type == 'TW' ? 'selected' : ''}"/>>제목+작성자</option>
				<option value="CW" <c:out value="${pageMaker.cri.type == 'CW' ? 'selected' : ''}"/>>내용+작성자</option>
				<option value="TCW" <c:out value="${pageMaker.cri.type == 'TCW' ? 'selected' : ''}"/>>제목+내용+작성자</option>
			</select>
			<input type="text" name="keyword" value="${pageMaker.cri.keyword}"/>
			<button value="search">search</button>
		</form>
	</div>
	<!-- 검색추가하기 끝 -->
	<p><button onclick="location.href='/board/register'">게시글등록</button></p>
		<!-- Icon Divider-->
		<div class="divider-custom">
		<div class="divider-custom-line"></div>
		<div class="divider-custom-icon"><i class="fas fa-star"></i></div>
		<div class="divider-custom-line"></div>
		</div>
	</div>
	<!-- 모달추가   : alter창 띄우는거랑 같은 역할이다/ -->
	<div id="modal">
		<div id="modalbox">
			<h3>페이지 안내</h3>
			<div id="infotext">
				처리가 완료되었습니다.
			</div>
			<button id="modalclose">닫기</button>
		</div>
	</div>
	<script>
		let result = '<c:out value="${param.result}"/>';
		console.log(result);
		checkModal(result);
		function checkModal(result){
			if(!result) return;
			document.querySelector("#modal").style.display = 'block';
		}
		//닫기 누르면 모달창 안보이게 하기
		document.querySelector("#modalclose").addEventListener("click", function() {
			document.querySelector("#modal").style.display = 'none';
		})
	</script>
</section>
<%@ include file="../hf/footer.jsp" %>