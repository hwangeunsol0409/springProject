<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../hf/header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 <!-- Masthead-->
        <header class="masthead bg-primary text-white text-center">
            <div class="container d-flex align-items-center flex-column">
                <!-- Masthead Heading-->
                <h1 class="masthead-heading text-uppercase mb-0">이미지 업로드</h1>
                <!-- Icon Divider-->
                <div class="divider-custom divider-light">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Masthead Subheading-->
                <p class="masthead-subheading font-weight-light mb-0">Image Upload</p>
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
             </div>
                <br>
	<div class="uploadDiv">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="file" name="uploadFile" multiple>
	</div>
	<div class="uploadResult">
		<ul>
		</ul>
	</div>
	<button id="uploadBtn">업로드</button>
	    <div class="container">
            	<!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
             </div>

</section>
	<script>
		$(document).ready(function(){
			//버튼 클릭할 때 실행
			//document.querySelector("#uploadBtn").addEventListener("click",function() {})
			//이거랑
			//$("#uploadBtn").on("click",function() {}) 이거랑
			//같은 의미이다.
			
			//input 초기화를 위한 복사(input이 있는 div를 복사)
			let cloneobj = $(".uploadDiv").clone();
			
			//등록한 이미지 나타내기
			//uploadResult클래스 안에 있는 ul태그 객체를 할당
			let uploadResult = $(".uploadResult ul");
			function showUploadFile(uploadResultArr){
				let str ="";
				$(uploadResultArr).each(function(i, obj){
					//str += "<li>"+obj.fileName+"</li>";
					let fileCallpath = encodeURIComponent(obj.uploadPath+"/s_"+obj.fileName);
					str += "<li><img src='/upload/display?fileName="+fileCallpath+"'/></li>"
				})
				uploadResult.append(str);
			}
			
			//정규표현식 => 확장자 검사를 한다. exe,sh,zip,alz 얘네들은 못하게 한다.
			//$는 마지막에 오는 글자라고 표현하는 것이다.
			let regex = new RegExp("(.*?)\.(exe|sh|zip|alz|pptx)$");
			let maxSize = 5242880; //5mb지정	
			//체크하는 함수
			function checkExtension(fileName, fileSize) {
				if(regex.test(fileName)){
					alert("해당 종류의 파일은 업로드 할 수 없습니다.");
					return false;
				}
				if(fileSize >= maxSize){
					alert("파일 사이즈 초과");
					return false;
				}
				return true;
			}
			$("#uploadBtn").on("click",function(){
				let formData = new FormData();
				let inputFile = $("input[name='uploadFile']");
				let files = inputFile[0].files;
				console.log(files);	
				
				for(var i=0; i<files.length; i++){
					if(!checkExtension(files[i].name, files[i].size)){
						return false;
					}
					formData.append("uploadFile", files[i]);
				}
				//스큐리티 사용하려면 post는 토큰이 필요하다!
				let csrfHeaderName = "${_csrf.headerName}";
				let csrfTokenValue = "${_csrf.token}";
				//전송하기 ==> 페이지는 그대로 있는 상태에서 요청하기!
				$.ajax({
					url: '/upload/uploadAjaxAction',
					data: formData,
					 beforeSend:function(xhr){
							xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
						},
					type: 'POST',
					processData: false,
					contentType: false,
					dataType: 'json',
					success: function(result){
						console.log(result);
						showUploadFile(result);
						$(".uploadDiv").html(cloneobj.html());
					}
				});
			})
		
		})
	</script>
<%@ include file="../hf/footer.jsp" %>