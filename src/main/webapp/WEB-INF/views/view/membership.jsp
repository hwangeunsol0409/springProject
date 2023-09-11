<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../hf/header.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	    <!-- Masthead-->
        <header class="masthead bg-primary text-white text-center">
            <div class="container d-flex align-items-center flex-column">
                <!-- Masthead Heading-->
                <h1 class="masthead-heading text-uppercase mb-0">회원가입</h1>
                <!-- Icon Divider-->
                <div class="divider-custom divider-light">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Masthead Subheading-->
                <p class="masthead-subheading font-weight-light mb-0">join membership</p>
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
		       <form class="member" method="post" action="/view/membership"> 
		       	   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		       	   <p>아이디 : <input type="text" name="id" placeholder="Id" /></p>
			       <p>패스워드 : <input type="password" name="passwd" placeholder="Password" /></p>
				   <p>이름 : <input type="text" name="name" placeholder="name" /></p>
				   <p>생년월일 : <input type="date" name="birth" placeholder="br" /></p>
				   <p> 성별 : 
				   	   <input type="radio" name="gender" value="남" /> 남
				   	   <input type="radio" name="gender" value="여" /> 여
				   </p>
				   <p>이메일 : <input type="text" name="user_email" required><span id="middle">@</span><input type="text" name="email_address" list="user_email_address">
							<datalist id="user_email_address">
								<option value="naver.com"></option>
								<option value="daum.net"></option>
								<option value="google.com"></option>
								<option value="직접입력"></option>
							</datalist>
				   </p>
				   <p>전화번호 :
				   		 <input type="text" name="phone1" list="phone1_list"><span id="middle1">-</span>
				   		 <input type="text" name="phone2"><span id="middle2">-</span>
				   		 <input type="text" name="phone3">
				   		 <datalist id="phone1_list">
								<option value="010"></option>
								<option value="052"></option>
								<option value="02"></option>
								<option value="직접입력"></option>
							</datalist>
				   </p>
				   
				   <p id="address"> 주소 :
						<input type="text" id="sample6_postcode" name="sample6_postcode" placeholder="우편번호">
						<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="sample6_address" name="sample6_address" placeholder="주소"><br>
						<input type="text" id="sample6_detailAddress" name="sample6_detailAddress" placeholder="상세주소">
						<input type="text" id="sample6_extraAddress" name="sample6_extraAddress" placeholder="참고항목"> 
				   </p>
				   <input type="hidden"   name="auth" value="ROLE_USER" />
				    <p>
			       	  <button type="submit" >등록</button> 
			       	  <button type="reset">취소</button>
			       </p>    
		       </form>
		       <br>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
               </div>
        </section>
       <script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
 <%@ include file="../hf/footer.jsp" %>