<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
	<title>Room</title>
	
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
	padding: 25px;
	text-align: center;
}
.container1 h1{
	text-align: center;
	padding: 5px 5px 5px 15px;
	color: #00B98E;
	margin-bottom: 20px;
}
.roomContainer{
	background-color: #F6F6F6;
	width: 450px;
	height: 400px;
	overflow: auto;
	margin: auto;
}
.roomList{
	border: none;
}
.roomList th{
	border: 1px solid #00B98E;
	background-color: #fff;
	color: #00B98E;
}
.roomList td{
	border: 1px solid #00B98E;
	background-color: #fff;
	text-align: left;
	color: #00B98E;
	padding: 3px 3px;
	
}
.roomList .num{
	width: 75px;
	text-align: center;
}
.roomList .room{
	width: 320px;
}
.roomList .go{
	width: 71px;
	text-align: center;
}
.roomList .member{
	width: 100px;
	text-align: center;
}
button{
	background-color: #00B98E;
	font-size: 14px;
	color: #000;
	border: 1px solid #000;
	border-radius: 5px;
}
.inputTable th{
	padding: 5px;
}
.inputTable input{
	width: 300px;
	height: 40x;
	margin-right : 10px;
	padding: 9px 70px 7px 10px;
    box-sizing: border-box;
    border-radius: 18px;
    background-color: #f5f6f8;
    display: flex;
    justify-content: center;
}

</style>
<script>
</script>
</head>

<script type="text/javascript">
	var ws;

	window.onload = function(){
		getRoom();
		createRoom();
	}

	function getRoom(){
		cAjax('/getRoom', "", 'post', function(result){
			createChatingRoom(result);
		});
	}
	
	function createRoom(){
		$("#createRoom").click(function(){
			var msg = {	chr_title : $('#chr_title').val()	};

			cAjax('/createRoom', msg, 'post', function(result){
				createChatingRoom(result);
			});

			$("#chr_title").val("");
			window.location.href = '/room';
		});
	}

	function goRoom(number, name, u_no){
		location.href="/moveChating?chr_title="+name+"&"+"chr_no="+number+"&"+"u_no="+u_no;
	}

	function createChatingRoom(res){
		if(res != null){
			var tag = "<tr><th class='num'>순서</th><th class='room'>방 이름 (인원)</th><th class='go'></th></tr>";
			res.forEach(function(d, idx){
				console.log(d);
				var rn = d.chr_title.trim();
				var chr_no = d.chr_no;
				var u_no = ${loginVo.u_no};
				
				//cAjax('/getChatroomMembers', { chr_no: chr_no, u_no: u_no }, 'post', function (members) {
		        var Count = d.chr_peoplecount;
				
				tag += "<tr>"+
							"<td class='num'>"+(idx+1)+"</td>"+
							"<td class='room'>"+ rn + " ("+ Count + ") " +"</td>"+
							"<td class='go'><button class='btn btn-primary' type='button' onclick='goRoom(\""+chr_no+"\", \""+rn+"\", \""+u_no+"\")'>참여</button></td>" +
						"</tr>";
				$("#roomList").empty().append(tag);
				//});
			}); // forEach end
		} // if end
	} // createChatingRoom end

	function cAjax(url, parameter, type, calbak, contentType){
		$.ajax({
			url: url,
			data: parameter,
			type: type,
			contentType : contentType!=null?contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			success: function (res) {
				calbak(res);
			},
			error : function(err){
				console.log('error');
				calbak(err);
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
                 <h1 class="display-4 animated fadeIn mb-4" style="margin-top : 13%; text-align: center;">채팅방 목록</h1>
               </div>
            </div>  
	        <hr>
	        <hr>
          </div>  
    <!-- Header End --> 
    
	<div class="container1">
		<h1>채팅방</h1>
		<div id="roomContainer" class="roomContainer">
			<table id="roomList" class="roomList"></table>
		</div>
		<br>
		<div style="display: flex; justify-content: center;">
			<table class="inputTable">
			<c:if test="${loginVo ne null and loginVo.u_no == 99}">
				<tr>
					<th><input type="text" name="chr_title" id="chr_title"></th>
					<br>
					<th><button id="createRoom" class="btn btn-primary">방 만들기</button></th>
				</tr>
			</c:if>	
			</table>
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