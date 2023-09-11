<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ include file="../hf/header.jsp" %>
<!-- Masthead-->
        <header class="masthead bg-primary text-white text-center">
            <div class="container d-flex align-items-center flex-column">
                <!-- Masthead Heading-->
                <h1 class="masthead-heading text-uppercase mb-0">공연 등록</h1>
                <!-- Icon Divider-->
                <div class="divider-custom divider-light">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Masthead Subheading-->
                <p class="masthead-subheading font-weight-light mb-0">Performance Register</p>
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
     <form class="performance" method="post" action="/performance/performanceRegister">            	
     	<div class="item_view">
                <div class="thum">
                	<div>
                		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                		
                	</div>
                	 <div class="uploadDiv">
						<input type="file" name="photo"/>
		  			</div>
					<div class="uploadResult">
						<ul></ul>
					</div>
                    <div class="s_thum">
                    </div>
                </div>
                <div class="con">
                    <h3>
                            <span>
                            	<input type="text" id="sname" placeholder="공연종류" name="sname" required>
                            </span>
                   			<input type="text" id="name" placeholder="공연이름" name="name" required>
                   			<input type="text" id="alt" placeholder="이미지설명글" name="alt" required>
                   </h3>
                    <div>
                        <dl>
                            <dt>공연기간</dt>
                            <dd><input type="text" id="period" placeholder="공연기간" name="period" required></dd>
                        </dl>
                        <dl>
                        	<dt>공연시간</dt>
                        	<dd><input  type="text" id="ptime" placeholder="공연시간" name="ptime" required/></dd>
                        </dl>
                        <dl>
                            <dt>관람시간</dt>
                            <dd><input type="text" id="vtime" placeholder="관람시간" name="vtime" required></dd>
                        </dl>
                        <dl>
                            <dt>관람등급</dt>
                            <dd><input type="text" id="grade" placeholder="관람등급" name="grade" required></dd>
                        </dl>
                        <dl>
                            <dt>공연장소</dt>
                            <dd><input type="text" id="place" placeholder="공연장소" name="place" required></dd>
                        </dl>
                        <dl>
                            <dt>가격정보</dt>
                            <dd><input type="text" id="price" placeholder="가격정보" name="price" required></dd>
                        </dl>
                        
                    </div>
                    	<button type="submit">등록</button>
						<button type="reset">취소</button>
                	</div>
         </div>
     </form>
	<!-- Icon Divider-->
		<div class="divider-custom">
		<div class="divider-custom-line"></div>
		<div class="divider-custom-icon"><i class="fas fa-star"></i></div>
		<div class="divider-custom-line"></div>
		</div>
	</div>
</section>
<script>
	$(document).ready(function() {
		//전송버튼 누를 때 파일 관련 데이터도 같이 전송
		$("button[type='submit']").on("click", function(e){
			//preventDefault()는 연결된 이벤트 제거(submit 전송제거)
			e.preventDefault();
			//폼선택 formObj할당
			let formObj = $("form.performance");
			let str = "";
			let li = $(".uploadResult ul li");
			str += "<input type='hidden' name='filename' value='"+li.data("filename")+"'/>";
			str += "<input type='hidden' name='uploadpath' value='"+li.data("path")+"'/>";
			str += "<input type='hidden' name='fullname' value='"+li.data("fullname")+"'/>";
			//폼에 데이터 추가 append()메소드 submit()될 때 같이 전송되도록
			
			formObj.append(str);
			formObj.submit();
			console.log(formObj);
			
			})
			//input 태그 중 type이 file요소 선택
			//요소의 변경이 있으면 콜백함수 실행
			$("input[type='file']").on("change",function(){
				let formData = new FormData();
				let inputFile = $("input[name='photo']");
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
					url: '/perUpload/uploadAjaxAction',
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
						showUploadResult(result);
						$(".uploadDiv").html(cloneobj.html());
						
					}
				});
			})
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
			function showUploadResult(uploadResultArr){
				//결과 배열이 null이거나 길이가 0이면 함수 종료
				if(!uploadResultArr || uploadResultArr.length==0) {return;}
				let uploadul = $(".uploadResult ul");
				let str = "";
				$(uploadResultArr).each(function(i, obj){
					
					let fileCallpath = encodeURIComponent(obj.uploadPath+"\\s_"+obj.uuid+"_"+obj.fileName);
					
					str += "<li data-path='"+obj.uploadPath+"' data-filename='"+obj.fileName+"' data-fullname='"+fileCallpath+"'>"
					+"<img src='/perUpload/display?fileName="+fileCallpath+"'/>"
				    +"<button class='btn' data-file=\'"+fileCallpath+"\'data-type='image'>"
				    +"삭제</button>"
					+"</li>"
				})
				uploadul.html(str);
			}
			//삭제 버튼 추가하기
			$(".uploadResult").on("click", "button", function(e){
				console.log("삭제클릭");
				//이벤트를 발생시키면 이벤트 발생시킨 객체를 this가 가르킨다.
				//커스텀 속성 dataset ==> data("키이름")
				let targetFile = $(this).data("file");
				let type = $(this).data("type");
				let targetLi = $(this).closest("li");
				$.ajax({
					url: '/perUpload/deleteFile',
					data: {fileName: targetFile, type: type},
					dataType: 'text',
					type: 'POST',
					success: function(result){
						alert(result)
					}
				})
				targetLi.remove();
			})
		})
</script>
 <%@ include file="../hf/footer.jsp" %>