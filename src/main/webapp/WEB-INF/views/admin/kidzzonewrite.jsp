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
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>    

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
						style="margin-top: 13%; text-align: center;">Yes 키즈존 등록</h1>
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
                    <h1 class="mb-3">Yes 키즈존 등록</h1>
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
                        <div class="wow fadeInUp" data-wow-delay="0.5s">
                            <form action="/KzWrite" method="POST" enctype="multipart/form-data">
                            
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <div class="form-floating" style="margin:auto;">
                                            <input type="text" class="form-control" id="name" placeholder="" name="kz_name">
                                            <label for="name">매장 이름</label>
                                        </div>
                                        <br>
                                    </div>
                                     <div class="col-md-6">
                                        <div class="form-floating">
                                        <select class="form-select border-1 py-3" name="kz_category" id="category">
			     							<option value="no">카테고리</option>
			     							<option value="음식점">음식점</option>
			     							<option value="키즈카페" >키즈카페</option>
			     							<option value="체험활동" >체험활동</option>
			     							<option value="카페 문의" >카페</option>			     
			     						</select>
			     						</div>
			     						</div>
                                    

                                    <div class="col-md-12">
                                        <div class="form-floating" style="margin:auto;">
                                            <input type="text" class="form-control" id="name" placeholder="" name="kz_openingtime">
                                            <label for="name">영업 시간</label>
                                        </div>
                                        <br>
                                    </div>
                                                                                                       
                                    <div class="col-md-6">
                                        <div class="form-floating" style="margin:auto;">
                                            <input type="text" class="form-control" id="kz_postcode"  placeholder="우편번호" name="kz_postcode">	
                                            <label for="name">우편번호</label>
                                        </div>
                                        <br>
                                    </div>
                                    
                                    <div class="col-6">
                                            <input type="button" onclick="kz_execDaumPostcode()" value="우편번호 찾기" class="btn btn-primary w-100 py-3"><br>
                                           </div>     
                                    
                                    <div class="col-md-12">
                                        <div class="form-floating" style="margin:auto;">
                                            <input type="text" class="form-control" id="kz_address"  placeholder="우편번호" name="kz_address"><br>
                                            <label for="name">매장 주소</label>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-12">
                                        <div class="form-floating" style="margin:auto;">
                                            <input type="text" class="form-control" id="kz_detailaddress"  placeholder="우편번호" name="kz_detailaddress"><br>
                                            <label for="name">상세 주소</label>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-12">
                                        <div class="form-floating" style="margin:auto;">
                                            <input type="text" class="form-control" id="kz_extraaddress"  placeholder="우편번호" name="kz_extraaddress"><br>                                          
                                            <label for="name">참고 항목</label>
                                        </div>
                                    </div>
                                    
			     					
			     					<div class="col-md-12">
                                        <div class="form-floating" style="margin:auto;">
                                            <input type="file" class="form-control" id="name" placeholder="" name="kz_img" accept="image/*" onchange="readURL(this)">
                                            <label for="name">매장사진</label>
                                            <br>
			     					</div>
			     					</div>
			     					
                                    <div class="col-12">
                                        <div class="form-floating">
                                            <textarea class="form-control" placeholder="Leave a message here" id="message" style="height: 150px" name="kz_explanation"></textarea>
                                            <label for="message">매장설명</label>
                                        </div>
                                        <br>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-floating" style="margin:auto;">
                                            <img id="preview" style="max-width: 100%; max-height: 50%;">
                                        </div>
                                        <br>
                                    </div>
                                    <div class="col-12">
                                         <input type="submit" value="등록" onclick="confirmSubmit();" class="btn btn-primary w-100 py-3" >
                                    </div>
                                    </div>
                                    </form>
                                </div>
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
	
	
			
		
  	    <%@include file="/WEB-INF/views/include/footer.jsp"%>
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
	
	
	
	 function kz_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("kz_extraaddress").value = extraAddr;

							} else {
								document.getElementById("kz_extraaddress").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('kz_postcode').value = data.zonecode;
							document.getElementById("kz_address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("kz_detailaddress").focus();
						}
					}).open();
		}
	
	
	
	
	</script>
</body>

</html>