<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
	<title>Chating</title>
	<!-- Favicon -->
 <link href="img/favicon.ico" rel="icon">

 <!-- Google Web Fonts -->
 <link rel="preconnect" href="https://fonts.googleapis.com">
 <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
 <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap" rel="stylesheet">
 
 <!-- Icon Font Stylesheet -->
 <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

 <!-- Libraries Stylesheet -->
 <link href="lib/animate/animate.min.css" rel="stylesheet">
 <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

 <!-- Customized Bootstrap Stylesheet -->
 <link href="css/bootstrap.min.css" rel="stylesheet">

 <!-- Template Stylesheet -->
 <link href="css/style.css" rel="stylesheet">
	
<style>
*{
	margin:0;
	padding:0;
}
.container1{
	width: 600px;
	margin: 0 auto;
	padding: 25px
}
.container1 h1{
	text-align: center;
	padding: 5px 5px 5px 15px;
	color: #00B98E;
	margin-bottom: 20px;
}
.chating{
	background-color: #fff;
	width: 500px;
	height: 500px;
	overflow: auto;
	margin: auto;
}
.chating .others {
	text-align: left;
    padding: 11px 12px 9px;
    color: black;
    background-color: #f4f4f4;
    overflow: hidden;
    border-radius: 3px 16px 16px;
    font-size: 15px;
    line-height: 1.33;
    word-break: break-word;
    word-wrap: break-word;
    vertical-align: bottom;
    margin-bottom: 10px; /* 각 채팅 엘리먼트 사이에 간격 추가 */
    display: block; /* inline-block 대신 block으로 변경 */
    width: fit-content; /* 콘텐츠의 크기만큼만 배경이 적용되도록 설정 */
}

.chating .me {
    text-align: right;
    padding: 11px 12px 9px;
    overflow: hidden;
    display: block;
    clear: both;  /* 추가된 부분 */
    position: relative;
    z-index: 0;
    max-width: 100%;
    margin-left: auto;  /* 추가된 부분 */
    border-radius: 16px 16px 3px;
    font-size: 15px;
    line-height: 1.33;
    background-color: #d9f7e7;
    word-break: break-word;
    word-wrap: break-word;
    vertical-align: bottom;
    margin-bottom: 10px;
    width: fit-content;
}

input{
	width: 350px;
	height: 40x;
	margin-right : 10px;
	padding: 9px 70px 7px 10px;
    box-sizing: border-box;
    border-radius: 18px;
    background-color: #f5f6f8;
}
#yourMsg{
	display: none;
}
#sendBtn {
	margin-left : 10px;
	display: inline-block;
    width: 40px;
    height: 40px;
    background-repeat: no-repeat;
    vertical-align: top;
    transform-origin: center center 27px;
    background-color: white;
    border: none; /* 테두리 제거 */
}
#leftBtn {

}
</style>
</head>

<script type="text/javascript">
	var ws;

	function wsOpen(){
		//웹소켓 전송시 현재 방의 번호를 넘겨서 보낸다.
		ws = new WebSocket("ws://" + location.host + "/chating/"+$("#chr_no").val());
		wsEvt();
	}
		
	function wsEvt() {
		ws.onopen = function(data){
			//소켓이 열리면 동작
		}
		
		ws.onmessage = function(data) {
			//메시지를 받으면 동작
			var chr_message = data.data;
			if(chr_message != null && chr_message.trim() != ''){
				var d = JSON.parse(chr_message);
				if(d.type == "getId"){
					var si = d.sessionId != null ? d.sessionId : "";
					if(si != ''){
						$("#sessionId").val(si); 
					}
				}else if(d.type == "message"){
					if(d.sessionId == $("#sessionId").val()){
						$("#chating").append("<p class='me'>나 :" + d.chr_message + "</p>");	
					}else{
						$("#chating").append("<p class='others'>" + d.u_nickname + " :" + d.chr_message + "</p>");
					}
				}else{
					console.warn("unknown type!")
				}
			}
		}

		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
	}

	function send() {
		var option ={
			type: "message",
			chr_no : $("#chr_no").val(),
			sessionId : $("#sessionId").val(),
			u_nickname : "${loginVo.u_nickname}",
			chr_message : $("#chatting").val(),
			u_no : "${loginVo.u_no}"
		}

	    // 서버로 메시지 저장 요청 보내기
	    saveMessageToDB(option);

		ws.send(JSON.stringify(option))
		$('#chatting').val("");
	}
	$(document).ready(function() {
		wsOpen(); // 문서가 로드되면 WebSocket을 엽니다.
		$("#yourMsg").show(); // 메시지 입력 부분을 표시합니다.
	});
	
	function saveMessageToDB(message) {
	    // AJAX 또는 다른 방법으로 서버에 메시지 저장 요청 보내기
	    $.ajax({
	        type: "POST",
	        url: "/saveMessageToDB",
	        data: JSON.stringify(message),
	        contentType: "application/json",
	        success: function(response) {
	            console.log("Message saved to DB successfully");
	        },
	        error: function(error) {
	            console.error("Error saving message to DB:", error);
	        }
	    });
	    
	}
	function leftBtn(){
		window.location.href = '/room';
	}
	
</script>
<body>
<div class="container-xxl bg-white p-0" >
    <div class="container-fluid nav-bar bg-transparent">
      <%@include file="/WEB-INF/views/include/nav.jsp"%>
    </div>

    <!-- Header Start -->
          <div class="container-fluid header bg-white p-0">
            <div class="row g-0 align-items-center flex-column-reverse flex-md-row">
               <div class="p-5 mt-lg-5">
                 <h1 class="display-4 animated fadeIn mb-4" style="margin-top : 13%; text-align: center;">채팅방</h1>
               </div>
            </div>  
	        <hr>
	        <hr>
          </div>  
    <!-- Header End --> 

	<div id="container1" class="container1">
		<h1>${chr_title}의 채팅방</h1>
		<input type="hidden" id="sessionId" value="${loginVo.u_id}">
		<input type="hidden" id="chr_no" value="${chr_no}">
		
		<div id="chating" class="chating">
			<c:forEach var="msg" items="${msgList}">
                <c:choose>
                    <c:when test="${msg.u_nickname eq loginVo.u_nickname}">
                        <p class='me'>나 : ${msg.chr_message}</p>
                    </c:when>
                    <c:otherwise>
                        <p class='others'>${msg.u_nickname} : ${msg.chr_message}</p>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
		</div>
		<br>
		<div id="yourMsg">
			<table class="inputTable" style="margin: auto;">
				<tr>
					<th><input id="chatting" name="chr_message" placeholder="보내실 메시지를 입력하세요."></th>
					<th><button onclick="send()" id="sendBtn">
					<img src="https://ca-fe.pstatic.net/web-talk/static/img/sprite_talkwrite_1cd38f.svg#04b56c-usage" alt="Send" style="max-width: 100%; max-height: 100%;">
					</button>
					</th>
				</tr>
			</table>
			<br>
			<div style="text-align: center;">
					<button onclick="leftBtn()" id="leftBtn" class="btn btn-secondary">나가기</button>
			</div>		
		</div>
	</div>
		<!-- Footer Start -->
		<div
			class="container-fluid bg-dark text-white-50 footer pt-5 mt-5 wow fadeIn"
			data-wow-delay="0.1s">
			<div class="container py-5">
				<div class="row g-5">
					<div class="col-lg-3 col-md-6">
						<h5 class="text-white mb-4">Get In Touch</h5>
						<p class="mb-2">
							<i class="fa fa-map-marker-alt me-3"></i>그린아카데미
						</p>
						<p class="mb-2">
							<i class="fa fa-phone-alt me-3"></i>010-0000-0000
						</p>
						<p class="mb-2">
							<i class="fa fa-envelope me-3"></i>green@naver.com
						</p>
					</div>
					<div class="col-lg-3 col-md-6">
						<h5 class="text-white mb-4">Quick Links</h5>
						<a class="btn btn-link text-white-50" href="/Kidzzone">예스키즈존</a> <a
							class="btn btn-link text-white-50" href="/BoardList">게시판</a> <a
							class="btn btn-link text-white-50" href="">채팅방</a> <a
							class="btn btn-link text-white-50" href="">고객문의</a> <a
							class="btn btn-link text-white-50" href="">마이 페이지</a>
					</div>
					<div class="col-lg-3 col-md-6">
						<h5 class="text-white mb-4">Newsletter</h5>
						<p>
							어린이 관련 뉴스를 <br>이메일로 받아보세요!
						</p>
						<div class="position-relative mx-auto" style="max-width: 400px;">
							<input class="form-control bg-transparent w-100 py-3 ps-4 pe-5"
								type="text" placeholder="이메일 입력">
							<button type="button"
								class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">구독</button>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<h5 class="text-white mb-4">About</h5>
						<p>
							키즈파크에 오신것을 환영합니다.<br>많은 이용 부탁드립니다!
						</p>
						<div class="d-flex pt-2">
							<a class="btn btn-outline-light btn-social" href=""><i
								class="fab fa-twitter"></i></a> <a
								class="btn btn-outline-light btn-social" href=""><i
								class="fab fa-facebook-f"></i></a> <a
								class="btn btn-outline-light btn-social" href=""><i
								class="fab fa-youtube"></i></a> <a
								class="btn btn-outline-light btn-social" href=""><i
								class="fab fa-linkedin-in"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="copyright">
					<div class="row">
						<div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
							&copy; <a class="border-bottom" href="#">KidzPark</a>, All Right
							Reserved.

						</div>
						<div class="col-md-6 text-center text-md-end">
							<div class="footer-menu">
								<a href="">Home</a> <a href="">게시판</a> <a href="">채팅방</a> <a
									href="">고객센터</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Footer End -->
		</div>
	<!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
	
    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>
</html>