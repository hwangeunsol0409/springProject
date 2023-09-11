<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ include file="../hf/header.jsp" %>
<!-- Masthead-->
        <header class="masthead bg-primary text-white text-center">
            <div class="container d-flex align-items-center flex-column">
                <!-- Masthead Heading-->
                <h1 class="masthead-heading text-uppercase mb-0">갤러리게시판 등록</h1>
                <!-- Icon Divider-->
                <div class="divider-custom divider-light">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Masthead Subheading-->
                <p class="masthead-subheading font-weight-light mb-0">GalleryBoard Register</p>
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
	<h2>갤러리 등록페이지입니다.</h2>
	<form class="galleryboard" method="post" action="/galleryboard/galleryRegister"> 
         <table>
         		    <tr> 
						<td><input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/></td>
					</tr>		
                 	<tr> 
                 		 <td>제목</td>
                         <td><input type="text" id="exampleFirstName"
                                  placeholder="제목" name="title" required></td>
                    </tr>
                    <tr>
                    	   <td>작성자</td>
                        <td><input name="writer" value="<sec:authentication property="principal.member.name"/>" readonly /></td>
                    </tr>
                     <tr class="uploadDiv">
                       	
							 <td>파일첨부</td>
							 <td class="uploadResult">
									 	<input type="file" name="uploadFile"/>
									 	<ul></ul>	
							</td>	
                      </tr>
                      <tr>
                      		<td>내용</td>
                      		<td>
                      			<textarea rows="" cols="" id="exampleLastName"
                      			 name="content" required>내용</textarea>
                      		 </td>
                     </tr>
                    <tr>
                    	<td colspan="2">
	                     	<button type="submit">등록</button>
						 	<button type="reset">취소</button>
						</td>
					<tr>
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
<script>
		//html 문서를 다 로드하면 실행해
		$(document).ready(function() {
			//전송버튼 누를 때 파일 관련 데이터도 같이 전송
			$("button[type='submit']").on("click", function(e){
				//preventDefault()는 연결된 이벤트 제거(submit 전송제거)
				e.preventDefault();
				//폼선택 formObj할당
				let formObj = $("form.galleryboard");
				console.log("submit클릭")
				let str = "";
				let li = $(".uploadResult li");
				str += "<input type='hidden' name='filename' value='"+li.data("filename")+"'/>";
				str += "<input type='hidden' name='uploadpath' value='"+li.data("path")+"'/>";
				str += "<input type='hidden' name='fullname' value='"+li.data("fullname")+"'/>";
			//폼에 데이터 추가 append()메소드 submit()될 때 같이 전송되도록
			formObj.append(str).submit();
			})
			
			//input 태그 중 type이 file요소 선택
			//요소의 변경이 있으면 콜백함수 실행
			$("input[type='file']").on("change",function(){
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
					+"<img src='/upload/display?fileName="+fileCallpath+"'/>"
				    +"<button class='btn' data-file=\'"+fileCallpath+"\'data-type='image'>"
				    +"삭제</button>"
					+"</li>"
				})
				//이렇게 주면 파일이 여러개 낸다.
				//uploadul.append(str);
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
					url: '/deleteFile',
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