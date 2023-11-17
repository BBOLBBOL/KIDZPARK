<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="utf-8">

<head>
    <meta charset="utf-8">
    <title>채팅방</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"><link rel="stylesheet" href="/css/chat.css">
    <meta content="" name="keywords">
    <meta content="" name="description">

</head>

<body>

    <div class="container-xxl bg-white p-0" >
    <div class="container-fluid nav-bar bg-transparent">
      <%@include file="/WEB-INF/views/include/nav.jsp"%>
    </div>
        <!-- Header Start -->
        <div class="container-fluid header bg-white p-0">
        <div class="row g-0 align-items-center flex-column-reverse flex-md-row">
                    <h1 class="display-5 animated fadeIn mb-4" style="margin-top : 12%;  text-align: center;">키즈파크 채팅방</h1>
                </div>
                </div>

      <hr>
		<div id="container">
			<main>
				<ul id="chat">
				</ul>
				<footer>
					<!--<textarea id="opinion" placeholder="Type your message" onkeyup="enterkey()"></textarea>-->
					<input id="opinion" type="text" onkeyup="enterkey()" style="width: 100%; height: 25px;"> 
				</footer>
			</main>
		</div>
		<hr>

		<!-- Footer Start -->
        <div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container py-5">
                <div class="row g-5">
                    <div class="col-lg-3 col-md-6">
                        <h5 class="text-white mb-4">Get In Touch</h5>
                        <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>그린아카데미</p>
                        <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>010-0000-0000</p>
                        <p class="mb-2"><i class="fa fa-envelope me-3"></i>green@naver.com</p>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h5 class="text-white mb-4">Quick Links</h5>
                        <a class="btn btn-link text-white-50" href="">예스키즈존</a>
                        <a class="btn btn-link text-white-50" href="">게시판</a>
                        <a class="btn btn-link text-white-50" href="">채팅방</a>
                        <a class="btn btn-link text-white-50" href="">고객문의</a>
                        <a class="btn btn-link text-white-50" href="">마이 페이지</a>
                    </div>
                   <div class="col-lg-3 col-md-6">
                        <h5 class="text-white mb-4">Newsletter</h5>
                        <p>어린이 관련 뉴스를 <br>이메일로 받아보세요! </p>
                        <div class="position-relative mx-auto" style="max-width: 400px;">
                            <input class="form-control bg-transparent w-100 py-3 ps-4 pe-5" type="text" placeholder="이메일 입력">
                            <button type="button" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">구독</button>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h5 class="text-white mb-4">About</h5>
                       <p>키즈파크에 오신것을 환영합니다.<br>많은 이용 부탁드립니다!</p>        
                        <div class="d-flex pt-2">
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-youtube"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-linkedin-in"></i></a>
                        </div>            
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="copyright">
                    <div class="row">
                        <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                            &copy; <a class="border-bottom" href="#">KidzPark</a>, All Right Reserved. 
                     
                        </div>
                        <div class="col-md-6 text-center text-md-end">
                            <div class="footer-menu">
                                <a href="">Home</a>
                                <a href="">게시판</a>
                                <a href="">채팅방</a>
                                <a href="">고객센터</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->
      </div>


	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	
	<script>

    const username = '${loginVo.u_name}';

    //const websocket = new WebSocket("ws://localhost:80/ws/chat");
    websocket.onmessage = onMessage;
    websocket.onopen = onOpen;
    websocket.onclose = onClose;

    let isSeeing = true;
    document.addEventListener("visibilitychange", function() {
        console.log(document.visibilityState);
        if(document.visibilityState == "hidden"){
            isSeeing = false;
        }else{
            isSeeing = true;
        }
    });

    var newExcitingAlerts = (function () {
        var oldTitle = document.title;
        var msg = "★Message!★";
        var timeoutId;
        var blink = function() { document.title = document.title == msg ? ' ' : msg;
            if(isSeeing == true){
                clear();
            }
        };
        var clear = function() {
            clearInterval(timeoutId);
            document.title = oldTitle;
            window.onmousemove = null;
            timeoutId = null;
        };
        return function () {
            if (!timeoutId) {
                timeoutId = setInterval(blink, 1000);
            }
        };
    }());

    setInterval(() => console.log(new Date()), 10000); //prevent chrome refresh

    $(document).ready(function(){
        $(".floating-chat").click();

        $("#disconn").on("click", (e) => {
            disconnect();
        })

        $("#button-send").on("click", (e) => {
            send();
        });
    })

    function enterkey(){
        if (window.event.keyCode == 13) {
            send();
        }
    }
    function send(){
        console.log(username + ":" + $("#opinion").val());
        if($("#opinion").val() != ""){
            websocket.send(username + ":" + $("#opinion").val());
            $("#opinion").val('');
        }
    }

    function onClose(evt) {
        var str = username + ": 님이 방을 나가셨습니다.";
        websocket.send(str);
    }

    function onOpen(evt) {
        var str = username + ": 님이 입장하셨습니다.";
        websocket.send(str);
    }

    let cachedTime;
    let cachedSessionId;
    function onMessage(msg) {
        var data = msg.data;
        var sessionId = null;
        var message = null;
        var arr = data.split(":");

        for(var i=0; i<arr.length; i++){
            console.log('arr[' + i + ']: ' + arr[i]);
        }

        var cur_session = username;

        console.log("cur_session : " + cur_session);


        sessionId = arr[0];
        message = arr[1];

        console.log("sessionID : " + sessionId);
        console.log("cur_session : " + cur_session);


        if(message == " 님이 입장하셨습니다."){
            message = sessionId + "님이 입장하셨습니다.";
        }
        if(message == undefined){
            message = "채팅이 종료되었습니다.";
        }
        const date = new Date();
        let hour = date.getHours() < 10 ? `0${date.getHours()}` : date.getHours();
        let min = date.getMinutes() < 10 ? `0${date.getMinutes()}` : date.getMinutes();
        let amOrPm;
        if(hour >= 12){
            amOrPm = "PM"
        }else{
            amOrPm = "AM"
        }
        let currentTime = hour + ":" + min + " " + amOrPm;

        let userIdAndTimeHtml;
        if(cachedSessionId != sessionId || cachedTime != currentTime){
            userIdAndTimeHtml = "<div class='entete'>\n<h3>" + currentTime + "</h3>\n<h2>" + sessionId + "</h2>\n</div>"
        }else{
            userIdAndTimeHtml = "";
        }

        if(sessionId == cur_session){
            var str = "<li class='me'>" +
                userIdAndTimeHtml +
                "<div class='message'>";
            str += message;
            str += "</div></li>";
            $("#chat").append(str);
        }
        else{
            var str = "<li class='you'>" +
                userIdAndTimeHtml +
                "<div class='message'>";
            str += message;
            str += "</div></li>";
            $("#chat").append(str);

            if(isSeeing == false){
                newExcitingAlerts();
            }
        }

        cachedSessionId = sessionId;
        cachedTime = currentTime;

        document.getElementById("chat").scrollTop = document.getElementById("chat").scrollHeight;
    }
</script>
	

</body>

</html>