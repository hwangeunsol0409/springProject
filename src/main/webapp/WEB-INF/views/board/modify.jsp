<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../hf/header.jsp" %>
 <!-- Masthead-->
        <header class="masthead bg-primary text-white text-center">
            <div class="container d-flex align-items-center flex-column">
                <!-- Masthead Heading-->
                <h1 class="masthead-heading text-uppercase mb-0">게시글 수정</h1>
                <!-- Icon Divider-->
                <div class="divider-custom divider-light">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Masthead Subheading-->
                <p class="masthead-subheading font-weight-light mb-0">Board Modify</p>
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
	<h2>게시글 수정 페이지</h2>
	<form method="post" action="/board/modify"> 
		<table>
			<tr>
				<td><input type="hidden" name="bno" value="${board.bno}"/></td> 
				<td><input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" required value="${board.title}"/></td>
				<!-- required 필수속성 입력하라고 뜬다. -->
			</tr>
			<tr>
				<td>작성자</td>
				<td><input name="writer" value="<sec:authentication property="principal.member.name"/>" readonly /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea rows="" cols="" name="content" required >${board.content} 
					</textarea>
				</td>	
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit">등록</button>
					<button type="reset">취소</button>
				</td>
			</tr>
			<input type="hidden" name="pageNum" value="${cri.pageNum}"/>
			<input type="hidden" name="amount" value="${cri.amount}"/>
		</table>
	</form>
		<!-- Icon Divider-->
		<div class="divider-custom">
		<div class="divider-custom-line"></div>
		<div class="divider-custom-icon"><i class="fas fa-star"></i></div>
		<div class="divider-custom-line"></div>
		</div>
	</div>
</section>
 <%@ include file="../hf/footer.jsp" %>