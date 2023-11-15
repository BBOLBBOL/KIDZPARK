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
						style="margin-top: 13%; text-align: center;">${m_name}게시판</h1>
				</div>
			</div>
		</div>
		<!-- Header End -->



		<!-- Search Start -->
		<div class="container-fluid bg-primary mb-5 wow fadeIn"
			data-wow-delay="0.1s" style="padding: 35px;">
			<div class="container">
				<div class="row g-2">
					<div class="col-md-10">
						<div class="row g-2">
							<div class="col-md-4"></div>
							<div class="col-md-3">
								<select class="form-select border-0 py-3" >
									<option selected>검색</option>
									<option value="1">제목</option>
									<option value="2">내용</option>
									<option value="3">글쓴이</option>
								</select>
							</div>
							<div class="col-md-3">
								<input type="text" class="form-control border-0 py-3"
									placeholder="Search Keyword">
							</div>
							<div class="col-md-2">
								<button class="btn btn-dark border-0 w-100 py-3">Search</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Search End -->



		<div class="container-xxl py-5">
			<a href="/boardlist?m_no=1" class="btn btn-info">자유</a> <a
				href="/boardlist?m_no=2" class="btn btn-info">건강</a> <a
				href="/boardlist?m_no=3" class="btn btn-info">요리</a> <a
				href="/boardlist?m_no=4" class="btn btn-info">육아</a> <a
				href="/boardlist?m_no=5" class="btn btn-info">교육</a>
			<hr>
			<table class="table table-hover">
				<thead class="thead-white">
					<tr>
						<th scope="col">제목</th>
						<th scope="col">글쓴이</th>
						<th scope="col">작성일</th>
						<th scope="col">조회</th>
						<th scope="col">추천수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="board" items="${getboardlist}">
						<tr>
							<td>${board.b_title}</td>
							<td>${board.u_no}</td>
							<td>${board.b_writedate}</td>
							<td>${board.b_readcount}</td>
							<td>${board.b_like}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<%@include file="/WEB-INF/views/include//paging.jsp"%>
		</div>

		<!-- Back to Top -->
		<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
			class="bi bi-arrow-up"></i></a>
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
</body>

</html>