<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="utf-8">

<head>
    <meta charset="utf-8">
    <title>아이디 찾기</title>
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

.wrap {
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  background: #fffff;
  margin: 100px auto;
}
label {
    display: block;
    margin-bottom: 10px;
}
input[type="text"] {
    padding: 8px;
    margin-bottom: 15px;
    box-sizing: border-box;
}
#div1 {
    display: flex;
    justify-content: center;
    margin-bottom: 150px;
}
#a1{
	margin-right: 10px;
}
</style>   
</head>

<body>

    <div class="container-xxl bg-white p-0" >
    <div class="container-fluid nav-bar bg-transparent">
      <%@include file="/WEB-INF/views/include/nav.jsp"%>
    </div>
        <!-- Header Start -->
                 <div class="container-fluid header bg-white p-0">
            <div class="row g-0 align-items-center flex-column-reverse flex-md-row">
                <div class="p-5 mt-lg-5">
                   <h1 class="display-4 animated fadeIn mb-4" style="margin-top : 13%; text-align: center;">아이디 찾기</h1>
            </div>
        </div>      
        <hr>
        <hr>
                </div>   

        <!-- Header End -->  
        
           
       <div class="wrap">
		    <div>
		      <label>가입하신 이메일을 입력해주세요</label><br>
		      <input type="text" id="u_email" name="u_email"  autocomplete="on" >
		      <button type="button" name="findBtn" id="findBtn" onclick="SendId()" class="btn btn-primary">찾기</button>
		    </div>
       </div>
		<div id="div1">
			<a id="a1" type="button" class="btn btn-secondary" onclick="location.href='/';">메인 화면</a>
			<a type="button" class="btn btn-primary"   onclick="location.href='/FindPwForm';">비밀번호 찾기</a>
		</div>


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
    <script>

    function SendId() {
        var u_email = $('#u_email').val();
        $.ajax({
            url  : '/SendId',
            type : 'post',
            data : { u_email : u_email },
            success : function() {
                alert("이메일이 전송되었습니다.");
                
            },
            error : function() {
                alert("이메일을 다시 입력해주세요");
            }
        });
    }
    </script>
    
</body>

</html>