<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="utf-8">

<head>
    <meta charset="utf-8">
    <title>로그인</title>
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
  margin-bottom: 200px;
}

.login {
  width: 25vw;
  height: 50vh;
  background: #fffff;
  border-radius: 20px;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}

.login_id {
  margin-top: 20px;
}

.login_id input {
  width: 100%;
  height: 50px;
  border-radius: 30px;
  margin-top: 10px;
  padding: 0px 20px;
  border: 1px solid lightgray;
  outline: none;
}

.login_pw {
  margin-top: 2vh;
}

.login_pw input {
  width: 100%;
  height: 50px;
  border-radius: 30px;
  margin-top: 10px;
  padding: 0px 20px;
  border: 1px solid lightgray;
  outline: none;
}

.submit {
  margin-top: 50px;
  width:auto;
}
.submit input {
  width: 100%;
  height: 50px;
  border: 0;
  outline: none;
  border-radius: 40px;

  color: white;
  font-size: 1.2em;
  letter-spacing: 2px;
}
label {
  text-align: left;
  font-size: bold;
}

/* 미디어 쿼리 */

@media (max-width: 768px) {
  /* 768px보다 작은 화면 크기에 대한 스타일 설정 */
  .login {
    width: 80vw;
    height: 40vh;
  }
  .login_id input,
  .login_pw input,
  .submit input {
    width: 80%;
    height: 35px;
    margin-top: 5px;
    font-size: 0.8em;
    justify-content: center;
    align-items: center;
  }
  label {
    font-size: 0.8em; /* 변경된 부분: 글자 크기 조절 */
  }
}

@media (max-width: 480px) {
  /* 480px보다 작은 화면 크기에 대한 스타일 설정 */
  .login {
    width: 90vw;
    height: 50vh;
  }
  .login_id input,
  .login_pw input,
  .submit input {
    width: 85%;
    height: 30px;
    margin-top: 5px;
    font-size: 0.7em; /* 변경된 부분: 글자 크기 조절 */
    justify-content: center;
    align-items: center;
  }
  label {
    font-size: 0.7em; /* 변경된 부분: 글자 크기 조절 */
  }
}
.join a:not(:last-child)::after {
  content: '|';
  margin: 0 5px;
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
                   <h1 class="display-4 animated fadeIn mb-4" style="margin-top : 13%; text-align: center;">로그인</h1>
            </div>
        </div>      
        <hr>
        <hr>
                </div>   

        <!-- Header End -->     
       <div class="wrap">
        <div class="login">
          <form action="/Login">
        	<div class="login_id">
		      <label for="u_id" id="label1">사용자 아이디</label>
		      <input type="text" id="u_id" name="u_id" placeholder="ID" autocomplete="on" value="sky" required>
		    </div>
		    <div class="login_pw">
		      <label for="password">비밀번호</label>
		      <input type="password" id="u_pw" name="u_pw" placeholder="Password" autocomplete="off" value="qwer1234!" required>
		    </div>
		    <div class="submit">
 		      <input type="submit" value="로그인" class="btn btn-primary py-3 px-5 me-3 animated fadeIn">
 		    </div>    
 		    <br>
 		    <br>
          </form> 
        	<div class="join">
           	  <a href="/FindIdForm">아이디 찾기</a>
           	  <a id="1" href="/FindPwForm">비밀번호 찾기</a>
           	  <a id="2" href="/JoinForm">회원가입</a>
      	    </div>     
        </div>
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
    
    
</body>

</html>