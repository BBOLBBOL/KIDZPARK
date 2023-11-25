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
    
            .name {
        white-space: nowrap;         /* 텍스트 줄 바꿈 금지 */
        overflow: hidden;            /* 넘치는 부분 감춤 */
        text-overflow: ellipsis;     /* 넘치는 부분에 ... 표시 */
        max-width: 10em;             /* 최대 너비 설정 (10em은 예시) */
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
						style="margin-top: 13%; text-align: center;">회원목록</h1>
				</div>
			</div>
		</div>
		<hr>
		<!-- Header End -->
		 <div class="container-xxl py-5">
		 <table class="table table-hover">
		   <thead class="thead-white">
		    <tr>
		    <th><input type="checkbox" id="allCheck"></th>
		     <th scope="col">회원No</th>
		       <th scope="col">회원ID</th>
		       <th scope="col">회원이름</th>
		       <th scope="col">회원주소</th>
		       <th scope="col">닉네임</th>
		       <th scope="col">번호</th>
		       <th scope="col">등급</th>
		    </tr>
		    </thead>
		    <tbody class="tbody-white">
		    <c:forEach var="userList" items="${userList }">
		    <tr>
		      <td><input type="checkbox" name="rowCheck" id="rowCheck" value="${userList.u_no }"></td>
		      <td>${userList.u_no }</td>
		      <td>${userList.u_id}</td>
		      <td>${userList.u_name }</td>
		      <td class="name">${userList.u_address } &nbsp; ${userList.u_detailaddress }</td>
		      <td>${userList.u_nickname}</td>
		      <td>${userList.u_phone}</td>
		      <td>${userList.u_grade}</td>
		    </tr>
		    </c:forEach>
		    </tbody>
		  </table>
		  	<div style="margin: 10px 10px auto; text-align: right; ">
            <a type="button" class="btn btn-danger" onclick="deleteValue();">삭제</a>
            </div>
			<%@include file="/WEB-INF/views/include/admincspaging.jsp"%>
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
	<script>
//전체 체크    
var chkObj  =  document.getElementsByName("rowCheck");
var rowCnt  =  chkObj.length;

$("input[id='allCheck']").click(function() {
   var chk_listArr  =  $("input[name='rowCheck']");
   for (var i=0; i<chk_listArr.length; i++) {
      chk_listArr[i].checked  =  this.checked;
   }
});

function deleteValue() {
	   var u_no =  ${u_no};
	   var url  =  "/AdminUserDelete?u_no=" + u_no;
	   var valueArr  =  [];
	   var list  =  $("input[name='rowCheck']");
	   for(var i = 0; i < list.length; i++) {
	      if(list[i].checked) {
	         valueArr.push(list[i].value);
	      }
	   }
	   if(valueArr.length == 0) {
	      alert("선택하신 게 없습니다.");
	   }
	   else {
	      var chk  =  confirm("정말 삭제하시겠습니까?");
	      if(chk) {
	      $.ajax({
	         url  :  url,
	         type : 'post',
	         traditional : true,
	         data : {
	            'valueArr[]'  :  valueArr
	         },
	         success: function(jdata) {
	            if(jdata == 1) {
	               alert("삭제성공");
	               location.reload();
	               
	            }
	            else {
	               alert("삭제 실패");
	               event.preventDefault();
	            }
	         }
	      });
	   }
	}  // deleteValue
}

</script>
</body>

</html>