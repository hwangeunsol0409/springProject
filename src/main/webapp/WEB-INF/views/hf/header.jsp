<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     ﻿<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Freelancer - Start Bootstrap Theme</title>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/css/styles.css" rel="stylesheet" />
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="/view/main">EUNSOL</a>
                <button class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    메뉴
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto" >
                    
                    <li class="nav-item mx-0 mx-lg-1">
	                    <sec:authorize access="isAnonymous()">
							<a class="nav-link py-3 px-0 px-lg-3 rounded"  href="/view/login">로그인</a>
						</sec:authorize>
					</li>
					<li>
						<sec:authorize access="isAuthenticated()">
							<p id="loginName"><sec:authentication property="principal.member.name"/>(<sec:authentication property="principal.member.id"/>) 님 환영합니다.</p>
						</sec:authorize>
					</li>
				    <li class="nav-item mx-0 mx-lg-1">
				    	<sec:authorize access="isAuthenticated()">
							<form method="post" action="/view/logout">
      							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
      							<input id="logout" type="submit" value="로그아웃"/>
      							
   							</form>
						</sec:authorize>
					</li>
					<li class="nav-item mx-0 mx-lg-1">
	                    <sec:authorize access="isAnonymous()">
							<a class="nav-link py-3 px-0 px-lg-3 rounded"  href="/view/membership">회원가입</a>
						</sec:authorize> 
					</li>
					<li class="nav-item mx-0 mx-lg-1">
				    	<sec:authorize access="isAuthenticated()">
							<a class="nav-link py-3 px-0 px-lg-3 rounded" href="/performance/myPage">마이페이지</a>
						</sec:authorize>
					</li>
						<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="/performance/performance">상품</a></li>
						<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="/performance/performanceRegister">상품등록</a></li>
                         <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="/board/list">게시판</a></li>
                         <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="/galleryboard/galleryList">갤러리게시판</a></li>
                    </ul>
                </div>
            </div>
        </nav>