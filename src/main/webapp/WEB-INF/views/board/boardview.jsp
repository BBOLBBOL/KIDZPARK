<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="utf-8">

<head>
<meta charset="utf-8">
<title>메인화면</title>
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
						style="margin-top: 13%; text-align: center;">${map.m_name}게시판</h1>
				</div>
			</div>
		</div>
		<!-- Header End -->



		<!-- Search Start -->
		<form action="/BoardSearchList" method="post">
			<div class="container-fluid bg-primary mb-5 wow fadeIn"
				data-wow-delay="0.1s" style="padding: 35px;">
				<div class="container">
					<input type="hidden" name="m_no" value="${map.m_no}">
					<div class="row g-2">
						<div class="col-md-10">
							<div class="row g-2">
								<div class="col-md-4"></div>
								<div class="col-md-3">
									<select class="form-select border-0 py-3" name="searchOption">
										<option value="all" selected>검색</option>
										<option value="b_title">제목</option>
										<option value="b_cont">내용</option>
										<option value="u_no">글쓴이</option>
									</select>
								</div>
								<div class="col-md-3">
									<input type="text" class="form-control border-0 py-3"
										name="searchKeyword" placeholder="Search Keyword">
								</div>
								<div class="col-md-2">
									<button type="submit" class="btn btn-dark border-0 w-100 py-3">Search</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
		<!-- Search End -->
		<!-- Contact Start -->
		<br>
		<div class="text-center mx-auto mb-5 wow fadeInUp"
			data-wow-delay="0.1s" style="max-width: 600px;">
			<h1 class="mb-3">${map.m_name}게시판글쓰기</h1>
			<br>
		</div>
		<div class="row g-4">
			<div class="col-12">
				<div class="row gy-8">
					<div class="col-lg-2"></div>
					<div class="bg-light rounded p-3 col-lg-8">
						<div class="bg-white rounded p-4"
							style="border: 1px dashed rgba(0, 185, 142, .3)">
							<div class="container-xxl py-5">
								<div class="container">
									<div class="row g-4">
										<div class="col-md-1"></div>
										<div class="col-md-10">
											<div class="wow fadeInUp" data-wow-delay="0.5s">
												<form action="/BoardUpdate" method="post" enctype="multipart/form-data">
													<input type="hidden" name="u_no" value="1"> 
													<input type="hidden" name="m_no" value="${map.m_no}">
													<c:forEach var="board" items="${boardView}">
													<div class="row g-2">
														<div class="col-md-12">
															<div class="form-floating" style="margin: auto;">
																<input type="text" class="form-control" id="b_title" name="b_title" value="${board.B_TITLE}" readonly="readonly">                                                      
															</div>
															<br>
														</div>
														<div class="col-md-5">
															<div class="form-floating" style="margin: auto;">
															<input type="text" class="form-control" id="u_no" name="u_no" value="${board.U_NO}" readonly="readonly">                             
															</div>
															<br>
														</div>
														<div class="col-12">
															<div class="form-floating">
																<textarea class="form-control"
																	id="b_cont" name="b_cont" style="height: 400px" readonly="readonly">${board.B_CONT}</textarea>
															</div>
															<br>
														</div>
														<div class="col-md-12">
															<div class="form-floating" style="margin: auto;">
														 <img src="/img/${board.B_IMG}" style="max-width:100%;">
															</div>
															<br>
														</div>
														<div class="col-4" style="margin-left: 30px; margin-right: 30px;">
														  <a class="btn btn-primary w-100 py-3" onclick="goBack()">이전으로</a>
														</div>
														<div class="col-4" style="margin-left: 30px; margin-right: 30px;">
															<button class="btn btn-primary w-100 py-3" type="submit">수정</button>
														</div>
													</div>
													</c:forEach>
												</form>
											</div>
										</div>
										<div class="col-md-1"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-2"></div>
				</div>
			</div>
		</div>

		<!-- Contact End -->





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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="lib/wow/wow.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/waypoints/waypoints.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>
	<script>
	
    function goBack() {
        window.history.back();
    }
	</script>
</body>

</html>