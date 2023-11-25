<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="utf-8">

<head>
<meta charset="utf-8">
<title>내가 쓴 글</title>
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
       .thead-white th {
        font-weight: bold;
        font-size: 20px;
        color : black;
        text-align: center;
        
    }
    .tbody-white a {
        font-size: 20px;
        color : black; 
       
    }
    .tbody-white td {
    text-align: center;
    }
    .table {
           max-width: 80%; 
           margin:auto;
           margin-top:5%;
           margin-bottom:3%;
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
						style="margin-top: 13%; text-align: center;">내가 쓴 ${m_name}게시판</h1>
				</div>
			</div>
		</div>
		<!-- Header End -->



		<!-- Search Start -->
			<form action="/SearchArticles" method="post">
		<div class="container-fluid bg-primary mb-5 wow fadeIn"
			data-wow-delay="0.1s" style="padding: 35px;">
			<div class="container">
			<input type="hidden" name="m_no" value="${m_no}">
			<input type="hidden" name="u_no" value="${loginVo.u_no}">
				<div class="row g-2">
					<div class="col-md-10">
						<div class="row g-2">
							<div class="col-md-4"></div>
							<div class="col-md-3">
								<select class="form-select border-0 py-3" name="searchOption">
									<option value="all" selected>검색</option>
									<option value="b_title">제목</option>
									<option value="b_cont">내용</option>
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


		<div class="container-xxl py-5">
			<hr>
			<div style="margin: 10px 10px auto; text-align: center; ">
				<a href="/MyArticles?m_no=1&u_no=${loginVo.u_no}" class="btn btn-info" style="margin-left : 10px; padding:15px 25px;">자유</a> <a
				href="/MyArticles?m_no=2&u_no=${loginVo.u_no}" class="btn btn-info" style="margin-left : 10px; padding:15px 25px;">건강</a> <a
				href="/MyArticles?m_no=3&u_no=${loginVo.u_no}" class="btn btn-info" style="margin-left : 10px; padding:15px 25px;">요리</a> <a
				href="/MyArticles?m_no=4&u_no=${loginVo.u_no}" class="btn btn-info" style="margin-left : 10px; padding:15px 25px;">육아</a> <a
				href="/MyArticles?m_no=5&u_no=${loginVo.u_no}" class="btn btn-info" style="margin-left : 10px; padding:15px 25px;">교육</a>
				</div>
			<table class="table table-hover">
				<thead class="thead-white">
					<tr>
						<th scope="col">추천수</th>
						<th scope="col">제목</th>
						<th scope="col">글쓴이</th>
						<th scope="col">작성일</th>
						<th scope="col">조회</th>
					</tr>
				</thead>
						<tbody class="tbody-white">
					<c:forEach var="article" items="${searcharticles}">
						<tr>
							<td><a href="/BoardView?b_idx=${article.b_idx}&u_no=${loginVo.u_no}&m_no=${m_no}">${article.b_like}</a></td>
							<td><a href="/BoardView?b_idx=${article.b_idx}&u_no=${loginVo.u_no}&m_no=${m_no}">${article.b_title}</a></td>
							<td><a href="/BoardView?b_idx=${article.b_idx}&u_no=${loginVo.u_no}&m_no=${m_no}">${article.u_nickname}</a></td>
							<td><a href="/BoardView?b_idx=${article.b_idx}&u_no=${loginVo.u_no}&m_no=${m_no}">${article.b_writedate}</a></td> 
							<td><a href="/BoardView?b_idx=${article.b_idx}&u_no=${loginVo.u_no}&m_no=${m_no}">${article.b_readcount}</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
				<div style="margin: 10px 10px auto; text-align: right; ">
				<a href="/BoardWriteForm?m_no=${m_no}" class="btn btn-primary" style="margin-right : 30px;">글쓰기</a>
				</div>
			<%@include file="/WEB-INF/views/include/pagingsearcharticles.jsp"%>
		</div>
	
		<!-- Footer Start -->
		<%@include file="/WEB-INF/views/include/footer.jsp"%>
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
</body>

</html>