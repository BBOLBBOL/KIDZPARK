<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
#form {
	width: 500px;
}
input[type="password"]{
	width: 200px;
	padding: 8px;
    margin-bottom: 15px;
    box-sizing: border-box;
}
#h3 {
    display: flex;
    justify-content: center;
    margin-bottom: 50px;
}
#div1 {
    display: flex;
    justify-content: center;
    margin-bottom: 100px;
    margin-top: 50px;
}
#td1, #td3 {
	width: 200px;
}
</style>   
</head>

<body>


        <!-- Header End -->     
       <div class="wrap">
			
       		<form id="form" action="/UpdatePw" method="post" onsubmit="submitForm(event)">
       		<input type="hidden" name="u_id" id="u_id" value="${loginVo.u_id}" >
       			<table>
       			<h3 id="h3">새로운 비밀번호로 재설정해주세요</h3>
       			<colgroup>
					<col width="25%">
					<col width="*">
				</colgroup>
				    <tr id="tr1">
						<td id="td1"><h6>새 비밀번호</h6></td>
						<td><input type="password" name="u_pw" id="user_pw1" >
							<span id=pwdcheck_1></span>
						</td>
					</tr>
					<tr style="height: 20px;"></tr>
					<tr id="tr2">
						<td id="td2"><h6>새 비밀번호 확인</h6></td>
						<td><input type="password" id="user_pw2" > 
							<span id="pwdcheck_2"></span></td>
					</tr>
					<tr>
					<td colspan="2">
						<div id="div1">
							<button id="submit" type="submit" class="btn btn-primary">변경하기</button>
						</div>
					</td>
				</tr>
			    </table>
		    </form>
       </div>

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
    
 $("#user_pw1")
.blur(
		function() {
			let pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;

			if ($("#user_pw1").val() == "") {
				$("#pwdcheck_1").text("비밀번호를 입력하세요.");
				user_pwd1 = false;
			} else if (!pwdCheck.test($("#user_pw1").val())) {
				$("#pwdcheck_1").text(
						"문자,숫자,특수문자를 포함한 8글자 이상 사용하여주세요");
				user_pwd1 = false;
			} else {
				$("#pwdcheck_1").text("안전한 비밀번호 입니다")
				user_pwd1 = true;
			}
}); // pw1 blur end

$("#user_pw2").blur(
	function() {
		if ($("#user_pw2").val() == "") {
			$("#pwdcheck_2").css("color", "red");
			$("#pwdcheck_2").text("필수정보입니다");
			user_pw2 = false;
		} else if (user_pwd1 == true
				&& $("#user_pw1").val() == $("#user_pw2").val()) {
			$("#pwdcheck_2").css("color", "blue");
			$("#pwdcheck_2").text("비밀번호 일치");
			user_pw2 = true;
		} else {
			$("#pwdcheck_2").text("다시 확인해주세요");
			$("#pwdcheck_2").css("color", "red");
			$("#user_pw2").val("");
			user_pw2 = false;
		}
	}); // pw2 blur end   
</script>
<script>
function submitForm(event){
	event.preventDefault();
    let u_pw = $('#user_pw1').val();
    let u_id = $('#u_id').val();

    $.ajax({
        url  : '/UpdatePw',
        type : 'POST',
        data: {u_id : u_id, u_pw : u_pw},
        success: function (response) {
            alert('비밀번호 수정이 완료되었습니다.');
            
            // 아래 두 줄이 팝업 창이 닫힐 때 실행되는 코드입니다.
            window.opener.$('#user_pw1').val(response.u_pw); // 부모 창의 필요한 요소에 접근하여 값을 변경
            window.opener.location.reload(); // 부모 창 새로고침

            window.close();
        },
        error: function (xhr, status, error) {
            alert('비밀번호 변경에 실패했습니다. 다시 시도해주세요.');
            console.error(xhr, status, error);
        }
    });
}

</script>
</body>

</html>