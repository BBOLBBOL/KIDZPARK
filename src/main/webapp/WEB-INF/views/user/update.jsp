<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="utf-8">

<head>
<meta charset="utf-8">
<title>회원정보 수정</title>
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

td{
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
#u_id, #u_name, #u_email {
    background-color: #ddd; /* 회색 또는 다른 원하는 색상으로 변경 */
}
@media (max-width: 768px) {
  /* 768px보다 작은 화면 크기에 대한 스타일 설정 */
  .container-xxl, .form, .button, .tr, .td, .span, .input{
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
  .container-xxl, .form, .button, .tr, .td, .span, .input, #number1 {
    width: auto;
    height: auto;
  }
  
  .form, button, tr, td, #number1 {
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
                 <h1 class="display-4 animated fadeIn mb-4" style="margin-top : 13%; text-align: center;">회원정보 수정</h1>
               </div>
            </div>  
	        <hr>
	        <hr>
          </div>  
    <!-- Header End -->            
                
                
          <div class="container-xxl py-5">
            <form action="/UserUpdate" method="POST" enctype="multipart/form-data" onsubmit="validateForm()">
             <table class="tb1">
				<colgroup>
					<col width="25%">
					<col width="*">
				</colgroup>
				<tr>
					<td colspan="2"	style="background-color: #cee3f6; font-weight: bold;">
					<span class="redFont">(*수정가능)</span> 회원기본정보</td>
				</tr>
				<tr>
					<td></span>아이디:</td>
					<td><input type="text" name="u_id" id="u_id" style="width: 200px"  readonly></td>
				</tr>
				<tr>
					<td><span class="redFont">*</span>비밀번호:</td>
					<td><input type="password" name="u_pw" id="user_pw1" style="width: 200px" readonly>
						<input type="button" onclick="ChangePw()" value="비밀번호 변경">
					</td>
				</tr>
				<tr>
					<td>이름:</td>
					<td><input type="text" name="u_name" id="u_name" style="width: 200px" readonly ></td>
				</tr>
				<tr>
					<td>이메일 입력:</td>
					<td>
						<input type="text" name="u_email" id="u_email" style="width: 200px"  placeholder="이메일 입력"  readonly>
					</td>
				</tr>
				<tr>
					<td><span class="redFont">*</span>닉네임:</td>
					<td><input type="text" name="u_nickname" id="u_nickname" style="width: 200px" >
						<input type="button" onclick="nickname()" value="닉네임 중복확인">
					</td>
				</tr>
				<tr>
					<td><span class="redFont">*</span>주소:</td>
					<td>
						<div>
							<input type="text" id="u_postcode"      name="u_postcode"      placeholder="우편번호"  style="width: 200px" required>
						    <input type="button" onclick="u_execDaumPostcode()" value="우편번호 변경"><br>
							<input type="text" id="u_address"       name="u_address"       placeholder="주소"  style="width: 100%;"  required><br>
							<input type="text" id="u_detailaddress" name="u_detailaddress" placeholder="상세주소"  style="width: 55%;"><br>
							<input type="text" id="u_extraaddress"  name="u_extraaddress"  placeholder="참고항목"  style="width: 55%;">
						</div>
					</td>
				</tr>
				<tr>
					<td><span class="redFont">*</span>연락처:</td>
					<td>
						<div>
							<input type="text" id="u_phone" name="u_phone" onBlur="pCheck()" placeholder="(-)빼고 입력" style="width: 200px;" required>
							<span id="pCheck"></span>
						</div>
					</td>
				</tr>
				<tr>
					<td>현재사진:</td>
					<td>
						<div>
							<img id="u_profileimg" style="max-width: 300px;">
						</div>
					</td>
				</tr>
				<tr>
					<td>변경할 프로필사진:</td>
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
							<button type="submit" class="btn btn-primary">회원수정</button>
						</div>
					</td>
				</tr>
			</table>
            </form> 
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
    function ChangePw() {
        var u_id = $('#u_id').val();
        var u_pw = $('#user_pw1').val();
        var url = '/UpdatePwForm?u_id=' + u_id;
        var popup = window.open(url, '비밀번호 변경', 'width=500,height=500');

    }
    
    function nickname() {
        var u_nickname = $('#u_nickname').val();
        // 닉네임 유효성 체크 정규식
        var regex = /^[가-힣a-zA-Z0-9]*[가-힣]+[가-힣a-zA-Z0-9]*|[a-zA-Z0-9]*[a-zA-Z]+[가-힣a-zA-Z0-9]*|[a-zA-Z0-9]*[0-9]+[가-힣a-zA-Z0-9]*$/;

        if (!regex.test(u_nickname)) {
            alert('사용하실수 없는 닉네임 입니다.');
        } else {
            $.ajax({
                url: '/NCheck',
                type: 'get',
                data: { u_nickname: u_nickname },
                success: function (result) {
                    if (result == 1) {
                        alert('사용중인 닉네임 입니다. 다시 입력해주세요');
                    } else {
                        alert('사용하실 수 있는 닉네임입니다');
                    }
                },
                error: function () {
                    alert("서버 오류 발생");
                }
            });
        }
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
	      return true;
	  }
	   
	  $(document).ready(function() {
		    var u_id = '${loginVo.u_id}';
		    
		    $.ajax({
		        url: '/InfoList?u_id=' + u_id,
		        type: 'GET',
		        success: function(response) {
		            // 서버에서 받아온 데이터를 사용하여 tr의 값을 업데이트
		            // 이 부분에서는 실제 페이지의 DOM 구조와 데이터에 맞게 코드를 수정해야 합니다.
		            $('#u_id').val(response.u_id);
		            $('#user_pw1').val(response.u_pw);
		            $('#u_name').val(response.u_name);
		            $('#u_email').val(response.u_email);
		            $('#u_nickname').val(response.u_nickname);
		            $('#u_postcode').val(response.u_postcode);
		            $('#u_address').val(response.u_address);
		            $('#u_detailaddress').val(response.u_detailaddress);
		            $('#u_extraaddress').val(response.u_extraaddress);
		            $('#u_phone').val(response.u_phone);
		            $('#u_profileimg').attr('src', '/img/' + response.u_profileimg);
		        },
		        error: function(error) {
		            console.error('Error:', error);
		        }
		    });
		});
	  
	  function pCheck() {
		    var u_phone = $('#u_phone').val();
		    var regex = /^\d{10,11}$/;
		    
		    if (!regex.test(u_phone)) {
		        $("#pCheck").text("1자 이상 20자 이하로 입력해주세요");
		        return;
		    }
		    
		    // 유효성 검사가 통과했을 때만 AJAX 호출
		    $.ajax({
		        url: '/pCheck',
		        type: 'get',
		        data: { u_phone: u_phone },
		        success: function (result) {
		            if (result == 1) {
		                $("#pCheck").text("연락처를 다시 입력해주세요");
		                $('#u_phone').val('');
		            } else {
		                $("#pCheck").text("중복되지 않은 연락처입니다");
		            }
		        },
		        error: function () {
		            alert("error");
		        }
		    });
		}
	  
	  $('form').submit(function (event) {
		    event.preventDefault(); // 기본 동작 중단
		    var formData = new FormData(this);
		    // 콘솔에 폼 데이터 출력
		    formData.forEach(function(value, key){
		        console.log(key + ': ' + value);
		    });

		    // AJAX로 서버에 폼 데이터 전송
		    $.ajax({
		        url: '/UserUpdate',
		        type: 'POST', 
		        data: formData,
		        contentType: false, 
		        processData: false,
		        success: function (response) {
		        	console.log(response);
		            alert('회원수정이 완료되었습니다.');
		            // 다른 동작 수행 (예: 페이지 이동 등)
		            
		            window.location.href = '/';
		            
		        },
		        error: function (xhr, status, error) {
		            alert('회원수정에 실패했습니다. 다시 시도해주세요.');
		        }
		    });
		});
    </script>
    
</body>

</html>