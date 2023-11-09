<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="utf-8">

<head>
<meta charset="utf-8">
<title>Yes키즈존</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="css/style.css" rel="stylesheet">
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
}

.row1 { 
	display: flex;
	flex-wrap: wrap;
	margin : 25px 25px auto;
	
}
#map{
margin: auto;
}
.chat-list {
	width: 400px;
	margin: auto;
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

.chat-room {
	padding: 20px;
	border-bottom: 1px solid #ddd;
}

.chat-room:last-child {
	border-bottom: none; /* 마지막 채팅방의 하단 경계선 제거 */
}

.chat-room h3 {
	margin: 0;
}

.chat-room p {
	margin: 0;
}

.chat-room .last-message {
	color: #888;
}

.chat-room .timestamp {
	font-size: 12px;
	color: #888;
}

.flex {
	
}
</style>

</head>
<body>

	<div class="container-xxl bg-white p-0">
		<div class="container-fluid nav-bar bg-transparent">
			<%@include file="/WEB-INF/views/include/nav.jsp"%>
		</div>
		<!-- Header Start -->
		<div class="container-fluid header bg-white p-0">
			<div
				class="row g-0 align-items-center flex-column-reverse flex-md-row">
				<div class="p-5 mt-lg-5">
					<h1 class="display-4 animated fadeIn mb-4"
						style="margin-top: 13%; text-align: center;">Yes키즈존</h1>
				</div>
			</div>
			<hr>
			<hr>
		</div>
		<!-- Header End -->
		<!-- 지도 화면 구현 -->

		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9498e4a9ccb49a333639cda66a55991c"></script>
  <div class="container-xxl py-5">
   <div class="container">
		<div class="row1">
			<div id="map"
				style="width: 500px; height: 450px; margin-top: 3%; border-radius: 10px; border: 2px solid #000;">
			</div>

			<!-- 지도 화면 구현 끝 -->
			<div class="chat-list"
				style="margin-top: 3%; max-width: 300px;">
				<div class="chat-room">
					<a href="">
						<h3>키즈존1</h3>
						<p class="last-message">키즈존1</p>
						<p class="timestamp">키즈존 입니다</p>
					</a>
				</div>
				<div class="chat-room">
					<a href="">
						<h3>키즈존2</h3>
						<p class="last-message">키즈존2</p>
						<p class="timestamp">키즈존 입니다</p>
					</a>
				</div>
				<div class="chat-room">
					<a href="">
						<h3>키즈존3</h3>
						<p class="last-message">키즈존3</p>
						<p class="timestamp">키즈존 입니다</p>
					</a>
				</div>
				<div class="chat-room">
					<a href="">
						<h3>키즈존4</h3>
						<p class="last-message">키즈존4</p>
						<p class="timestamp">키즈존 입니다</p>
					</a>
				</div>
				<!-- 다른 채팅방들을 나열하십시오 -->
			</div>
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
						<a class="btn btn-link text-white-50" href="">예스키즈존</a> <a
							class="btn btn-link text-white-50" href="">게시판</a> <a
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="lib/wow/wow.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/waypoints/waypoints.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>
<script>
  var mapContainer = document.getElementById('map'), // 지도를 표시할 div
          mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
          };

  // 지도를 생성합니다
  var map = new kakao.maps.Map(mapContainer, mapOption);

  // 주소-좌표 변환 객체를 생성합니다
  var geocoder = new kakao.maps.services.Geocoder();

  var positions = [
    {
      title: '카카오',
      address: '제주특별자치도 제주시 첨단로 242'
    },
    {
      title: '생태연못',
      address: '경기 남양주시 조안면 능내리 50'
    },
    {
      title: '근린공원',
      address: '경기 남양주시 별내면 청학로68번길 40'
    }
  ];

  positions.forEach(function (position) { //추가한 코드
    // 주소로 좌표를 검색합니다
    geocoder.addressSearch(position.address, function(result, status) {

      // 정상적으로 검색이 완료됐으면
      if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
          map: map,
          position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        //변경한 코드
        var infowindow = new kakao.maps.InfoWindow({
          content: '<div style="width:150px;text-align:center;padding:6px 0;">' + position.title + '</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
      }
    });
  });
</script>
</body>

</html>