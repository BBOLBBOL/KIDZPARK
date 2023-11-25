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
						style="margin-top: 13%; text-align: center;">고객센터</h1>
				</div>
			</div>
		</div>
		<hr>
		<!-- Header End -->
		 <div class="container-xxl py-5">
		 <table class="table table-hover">
		   <thead class="thead-white">
		    <tr>
		     <th scope="col">문의번호</th>
		       <th scope="col">카테고리</th>
		       <th scope="col">문의제목</th>
		       <th scope="col">문의날짜</th>
		       <th scope="col">답변날짜</th>
		    </tr>
		    </thead>
		    <tbody class="tbody-white">
		    <c:forEach var="cs" items="${csList }">
		    <tr>
		      <td><a href="/UserCsView?cs_idx=${cs.cs_idx }&u_no=${loginVo.u_no}" >${cs.cs_idx }</a>
		      <td><a href="/UserCsView?cs_idx=${cs.cs_idx }&u_no=${loginVo.u_no}" >${cs.cs_category}</a>
		      <td><a href="/UserCsView?cs_idx=${cs.cs_idx }&u_no=${loginVo.u_no}" >${cs.cs_title }</a>
		      <td><a href="/UserCsView?cs_idx=${cs.cs_idx }&u_no=${loginVo.u_no}" >${cs.cs_writerdate }</a>
		      <td><a href="/UserCsView?cs_idx=${cs.cs_idx }&u_no=${loginVo.u_no}" >${cs.cs_answerdate}</a>
		    </tr>
		    </c:forEach>
		    </tbody>
		  </table>
		  	<div style="margin: 10px 10px auto; text-align: right; ">
            <a href="/UserCsWriteForm?u_no=1" class="btn btn-primary" style="margin-right : 30px;">문의하기</a>
            </div>
			<%@include file="/WEB-INF/views/include/cspaging.jsp"%>
		</div>
	
	

		
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
</body>

</html>