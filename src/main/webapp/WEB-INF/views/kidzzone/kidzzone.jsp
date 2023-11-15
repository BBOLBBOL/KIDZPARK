<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	margin: 25px 25px auto;
}

#map {
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

.chat-list {
	height: 50vh; /* 뷰포트의 높이를 100%로 설정 */
	overflow-y: auto; /* 수직 스크롤을 가능하게 설정 */
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
		</div>
		<!-- Header End -->

		<!-- Search Start -->
		<form action="/KidzzoneSearch" method="post">
		<div class="container-fluid bg-primary mb-5 wow fadeIn"
			data-wow-delay="0.1s" style="padding: 35px;">
			<div class="container">
				<div class="row g-2">
					<div class="col-md-10">
						<div class="row g-2">
							<div class="col-md-3">
								<select class="form-select border-0 py-3" name="kz_location">
									<option value="all" selected>지역</option>
									<option value="서울">서울</option>
									<option value="부산">부산</option>
									<option value="인천">인천</option>
									<option value="대구">대구</option>
									<option value="대전">대전</option>
									<option value="광주">광주</option>
									<option value="울산">울산</option>
								</select>
							</div>
							<div class="col-md-3">
								<select class="form-select border-0 py-3" name="kz_category">
									<option value="all" selected>카테고리</option>
									<option value="카페">카페</option>
									<option value="음식점">음식점</option>
									<option value="키즈카페">키즈카페</option>
									<option value="체험활동">체험활동</option>
								</select>
							</div>
							<div class="col-md-3">
								<select class="form-select border-0 py-3" name="searchOption">
									<option value="all" selected>검색</option>
									<option value="KZ_NAME">매장 이름</option>
									<option value="KZ_ADDRESS">매장 주소</option>
								</select>
							</div>
							<div class="col-md-3">
								<input type="text" class="form-control border-0 py-3"
									name="searchKeyword" placeholder="Search Keyword">
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<button type="submit" class="btn btn-dark border-0 w-100 py-3">Search</button>
					</div>
				</div>
			</div>
		</div>
		</form>
		<!-- Search End -->
		<!-- 지도 화면 구현 -->

		<div class="container-xxl py-5">
			<div class="container">
				<div class="row1">
					<div id="map"
						style="width: 500px; height: 450px; margin-top: 3%; border-radius: 10px; border: 2px solid #000;">
					</div>

					<!-- 지도 화면 구현 끝 -->
					<div class="chat-list" style="margin-top: 3%; max-width: 300px;">
						<div id="content"></div>
						<div class="pagination">
							<div id="pageNum"></div>
						</div>
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
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fad561524453bbd8238a7dec3e7acb20&libraries=services"></script>
	<script>
	
	window.onload = function() {
	    // 페이지 로드 완료 후 updatePage 함수 실행
	    updatePage();
	};
	
    let pg = '${pg}'; // 페이지네이션 정보
    let nowPage = pg.nowPage; // 현재 페이지 번호
    let cntPerPage = pg.cntPerPage; // 페이지당 항목 수
    
	$(document).on('click', '#pageNum a', function(e) {
		e.preventDefault();
	    nowPage = $(this).text(); // 클릭한 버튼의 페이지 번호
	    updatePage(); // AJAX 요청 재실행
	});
	    
	    function updatePage() {  	
	    	$.ajax({
	    		type: "GET",
	   			 url: "/Kidzzonelist", // 요청 URL
	   			 data: { 
	    					nowPage: nowPage, // 페이지 번호
	        				cntPerPage: cntPerPage // 페이지당 표시할 항목 수
	    },
	    success: function(response) {	    	
	        let tag = '';
	        for(let position of response.selectkiddzone) {
	            tag += '<div class="chat-room">'
	            tag += '<a href=""><h3>' + position.kz_name + '</h3><p class="timestamp">' +position.kz_explanation + '</p>'
	            tag += '<p class="last-message">' + position.kz_openingtime + '</p></a></div>'
	        }
	        // 페이지 내용 갱신
		        $("#content").html(tag);
	        
	        let page = response.pg;
	        
	    	 let pageNumTag = '';
		        if(page.startPage != 1) {
		            pageNumTag += '<a href="/Kidzzonelist?nowPage=' + (page.startPage - 1) + '&cntPerPage=' + page.cntPerPage + '">&lt;</a>';
		        }
		        for(let p = page.startPage; p <= page.endPage; p++) {
		            if(p == page.nowPage) {
		                pageNumTag += '<a>' + p + '</a>';
		            } else {
		                pageNumTag += '<a href="/Kidzzonelist?nowPage=' + p + '&cntPerPage=' + page.cntPerPage + '">' + p + '</a>';
		            }
		        }
		        if(response.pg.endPage != response.pg.lastPage) {
		            pageNumTag += '<a href="/Kidzzonelist?nowPage=' + (page.endPage+1) + '&cntPerPage=' + page.cntPerPage + '">&gt;</a>';
		        }
		        // 페이지네이션 링크 갱신
		        $("#pageNum").html(pageNumTag);
	    	

	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	        console.log("오류: ", textStatus, errorThrown); // 오류 정보 출력
	    }
	});
	         }
	

	
// 지도 api	

var jsonStr = '${json}';
jsonStr = jsonStr.replace(/\n/g, "\\n");
var data = JSON.parse(jsonStr);

var positions = data.selectkiddzone;

var mapContainer = document.getElementById('map'); // 지도를 표시할 div
var mapOption = {
    center: new kakao.maps.LatLng(35.157759003, 129.059317193), // 기본 지도 중심좌표
    level: 3 // 지도의 확대 레벨
};

// 지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption);

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// positions 배열의 forEach 블록을 이동하였습니다.
positions.forEach(function (position) {
    // 주소로 좌표를 검색합니다
    geocoder.addressSearch(position.kz_address, function (result, status) {
        console.log(result, status);
        // 정상적으로 검색이 완료됐으면
        if (status === kakao.maps.services.Status.OK) {
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
            // 결과값으로 받은 위치를 마커로 표시합니다
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });

            // 인포윈도우로 장소에 대한 설명을 표시합니다
            // 변경한 코드
            var infowindow = new kakao.maps.InfoWindow({
                content: '<div style="width:150px;text-align:center;padding:6px 0;">' +
                    position.kz_name + '</div>'
            });
            infowindow.open(map, marker);
            
        }
    });
});

// GeoLocation을 이용해서 접속 위치를 얻어옵니다
if (navigator.geolocation) {
    navigator.geolocation.watchPosition(function (position) {
        try {
            var lat = position.coords.latitude, // 위도
                lon = position.coords.longitude; // 경도

            // 현재 위치로 지도 중심 이동
            var center = new kakao.maps.LatLng(lat, lon);
            map.setCenter(center);

            // 마커 생성 및 표시
            var marker = new kakao.maps.Marker({
                map: map,
                position: center
            });

            // 마커에 인포윈도우 표시
            var infowindow = new kakao.maps.InfoWindow({
                content: '현재 위치'
            });
            infowindow.open(map, marker);
        } catch (error) {
            console.error('Error in getCurrentPosition:', error);
        }
    }, function (error) {
        console.error('Error in getCurrentPosition:', error);
    });
}





									
		    
	
		 

	</script>
</body>

</html>