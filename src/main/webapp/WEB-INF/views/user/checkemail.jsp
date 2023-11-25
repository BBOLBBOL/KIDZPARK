<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="utf-8">

<head>
    <meta charset="utf-8">
    <title>이메일 인증</title>
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
#findBtn, #confirmBtn1 {
    width: 128px; /* 적절한 값을 조정하세요 */
    margin-left: 10px;
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
                   <h1 class="display-4 animated fadeIn mb-4" style="margin-top : 13%; text-align: center;">이메일 인증</h1>
            </div>
        </div>      
        <hr>
        <hr>
                </div>   

        <!-- Header End -->     
       <div class="wrap">
       		<form action="/UserUpdateForm" method="post">
			    <div>
	    		  <input type="text" name="u_id" id="u_id" value="${loginVo.u_id}" style="display: none;">
			      <label>등록하신 이메일을 입력해주세요</label><br>
			      <input  type="text"   name="u_email" id="u_email" autocomplete="on" >
			      <button type="button" name="findBtn" id="findBtn" onclick="Check()" class="btn btn-primary">인증번호 받기</button><br>
			      <input  type="text"   name="number"  id="number" placeholder="인증번호 입력">
				  <button type="submit" name="confirmBtn1" id="confirmBtn1" onclick="confirmNumber1()" class="btn btn-primary">이메일 인증</button>
			    </div>
			    <br><input type="text" id="Confirm" name="Confirm"  style="display: none;"  value="">
		    </form>
       </div>
		<div id="div1">
			<a type="button" class="btn btn-secondary" onclick="location.href='/';">메인 화면</a>
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
    var u_email, u_id;
	
    function Check() {
        u_email = $('#u_email').val();
        u_id = $('#u_id').val();
        $.ajax({
            url: '/Check',
            type: 'get',
            data: { u_id: u_id, u_email: u_email },
            success: function (result) {
                if (result == 1) {
                    // SendNum1 함수 호출 전에 Confirm 값을 초기화
                    $("#Confirm").val("");
                    SendNum1();
                } else {
                    alert("아이디의 이메일과 일치하지 않습니다.");
                }
            },
            error: function () {
                alert("오류");
            }
        });
    }
    
    
    function SendNum1() {
        u_email = $('#u_email').val();
        u_id = $('#u_id').val();
        $.ajax({
            url: '/CheckEmail',
            type: 'get',
            data: { u_id: u_id, u_email: u_email },
            success: function (data) {
                alert("이메일이 전송되었습니다.");
                $("#Confirm").val(data);  // Confirm 값을 설정하는 부분 수정
            },
            error: function () {
                alert("이메일을 다시 입력해주세요");
            }
        });
    }
    
    function confirmNumber1(){
        var number1 = $("#number").val();
        var number2 = $("#Confirm").val();

        if (!number1) {
            alert("인증번호를 입력하세요.");
            event.preventDefault();
        } else if (number1 == number2) {
            alert("인증되었습니다.");
        } else {
            alert("번호가 다릅니다.");
            event.preventDefault();
        }
    }
    
    
    </script>
</body>

</html>