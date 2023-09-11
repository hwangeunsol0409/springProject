<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <%@ include file="../hf/header.jsp" %>
<!-- Masthead-->
        <header class="masthead bg-primary text-white text-center">
            <div class="container d-flex align-items-center flex-column">
                <!-- Masthead Heading-->
                <h1 class="masthead-heading text-uppercase mb-0">갤러리게시글 수정하기</h1>
                <!-- Icon Divider-->
                <div class="divider-custom divider-light">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Masthead Subheading-->
                <p class="masthead-subheading font-weight-light mb-0">GalleryBoard Modify</p>
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
<h2>갤러리 리스트 수정하기 페이지 입니다.</h2>
<form method="post" action="/galleryboard/galleryModify"  class="galleryboard">
	<table>
			<tr>
				<td><input type="hidden" name="gno" value="${galleryBoard.gno}"/></td> 
				<td><input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" required value="${galleryBoard.title}"/></td>
				<!-- required 필수속성 입력하라고 뜬다. -->
			</tr>
            <tr>
				<td>작성자</td>
				<td><input name="writer" value="<sec:authentication property="principal.member.name"/>" readonly /></td>
			</tr>
		<tr class="uploadDiv">
					<td>파일 첨부</td>
					<td>
							<input type="file" name="uploadFile" value="${galleryBoard.fullname}"/>
					</td>
					<td class="uploadResult">
							<ul>
								<li data-path='${galleryBoard.uploadpath}' data-filename='${galleryBoard.filename}' data-fullname='${galleryBoard.fullname}'><img src="/upload/display?fileName=${galleryBoard.fullname}"></li>
							</ul>
					</td>
		</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea rows="" cols="" name="content" required >${galleryBoard.content} 
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
<script type="text/javascript">
	//ready : html 문서를 다 로드하면 이벤트 실행
	$(document).ready(function(){
		//삭제버튼 클릭시 화면상에서 사라지도록 처리
		$(".uploadResult").on("click", "button", function(){
			console.log("delete file");
			//버튼 근처의 li를 찾아서 버튼을 누르면 삭제
			if(confirm("파일을 삭제하시겠습니까?")) {
				let targetLi = $(this).closest("li");
				targetLi.remove();
			}
		})
		//input 태그 중 type이 file요소 선택
			//요소의 변경이 있으면 콜백함수 실행
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
			$("input[type='file']").on("change",function(){
				
				let formData = new FormData();
				let inputFile = $("input[name='uploadFile']");
				let files = inputFile[0].files;
				console.log(files);	
				let aa = $(".uploadResult ul li");
				aa.remove();
				
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
						
						
					}
				});
			})
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
			uploadul.html(str);
		}
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
	});
</script>



<!-- Icon Divider-->
		<div class="divider-custom">
		<div class="divider-custom-line"></div>
		<div class="divider-custom-icon"><i class="fas fa-star"></i></div>
		<div class="divider-custom-line"></div>
		</div>
	</div>
</section>
 <%@ include file="../hf/footer.jsp" %>