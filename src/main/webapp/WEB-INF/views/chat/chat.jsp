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
			width: 500px;
			margin: 0 auto;
			padding: 25px
		}
		.container1 h1{
			text-align: left;
			padding: 5px 5px 5px 15px;
			color: #FFBB00;
			border-left: 3px solid #FFBB00;
			margin-bottom: 20px;
		}
		.chating{
			background-color: #000;
			width: 500px;
			height: 500px;
			overflow: auto;
		}
		.chating .me{
			color: #F6F6F6;
			text-align: right;
		}
		.chating .others{
			color: #FFE400;
			text-align: left;
		}
		input{
			width: 330px;
			height: 25px;
		}
		#yourMsg{
			display: none;
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
		
		<div id="yourMsg">
			<table class="inputTable">
				<tr>
					<th>메시지</th>
					<th><input id="chatting" name="chr_message" placeholder="보내실 메시지를 입력하세요."></th>
					<th><button onclick="send()" id="sendBtn">보내기</button></th>
				</tr>
			</table>
		</div>
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