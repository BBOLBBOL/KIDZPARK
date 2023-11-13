<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="utf-8">

<head>
<meta charset="utf-8">
<title>회원가입</title>
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
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>    
<style>
.container-xxl py-5{
	margin: auto;
	width: 80%;
	padding: 20px;
}
form {
	padding: 20px;
	background-color: #fff;
	border: 1px solid #ddd;
	border-radius: 5px;
	width: 60%;
	margin: auto;
}
form table {
    width: 100%; /* 테이블의 폭을 80%로 설정 */
    margin: 0 auto; /* 가운데 정렬을 위해 auto 마진 설정 */
}
tr:nth-child(even) {
	background-color: #f2f2f2;
}

td {
	padding: 5px;
}

/* Style for required fields (add an asterisk) */
.redFont {
	color: #7A001E; /* Red color */
}

/* Style for buttons */
.btn {
	padding: 10px 20px;
	color: #fff;
	border: none;
	border-radius: .25rem;
	cursor: pointer;
	margin-top: 5px;
}

/* Style for the "뒤로가기" button */
.btn, .btn-secondary {
	margin: 12px !important;
}

/* Style for text inputs and textareas */
input[type="text"], input[type="password"] {
	padding: 6px;
	margin: 5px 0;
	border: 1px solid #7A001E; /* Red border */
	border-radius: 5px;
}

/* Style for the image preview */
#preview {
	max-width: 300px;
	margin-top: 10px;
}
@media (max-width: 768px) {
  /* 768px보다 작은 화면 크기에 대한 스타일 설정 */
  .container-xxl, .form, .button, .tr, .td, .span, .input {
    width: auto;
    height: auto;
  }
  
  .form, button, tr, td {
    width: 80%;
    height: 35px;
    margin-top: 5px;
    font-size: 0.8em;
    justify-content: center;
    align-items: center;
  }
  
  span {
    font-size: 0.8em;
  }
}

@media (max-width: 480px) {
  /* 480px보다 작은 화면 크기에 대한 스타일 설정 */
  .container-xxl, .form, .button, .tr, .td, .span, .input {
    width: auto;
    height: auto;
  }
  
  .form, button, tr, td {
    width: 85%;
    height: 30px;
    margin-top: 5px;
    font-size: 0.7em;
    justify-content: center;
    align-items: center;
  }
  
  span {
    font-size: 0.7em;
  }
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
                 <h1 class="display-4 animated fadeIn mb-4" style="margin-top : 13%; text-align: center;">회원가입</h1>
               </div>
            </div>  
	        <hr>
	        <hr>
          </div>  
    <!-- Header End -->            
                
                
          <div class="container-xxl py-5">
            <form action="/Join" method="POST" enctype="multipart/form-data" onsubmit="validateForm()">
             <table class="tb1">
				<colgroup>
					<col width="25%">
					<col width="*">
				</colgroup>
				<tr>
					<td colspan="2"	style="background-color: #cee3f6; font-weight: bold;">
					<span class="redFont">(*필수입력)</span> 회원기본정보</td>
				</tr>
				<tr>
					<td><span class="redFont">*</span>아이디:</td>
					<td><input type="text" name="u_id" id="u_id" style="width: 200px" value="sky" required>
						<button type="button" onclick="checkId()" class="btn btn-dark">중복체크</button>
					</td>
				</tr>
				<tr>
					<td><span class="redFont">*</span>비밀번호:</td>
					<td><input type="password" name="u_pw" id="user_pw1" style="width: 200px" value="qwer1234!" required>
						<span id=pwdcheck_1></span>
					</td>
				</tr>
				<tr>
					<td><span class="redFont">*</span>비밀번호 확인:</td>
					<td><input type="password" id="user_pw2" style="width: 200px" value="qwer1234!" required> 
						<span id="pwdcheck_2"></span></td>
				</tr>
				<tr>
					<td><span class="redFont">*</span>이름:</td>
					<td><input type="text" name="u_name" id="u_name" style="width: 200px" value="하늘" required></td>
				</tr>
				<tr>
					<td><span class="redFont">*</span>이메일:</td>
					<td><input type="text" name="u_email" id="u_email" onBlur="email()" style="width: 200px" value="sky@nate.com" required>
						<span id="email_m"></span>
					</td>
				</tr>
				<tr>
					<td><span class="redFont">*</span>닉네임:</td>
					<td><input type="text" name="u_nickname" id="u_nickname" onBlur="nickname()" style="width: 200px" value="하늘하늘" required>
						<span id="nick_m"></span></td>
				</tr>
				<tr>
					<td><span class="redFont">*</span>주소:</td>
					<td>
						<div>
							<input type="text" id="u_postcode"      name="u_postcode"      placeholder="우편번호" value="38054" style="width: 200px" required>
						    <input type="button" onclick="u_execDaumPostcode()" value="우편번호 찾기"><br>
							<input type="text" id="u_address"       name="u_address"       placeholder="주소" value="경북 경주시 건천읍 하늘마루길 18-10" style="width: 100%;"  required><br>
							<input type="text" id="u_detailaddress" name="u_detailaddress" placeholder="상세주소" value="하늘" style="width: 55%;"><br>
							<input type="text" id="u_extraaddress"  name="u_extraaddress"  placeholder="참고항목" value="하늘" style="width: 55%;">
						</div>
					</td>
				</tr>
				<tr>
					<td><span class="redFont">*</span>연락처:</td>
					<td>
						<div>
							<input type="text" name="u_phone" placeholder="(-)빼고 입력" style="width: 200px;" value="01000000000" required>
						</div>
					</td>
				</tr>
				<tr>
					<td>프로필사진:</td>
					<td>
						<div>
							<input type="file" accept="image/*" onchange="readURL(this)" name="u_profileimg" class="u_profileimg" /><br>
							<img id="preview" style="max-width: 300px;">
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div style="display: flex; justify-content: center;">
							<a type="button" class="btn btn-secondary"
								onclick="location.href='/';">메인 화면</a>
							<button type="submit" class="btn btn-primary">회원가입</button>
						</div>
					</td>
				</tr>
			</table>
             
            </form> 
          </div>   
         
      
      
    <!-- Footer Start -->
        <div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container py-5">
                <div class="row g-5">
                    <div class="col-lg-3 col-md-6">
                        <h5 class="text-white mb-4">Get In Touch</h5>
                        <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>그린아카데미</p>
                        <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>010-0000-0000</p>
                        <p class="mb-2"><i class="fa fa-envelope me-3"></i>green@naver.com</p>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h5 class="text-white mb-4">Quick Links</h5>
                        <a class="btn btn-link text-white-50" href="">예스키즈존</a>
                        <a class="btn btn-link text-white-50" href="">게시판</a>
                        <a class="btn btn-link text-white-50" href="">채팅방</a>
                        <a class="btn btn-link text-white-50" href="">고객문의</a>
                        <a class="btn btn-link text-white-50" href="">마이 페이지</a>
                    </div>
                   <div class="col-lg-3 col-md-6">
                        <h5 class="text-white mb-4">Newsletter</h5>
                        <p>어린이 관련 뉴스를 <br>이메일로 받아보세요! </p>
                        <div class="position-relative mx-auto" style="max-width: 400px;">
                            <input class="form-control bg-transparent w-100 py-3 ps-4 pe-5" type="text" placeholder="이메일 입력">
                            <button type="button" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">구독</button>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h5 class="text-white mb-4">About</h5>
                       <p>키즈파크에 오신것을 환영합니다.<br>많은 이용 부탁드립니다!</p>        
                        <div class="d-flex pt-2">
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-youtube"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-linkedin-in"></i></a>
                        </div>            
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="copyright">
                    <div class="row">
                        <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                            &copy; <a class="border-bottom" href="#">KidzPark</a>, All Right Reserved. 
                     
                        </div>
                        <div class="col-md-6 text-center text-md-end">
                            <div class="footer-menu">
                                <a href="">Home</a>
                                <a href="">게시판</a>
                                <a href="">채팅방</a>
                                <a href="">고객센터</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
			$("#pwdcheck_2").text("비밀번호 다시 확인해주세요");
			$("#pwdcheck_2").css("color", "red");
			$("#user_pw2").val("");
			user_pw2 = false;
		}
	}); // pw2 blur end   
    	function checkId(){
    		var u_id = $('#u_id').val();
    		$.ajax({
    			url  : '/IdCheck',
    			type : 'get',
    			data : { u_id : u_id },
    				success : function(result){
    					if(result == 0){
    						alert("중복되지 않은 아이디입니다");
    						isIdAvailable = true;
    					} else {
    						alert("아이디를 다시 입력해주세요");
    						isIdAvailable = false;
    						$('#u_id').val('');
    					}
    					$('#u_id').prop('readonly', isIdAvailable);
    				},
    				error : function() {
    					alert("error");
    				}
    			}); // ajax end
    	} // idcheck end
    	
    	function checkEmailAvailability() {
    	    var u_email = $('#u_email').val();

    	    $.ajax({
    	        url: '/ECheck',
    	        type: 'get',
    	        data: { u_email: u_email },
    	        success: function (result) {
    	            var message = (result == 0) ? "중복되지 않은 이메일입니다" : "이메일을 다시 입력해주세요";
    	            $("#email_m").text(message);

    	            if (result != 0) {
    	                $('#u_email').val('');
    	            }
    	        },
    	        error: function () {
    	            alert("error");
    	        }
    	    });
    	}

    	function validateEmail(email) {
    	    var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    	    return emailRegex.test(email);
    	}

    	$('#u_email').blur(function () {
    	    var emailInput = $(this).val();

    	    if (!validateEmail(emailInput)) {
    	        $("#email_m").text("이메일을 다시 입력해주세요");
    	        return;
    	    }

    	    checkEmailAvailability();
    	});
    	
    	function checkNickname() {
    	    var u_nickname = $('#u_nickname').val();

    	    // 닉네임이 한글 단어 완성, 영어, 숫자 중 하나만 포함되었는지 확인
    	    var regex = /^[가-힣a-zA-Z0-9]*[가-힣]+[가-힣a-zA-Z0-9]*|[a-zA-Z0-9]*[a-zA-Z]+[가-힣a-zA-Z0-9]*|[a-zA-Z0-9]*[0-9]+[가-힣a-zA-Z0-9]*$/;
    	    if (!regex.test(u_nickname)) {
    	        $("#nick_m").text("1자 이상 20자 이하로 입력해주세요");
    	        return;
    	    }

    	    $.ajax({
    	        url: '/NCheck',
    	        type: 'get',
    	        data: { u_nickname: u_nickname },
    	        success: function (result) {
    	            if (result == 0) {
    	                $("#nick_m").text("중복되지 않은 닉네임입니다");
    	            } else {
    	                $("#nick_m").text("닉네임을 다시 입력해주세요");
    	                $('#u_nickname').val('');
    	            }
    	        },
    	        error: function () {
    	            alert("error");
    	        }
    	    });
    	}

    	// 닉네임 체크 함수를 blur 이벤트에 연결
    	$('#u_nickname').blur(checkNickname);
    </script>
    <script>
    function checkIdcg() {
		$('#u_id').prop('readonly', false);
	}
    function u_execDaumPostcode() {
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
							document.getElementById("u_extraaddress").value = extraAddr;

						} else {
							document.getElementById("u_extraaddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('u_postcode').value = data.zonecode;
						document.getElementById("u_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("u_detailaddress").focus();
					}
				}).open();
	}
    
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
    
    var isIdChecked  =  false;
	   
	   function validateForm() {
	      var requiredFields = document.querySelectorAll('input[required]');
	      for (var i = 0; i < requiredFields.length; i++) {
	          if (requiredFields[i].value.trim() === '') {
	              alert("필수 입력란을 작성하세요.");
	              event.preventDefault();
	              return false;
	          }
	      }
	      if (!$('#u_id').prop('readonly')){
	         alert('아이디 중복 체크를 먼저 진행하세요');
	         event.preventDefault();
	         return false;
	      }
	      return true;
	  }
	   
	   
	  $('form').submit(function (event) {
		    event.preventDefault(); // 기본 동작 중단

		    // AJAX로 서버에 폼 데이터 전송
		    $.ajax({
		        url: '/Join',
		        type: 'POST',
		        data: new FormData(this),
		        contentType: false,
		        processData: false,
		        success: function (response) {
		            // 가입 성공 시
		            alert('회원가입이 완료되었습니다.');
		            // 다른 동작 수행 (예: 페이지 이동 등)
		            window.location.href = '/LoginForm';
		        },
		        error: function (xhr, status, error) {
		            // 가입 실패 시
		            alert('회원가입에 실패했습니다. 다시 시도해주세요.');
		            console.error(xhr, status, error);
		        }
		    });
		});
    </script>
    
</body>

</html>