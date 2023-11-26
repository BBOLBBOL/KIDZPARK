<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    
    .row1 {
    display: flex;
    flex-wrap: wrap;
     margin: 10px 10px auto;
}

.row1>* {
    width: 100%;
    max-width: 230px;
    padding-right: calc(var(--bs-gutter-x) / 2);
    padding-left: calc(var(--bs-gutter-x) / 2);
    margin: 10px 10px auto;
   
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
            <div class="row g-0 align-items-center flex-column-reverse flex-md-row">
                <div class="col-md-6 p-5 mt-lg-5">
                    <h1 class="display-5 animated fadeIn mb-4">Hello KidzPark <br>
                     예스키즈존 확인하기</h1>
                    <a href="/Kidzzone" class="btn btn-primary py-3 px-5 me-3 animated fadeIn">Go Link</a>
                </div>
                <div class="col-md-6 animated fadeIn">
                    <div class="owl-carousel header-carousel">
                        <div class="owl-carousel-item">
                            <img class="img-fluid" src="img/carousel-1.jpg" alt="">
                        </div>
                        <div class="owl-carousel-item">
                            <img class="img-fluid" src="img/carousel-2.jpg" alt=""> <!-- 조회수 높은 순 매장사진   -->
                        </div>
                    </div>
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


        <!-- Category Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                    <h1 class="mb-3">게시판 이동</h1>
                </div>
                <div class="row1 g-4">
                    <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">
                        <a class="cat-item d-block bg-light text-center rounded p-3" href="/BoardList?m_no=1">
                            <div class="rounded p-4 contain">
                                <div class="icon mb-3 ">
                                    <img class="img-fluid1" src="img/baby1.jpg" alt="Icon" width="45" height="50">
                                </div>
                                <h6>자유게시판</h6>
                                
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
                        <a class="cat-item d-block bg-light text-center rounded p-3" href="/BoardList?m_no=2">
                            <div class="rounded p-4 contain">
                                <div class="icon mb-3">
                                    <img class="img-fluid1" src="img/baby2.jpg" alt="Icon" width="45" height="50">
                                </div>
                                <h6>건강</h6>
                          
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
                        <a class="cat-item d-block bg-light text-center rounded p-3" href="/BoardList?m_no=3">
                            <div class="rounded p-4 contain">
                                <div class="icon mb-3">
                                    <img class="img-fluid1" src="img/baby3.jpg" alt="Icon" width="45" height="50">
                                </div>
                                <h6>요리</h6>
                                
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                        <a class="cat-item d-block bg-light text-center rounded p-3" href="/BoardList?m_no=4">
                            <div class="rounded p-4 contain">
                                <div class="icon mb-3">
                                    <img class="img-fluid1" src="img/baby4.jpg" alt="Icon" width="45" height="50">
                                </div>
                                <h6>육아</h6>
                                
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">
                        <a class="cat-item d-block bg-light text-center rounded p-3" href="/BoardList?m_no=5">
                            <div class="rounded p-4 contain">
                                <div class="icon mb-3">
                                    <img class="img-fluid1" src="img/baby5.jpg" alt="Icon" width="45" height="50">
                                </div>
                                <h6>교육</h6>
                                
                            </div>
                        </a>
                    </div>                     
                </div>
            </div>
        </div>
        <!-- Category End -->
   

        <!-- Footer Start -->
        <%@include file="/WEB-INF/views/include/footer.jsp"%>
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