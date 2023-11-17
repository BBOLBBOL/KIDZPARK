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
						style="margin-top: 13%; text-align: center;">고객센터</h1>
				</div>
			</div>
		</div>
		<hr>
		<!-- Header End -->
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
		
		
		
		  <!-- Contact Start -->
                <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                    <h1 class="mb-3">고객 문의</h1>
                </div>
            <div class="row g-4">
                    <div class="col-12">
                        <div class="row gy-8">
                        <div class="col-lg-2">
                        </div>
           <div class="bg-light rounded p-3 col-lg-8" >
                    <div class="bg-white rounded p-4" style="border: 1px dashed rgba(0, 185, 142, .3)">
        <div class="container-xxl py-5">
            <div class="container">
                <div class="row g-4">
                <div class="col-md-1">
                </div>
                    <div class="col-md-10">
                      <c:forEach var="view" items="${view }">
                        <div class="wow fadeInUp" data-wow-delay="0.5s">
                            <form action="/UserCsWrite" method="POST" enctype="multipart/form-data">
                            <input type="hidden" name="u_no" value="1">
                                <div class="row g-3">
                                    <div class="col-md-8">
                                        <div class="form-floating" style="margin:auto;">
                                            <input type="text" class="form-control" id="name" placeholder="" name="cs_title" value="${view.cs_title }" readonly>
                                            <label for="name">문의제목</label>
                                        </div>
                                        <br>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-floating">
                                          <input type="text" class="form-control" id="name" placeholder="" name="cs_title" value="${view.cs_category }" readonly>
                                          <label for="name">카테고리</label>
			     						</div>
			     						</div>
			     					<c:if test="${not empty view.cs_img }">
			     					<div class="col-md-12">
                                        <div class="form-floating" style="margin:auto;"> 
                                            <img id="preview" style="max-width: 100%; max-height: 50%;" src="/img/${view.cs_img }">
                                            <br>
			     					</div>
			     					<br>
			     					</div>
			     					</c:if>
			     					
			     					<c:if test="${empty view.cs_img }">
			     					<div class="col-md-12">
                                        <div class="form-floating" style="margin:auto;"> 
                                            <input type="text" class="form-control" id="name" placeholder="" name="cs_title" value="문의 사진이 없습니다!." readonly>
                                            <label for="name">문의사진</label>
                                            <br>
			     					</div>    				
			     					</div>
			     					</c:if>
			     					
                                    <div class="col-24">
                                        <div class="form-floating">
                                            <textarea class="form-control" placeholder="Leave a message here" id="message" style="height: 150px" name="cs_cont" readonly>${view.cs_cont }</textarea>
                                            <label for="message">문의내용</label>
                                        </div>
                                        <br>
                                    </div>                         
                                    </div>
                                    </form>
                                </div>
                                    </c:forEach>
                        </div>
                    </div>
                    <div class="col-md-1">
                </div>
                </div>
            </div>
        </div>
        </div>
        </div>
        <div class="col-lg-2">
                        </div>
        </div>
        </div>
        <br>
        
        <!-- 답변 완료 상태일 때 유저가 보이는 화면-->
         <div class="row g-4">
                    <div class="col-12">
                        <div class="row gy-8">
                        <div class="col-lg-2">
                        </div>
           <div class="bg-light rounded p-3 col-lg-8" >
                    <div class="bg-white rounded p-4" style="border: 1px dashed rgba(0, 185, 142, .3)">
          <hr>
          <h1 class="mb-3" style="text-align: center; margin-top : 30px;">답변내용</h1>
          <hr>
        <div class="container-xxl py-5">
            <div class="container">
                <div class="row g-4">
                <div class="col-md-1">
                </div>
                    <div class="col-md-10">
                     <c:forEach var="view" items="${view }">
                        <div class="wow fadeInUp" data-wow-delay="0.5s">
                            <form action="/CsAnswer" method="POST" id="answer" >
                            <input type="hidden" name="u_no" value="1">
                            <input type="hidden" name="cs_idx" value="${view.cs_idx }">
                                <div class="row g-3">
                                    <div class="col-md-8">
                                        <div class="form-floating" style="margin:auto;">
                                            <input type="text" class="form-control" id="name" placeholder="" value="${view.cs_title }" readonly>
                                            <label for="name">문의제목</label>
                                        </div>
                                        <br>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-floating">                                       			    
			     						  <input type="text" class="form-control" id="name" placeholder=""  value="${view.cs_category }" readonly>
                                          <label for="name">카테고리</label>
			     						</div>
			     						</div>
			     					 <c:if test="${not empty view.cs_answer }">				     						     							     						     					
                                    <div class="col-md-24">
                                        <div class="form-floating">                                       			    
			     						  <input type="text" class="form-control" id="name" placeholder=""  value="${view.cs_answerdate }" readonly>
                                          <label for="name">답변일자</label>
			     						</div>
			     						<br>
			     						</div>			     						     							     						     					
                                    <div class="col-24">
                                        <div class="form-floating">
                                            <textarea class="form-control" placeholder="Leave a message here" id="message" style="height: 150px" name="cs_answer" readonly>${view.cs_answer }</textarea>
                                            <label for="message">답변내용</label>
                                        </div>
                                        <br>
                                    </div>
                                    </c:if>
                                    
                                    <!-- 답변이 없을 때 유저가 보이는 화면 -->
			     					 <c:if test="${empty view.cs_answer and loginVo.u_no ne 99 }">				     						     							     						     					
                                    <div class="col-md-24">
                                        <div class="form-floating">                                       			    
			     						  <input type="text" class="form-control" id="name" placeholder="" readonly >
                                          <label for="name">답변일자</label>
			     						</div>
			     						<br>
			     						</div>			     						     							     						     					
                                    <div class="col-24">
                                        <div class="form-floating">
                                            <textarea class="form-control" placeholder="Leave a message here" id="message" style="height: 150px" name="cs_answer" readonly>답변 대기중입니다!!.</textarea>
                                            <label for="message">답변내용</label>
                                        </div>
                                        <br>
                                    </div>
                                    </c:if>
                                    
                                                                                                                                                                       			  
			     					 <c:if test="${loginVo.u_no eq 99 and empty view.cs_answer }">				     						     							     						     					
                                    <div class="col-md-24">
                                        <div class="form-floating">                                       			    
			     						  <input type="hidden" class="form-control" id="name" placeholder="" readonly >                                          
			     						</div>
			     						<br>
			     						</div>			     						     							     						     					
                                    <div class="col-24">
                                        <div class="form-floating">
                                            <textarea class="form-control" placeholder="Leave a message here" id="message" style="height: 150px" name="cs_answer"></textarea>
                                            <label for="message">답변내용</label>
                                        </div>
                                        <br>
                                        <div class="col-12">
                                         <input type="submit" value="등록" onclick="confirmSubmit();" class="btn btn-primary w-100 py-3" >
                                    </div>
                                    </div>
                                    </c:if>
                                                                                                                                                                       			  
                                    </div>
                                    </form>
                                </div>
                                </c:forEach>
                        </div>
                    </div>
                    <div class="col-md-1">
                </div>
                </div>
            </div>
        </div>
        </div>
        </div>
        <div class="col-lg-2">
                        </div>
        </div>
        </div>
        
         
        
        
        
        
        
        
        
        
        
        
        <!-- Contact End -->
	
	
			<div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5 wow fadeIn"
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
	
	
	function confirmSubmit() {
		var category = document.getElementById('category').value;
		if(confirm('등록하시겠습니까?')) {
			if( category != "no"){
			alert("등록되었습니다");
			}		else{
				alert("카테고리를 선택해주세요")
				event.preventDefault();
				}
		} else {
			alert("등록 실패!")
			event.preventDefault();
		}
		
	}	
	
	
	
	
	
	</script>
</body>

</html>