<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="utf-8">

<head>
    <meta charset="utf-8">
    <title>채팅방</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    <style>
    

.floating-chat {

  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  color: white;
  /* position: fixed; */
  bottom: 10px;
  /*right: 10px;*/
  width: 40px;
  height: 500px;
  transform: translateY(70px);
  transition: all 250ms ease-out;
  border-radius: 50%;
  opacity: 0;
  background: -moz-linear-gradient(-45deg, #183850 0, #183850 25%, #192C46 50%, #22254C 75%, #22254C 100%);
  background: -webkit-linear-gradient(-45deg, #183850 0, #183850 25%, #192C46 50%, #22254C 75%, #22254C 100%);
  background-repeat: no-repeat;
  background-attachment: fixed;
}
.floating-chat.enter:hover {
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
  opacity: 1;
}
.floating-chat.enter {
  transform: translateY(0);
  opacity: 0.6;
  box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.12), 0px 1px 2px rgba(0, 0, 0, 0.14);
}
.floating-chat.expand {

  margin-top:200px;
  width: 100%;
  height: 600px;
  border-radius: 5px;
  cursor: auto;
  opacity: 1;
}
.floating-chat :focus {
  outline: 0;
  box-shadow: 0 0 3pt 2pt rgba(14, 200, 121, 0.3);
}
.floating-chat button {
  background: transparent;
  border: 0;
  color: white;
  text-transform: uppercase;
  border-radius: 3px;
  cursor: pointer;
}
.floating-chat .chat {
  display: flex;
  flex-direction: column;
  flex-wrap : nowrap;
  position: fixed;
  opacity: 0;
  width: auto;
  height: auto;
  border-radius: 50%;
  transition: all 250ms ease-out;
  margin: auto;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
}
.floating-chat .chat.enter {
  opacity: 1;
  border-radius: 0;
  margin: 10px;
  width: auto;
  height: auto;
}
.floating-chat .chat .header {
  flex-shrink: 0;
  padding-bottom: 10px;
  display: flex;
  background: transparent;
  
}
.floating-chat .chat .header .title {
  flex-grow: 1;
  flex-shrink: 1;
  padding: 0 5px;
}
.floating-chat .chat .header button {
  flex-shrink: 0;
}
.floating-chat .chat .messages {
  padding: 10px;
  margin: 0;
  list-style: none;
  overflow-y: scroll;
  overflow-x: hidden;
  flex-grow: 1;
  border-radius: 4px;
  background: transparent;
  
}
.floating-chat .chat .messages::-webkit-scrollbar {
  width: 5px;
}
.floating-chat .chat .messages::-webkit-scrollbar-track {
  border-radius: 5px;
  background-color: rgba(25, 147, 147, 0.1);
}
.floating-chat .chat .messages::-webkit-scrollbar-thumb {
  border-radius: 5px;
  background-color: rgba(25, 147, 147, 0.2);
}
.floating-chat .chat .messages li {
  position: relative;
  clear: both;
  display: inline-block;
  padding: 14px;
  margin: 0 0 20px 0;
  font: 12px/16px "Noto Sans", sans-serif;
  border-radius: 10px;
  background-color: rgba(25, 147, 147, 0.2);
  word-wrap: break-word;
  max-width: 81%;
  max-height: inherit; /* 부모 요소의 높이를 상속받도록 설정 */
}
.floating-chat .chat .messages li:before {
  position: absolute;
  top: 0;
  width: 25px;
  height: 25px;
  border-radius: 25px;
  content: "";
  background-size: cover;
}
.floating-chat .chat .messages li:after {
  position: absolute;
  top: 10px;
  content: "";
  width: 0;
  height: 0;
  border-top: 10px solid rgba(25, 147, 147, 0.2);
}
.floating-chat .chat .messages li.other {
  animation: show-chat-odd 0.15s 1 ease-in;
  -moz-animation: show-chat-odd 0.15s 1 ease-in;
  -webkit-animation: show-chat-odd 0.15s 1 ease-in;
  float: right;
  margin-right: 45px;
  color: #0AD5C1;
}
.floating-chat .chat .messages li.other:before {
  right: -45px;
  background-image: url(https://github.com/stir084.png);
}
.floating-chat .chat .messages li.other:after {
  border-right: 10px solid transparent;
  right: -10px;
}
.floating-chat .chat .messages li.self {
  animation: show-chat-even 0.15s 1 ease-in;
  -moz-animation: show-chat-even 0.15s 1 ease-in;
  -webkit-animation: show-chat-even 0.15s 1 ease-in;
  float: left;
  margin-left: 45px;
  color: #0EC879;
}
.floating-chat .chat .messages li.self:before {
  left: -45px;
  background-image: url(https://github.com/zorojuno.png);
}
.floating-chat .chat .messages li.self:after {
  border-left: 10px solid transparent;
  left: -10px;
}
.floating-chat .chat .footer {
  flex-shrink: 0;
  display: flex;
  padding-top: 10px;
  max-height: 90px;
  background: transparent;
}
.floating-chat .chat .footer .text-box {
  border-radius: 3px;
  background: rgba(25, 147, 147, 0.2);
  height: 100%;
  width: 100%;
  margin-right: 5px;
  color: #0EC879;
  overflow-y: auto;
  padding: 2px 5px;
}
.floating-chat .chat .footer .text-box::-webkit-scrollbar {
  width: 5px;
}
.floating-chat .chat .footer .text-box::-webkit-scrollbar-track {
  border-radius: 5px;
  background-color: rgba(25, 147, 147, 0.1);
}
.floating-chat .chat .footer .text-box::-webkit-scrollbar-thumb {
  border-radius: 5px;
  background-color: rgba(25, 147, 147, 0.2);
}

@keyframes show-chat-even {
  0% {
    margin-left: -480px;
  }
  100% {
    margin-left: 0;
  }
}
@-moz-keyframes show-chat-even {
  0% {
    margin-left: -480px;
  }
  100% {
    margin-left: 0;
  }
}
@-webkit-keyframes show-chat-even {
  0% {
    margin-left: -480px;
  }
  100% {
    margin-left: 0;
  }
}
@keyframes show-chat-odd {
  0% {
    margin-right: -480px;
  }
  100% {
    margin-right: 0;
  }
}
@-moz-keyframes show-chat-odd {
  0% {
    margin-right: -480px;
  }
  100% {
    margin-right: 0;
  }
}
@-webkit-keyframes show-chat-odd {
  0% {
    margin-right: -480px;
  }
  100% {
    margin-right: 0;
  }
}

 .text-box div:nth-child(n+1) {
        display: none;
    }
    
    

</style>  

</head>

<body>

    <div class="container-xxl bg-white p-0" >
    <div class="container-fluid nav-bar bg-transparent">
      <%@include file="/WEB-INF/views/include/nav.jsp"%>
    </div>
        <!-- Header Start -->
        <div class="container-fluid header bg-white p-0">
        <div class="row g-0 align-items-center flex-column-reverse flex-md-row">
                    <h1 class="display-5 animated fadeIn mb-4" style="margin-top : 12%;  text-align: center;">(이름변경)잡담 채팅방</h1>
                </div>
                </div>

      <hr>
		<div class="floating-chat expand enter" style="margin:auto;">
			<i class="fa fa-comments" aria-hidden="true"></i>
			<div class="chat">
				<div class="header">
					<span class="title"> (이름변경) 채팅방 </span>
				</div>
				<ul id="msgArea" class="messages">
				</ul>
				<div class="footer">
					<div id="opinion" class="text-box" contenteditable="true"
						disabled="true" onkeyup="enterkey()"></div>
				</div>
			</div>
		</div>


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
	var element = $('.floating-chat');
	var myStorage = localStorage;

	if (!myStorage.getItem('chatID')) {
	    myStorage.setItem('chatID', createUUID());
	}

	setTimeout(function() {
	    element.addClass('enter');
	}, 1000);

	element.click(openElement);

	function openElement() {
	    var messages = element.find('.messages');
	    var textInput = element.find('.text-box');
	    element.find('>i').hide();
	    element.addClass('expand');
	    element.find('.chat').addClass('enter');
	    var strLength = textInput.val().length * 2;
	    textInput.keydown(onMetaAndEnter).prop("disabled", false).focus();
	    element.off('click', openElement);
	    element.find('.header button').click(closeElement);
	    element.find('#sendMessage').click(sendNewMessage);
	    messages.scrollTop(messages.prop("scrollHeight"));
	}

	function closeElement() {
	    element.find('.chat').removeClass('enter').hide();
	    element.find('>i').show();
	    element.removeClass('expand');
	    element.find('.header button').off('click', closeElement);
	    element.find('#sendMessage').off('click', sendNewMessage);
	    element.find('.text-box').off('keydown', onMetaAndEnter).prop("disabled", true).blur();
	    setTimeout(function() {
	        element.find('.chat').removeClass('enter').show()
	        element.click(openElement);
	    }, 500);
	}

	function createUUID() {
	    // http://www.ietf.org/rfc/rfc4122.txt
	    var s = [];
	    var hexDigits = "0123456789abcdef";
	    for (var i = 0; i < 36; i++) {
	        s[i] = hexDigits.substr(Math.floor(Math.random() * 0x10), 1);
	    }
	    s[14] = "4"; // bits 12-15 of the time_hi_and_version field to 0010
	    s[19] = hexDigits.substr((s[19] & 0x3) | 0x8, 1); // bits 6-7 of the clock_seq_hi_and_reserved to 01
	    s[8] = s[13] = s[18] = s[23] = "-";

	    var uuid = s.join("");
	    return uuid;
	}

	function sendNewMessage() {
	    var userInput = $('.text-box');
	    var newMessage = userInput.html().replace(/\<div\>|\<br.*?\>/ig, '\n').replace(/\<\/div\>/g, '').trim().replace(/\n/g, '<br>');

	    if (!newMessage) return;

	    var messagesContainer = $('.messages');

	    messagesContainer.append([
	        '<li class="self">',
	        newMessage,
	        '</li>'
	    ].join(''));

	    // clean out old message
	    userInput.html('');
	    // focus on input
	    userInput.focus();

	    messagesContainer.finish().animate({
	        scrollTop: messagesContainer.prop("scrollHeight")
	    }, 250);
	}


	function onMetaAndEnter(event) {
	    if ((event.metaKey || event.ctrlKey) && event.keyCode == 13) {
	        sendNewMessage();
	    }
	}
	
	
	</script>
	
	<script>

    const username = '${id}';

    const websocket = new WebSocket("ws://localhost:80/ws/chat");
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
        console.log(username + ":" + $("#opinion").text());
        if($("#opinion").text() != ""){
            websocket.send(username + ":" + $("#opinion").text());
            $("#opinion").text('');
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
        if(sessionId == cur_session){
            var str = "<li class='other'>";
            str += message;
            str += "</li>";
            $("#msgArea").append(str);
        }
        else{
            var str = "<li class='self'>";
            str += message;
            str += "</li>";
            $("#msgArea").append(str);

            if(isSeeing == false){
                newExcitingAlerts();
            }
        }

        document.getElementById("msgArea").scrollTop = document.getElementById("msgArea").scrollHeight;
    }
</script>
	

</body>

</html>