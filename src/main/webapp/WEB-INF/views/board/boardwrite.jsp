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
		<form action="/BoardSearchList" method="post">
			<div class="container-fluid bg-primary mb-5 wow fadeIn"
				data-wow-delay="0.1s" style="padding: 35px;">
				<div class="container">
					<input type="hidden" name="m_no" value="${m_no}">
					<div class="row g-2">
						<div class="col-md-10">
							<div class="row g-2">
								<div class="col-md-4"></div>
								<div class="col-md-3">
									<select class="form-select border-0 py-3" name="searchOption">
										<option value="all" selected>검색</option>
										<option value="b_title">제목</option>
										<option value="b_cont">내용</option>
										<option value="u_name">글쓴이</option>
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
			<h1 class="mb-3">${m_name}게시판글쓰기</h1>
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
												<form action="/BoardWrite" method="post" enctype="multipart/form-data">
													<c:if test="${ma ne null }">
													<input type="hidden" name="ma" value="${ma}"> 
													</c:if>
													<input type="hidden" name="u_no" value="${loginVo.u_no}"> 
													<input type="hidden" name="m_no" value="${m_no}">
													<div class="row g-2">
														<div class="col-md-12">
															<div class="form-floating" style="margin: auto;">
																<input type="text" class="form-control" id="b_title" name="b_title" placeholder=""> <label for="b_title">제목을 입력하세요</label>                                                        
															</div>
															<br>
														</div>
														<div class="col-md-12">
															<div class="form-floating" style="margin: auto;">
																<input type="file" class="form-control" id="b_img"
																	name="b_img" placeholder="사진" accept="image/*" onchange="readURL(this)"> <label for="b_img">사진 추가</label>
															</div>
															<br>
														</div>
														<div class="col-12">
															<div class="form-floating">
																<textarea class="form-control"
																	placeholder="Leave a message here" id="b_cont" name="b_cont" style="height: 400px"></textarea>
																<label for="b_cont">내용을 입력하세요</label>
															</div>
															<br>
														</div>
														<div class="col-md-12">
															<div class="form-floating" style="margin: auto;">
														 <img id="preview" style="max-width:100%;">
															</div>
															<br>
														</div>
														<div class="col-4" style="margin-left: 30px; margin-right: 30px;">
														  <a class="btn btn-primary w-100 py-3" onclick="goBack()">이전으로</a>
														</div>
														<div class="col-4" style="margin-left: 30px; margin-right: 30px;">
															<button class="btn btn-primary w-100 py-3" type="submit">등록</button>
														</div>
													</div>
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
	<script>
	
	function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					document.getElementById('preview').src = e.target.result;
				};
				reader.readAsDataURL(input.files[0]);
			} else {
				document.getElementById('preview').src = "";
			}
		}
	
    function goBack() {
        window.history.back();
    }
	</script>
</body>

</html>