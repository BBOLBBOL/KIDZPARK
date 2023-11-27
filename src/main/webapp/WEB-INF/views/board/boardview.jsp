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
						style="margin-top: 13%; text-align: center;">${map.m_name}게시판</h1>
				</div>
			</div>
		</div>
		<!-- Header End -->



		<!-- Search Start -->
		<form action="/BoardSearchList" method="post">
			<div class="container-fluid bg-primary mb-5 wow fadeIn"
				data-wow-delay="0.1s" style="padding: 35px;">
				<div class="container">
					<input type="hidden" name="m_no" value="${map.m_no}">
					<div class="row g-2">
						<div class="col-md-10">
							<div class="row g-2">
								<div class="col-md-4"></div>
								<div class="col-md-3">
									<select class="form-select border-0 py-3" name="searchOption">
										<option value="all" selected>검색</option>
										<option value="b_title">제목</option>
										<option value="b_cont">내용</option>
										<option value="u_name">글쓴이</option>
									</select>
								</div>
								<div class="col-md-3">
									<input type="text" class="form-control border-0 py-3"
										name="searchKeyword" placeholder="Search Keyword">
								</div>
								<div class="col-md-2">
									<button type="submit" class="btn btn-dark border-0 w-100 py-3">Search</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
		<!-- Search End -->
		<!-- Contact Start -->
		<br>
		<div class="text-center mx-auto mb-5 wow fadeInUp"
			data-wow-delay="0.1s" style="max-width: 600px;">
			<h1 class="mb-3">${map.m_name}게시판</h1>
			<br>
		</div>
		<div class="row g-4">
			<div class="col-12">
				<div class="row gy-8">
					<div class="col-lg-1"></div>
					<div class="bg-light rounded p-3 col-lg-10">
						<div class="bg-white rounded p-4"
							style="border: 1px dashed rgba(0, 185, 142, .3)">
							<div class="container-xxl py-5">
								<div class="container">
									<div class="row g-4">
										<div class="col-md-1"></div>
										<div class="col-md-10">
											<div class="wow fadeInUp" data-wow-delay="0.5s">
												<div class="row g-2">
													<c:forEach var="board" items="${boardView}">
														<div class="col-md-12">
															<div class="form-floating" style="margin: auto;">
																<input type="text" class="form-control" id="b_title"
																	value="${board.B_TITLE}" readonly="readonly">
															</div>
															<br>
														</div>
														<div class="col-md-5">
															<div class="form-floating" style="margin: auto;">
																<input type="text" class="form-control" id="u_name"
																	value="${board.U_NICKNAME}" readonly="readonly">
															</div>
															<br>
														</div>
														<div class="col-12">
															<div class="form-floating">
																<textarea class="form-control" id="b_cont"
																	style="height: 400px" readonly="readonly">${board.B_CONT}</textarea>
															</div>
															<br>
														</div>
														<div class="col-md-12">
															<div class="form-floating" style="margin: auto;">
																<c:choose>
																	<c:when test="${board.B_IMG ne null}">
																		<img src="img/${board.B_IMG}" style="max-width: 100%;">
																	</c:when>
																</c:choose>
															</div>
															<br>
															<div id="like"></div>
														</div>
														<div class="col-3"
															style="margin-left: 15px; margin-right: 15px;">
															<a class="btn btn-primary w-100 py-3" onclick="goBack()">이전으로</a>
														</div>
														<c:if
															test="${loginVo.u_no eq map.u_no && map.ma eq null }">
															<div class="col-3"
																style="margin-left: 15px; margin-right: 15px;">
																<a class="btn btn-primary w-100 py-3"
																	href="/BoardUpdateForm?b_idx=${map.b_idx}&m_no=${map.m_no}">수정</a>
															</div>

															<div class="col-3"
																style="margin-left: 15px; margin-right: 15px;">
																<a class="btn btn-primary w-100 py-3"
																	href="/BoardDelete?b_idx=${map.b_idx}&m_no=${map.m_no}">삭제</a>
															</div>
														</c:if>
														<c:if
															test="${loginVo.u_no eq map.u_no && map.ma ne null }">
															<div class="col-3"
																style="margin-left: 15px; margin-right: 15px;">
																<a class="btn btn-primary w-100 py-3"
																	href="/BoardUpdateForm?b_idx=${map.b_idx}&m_no=${map.m_no}&u_no=${loginVo.u_no}&ma=${map.ma}">수정</a>
															</div>

															<div class="col-3"
																style="margin-left: 15px; margin-right: 15px;">
																<a class="btn btn-primary w-100 py-3"
																	href="/BoardDelete?b_idx=${map.b_idx}&m_no=${map.m_no}&u_no=${loginVo.u_no}&ma=${map.ma}">삭제</a>
															</div>
														</c:if>

													</c:forEach>
												</div>
											</div>
										</div>
										<div class="col-md-1"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-2"></div>
				</div>
			</div>
		</div>
		<br>
		<!-- Contact End -->


		<div class="row g-4">
			<div class="col-12">
				<div class="row gy-8">
					<div class="col-lg-1"></div>
					<div class="bg-light rounded p-3 col-lg-10">
						<div class="bg-white rounded p-4"
							style="border: 1px dashed rgba(0, 185, 142, .3)">
							<div class="container-xxl py-5">
								<div class="container">
									<div class="row g-4">
										<div class="col-md-1"></div>
										<div class="col-md-10">
											<div class="wow fadeInUp" data-wow-delay="0.5s">
												<form action="/CommentWrite" method="post">
													<input type="hidden" name="u_no" value="${loginVo.u_no}" id="u_no">
													<input type="hidden" name="u_no2" value="${map.u_no}" id="u_no">
													<input type="hidden" name="m_no" value="${map.m_no}">
													<input type="hidden" name="b_idx" value="${map.b_idx}">
													<div class="row g-2">
														<div id="content"></div>
														<div class="pagination" style="text-align: center; ">
															<div id="pageNum" style="width: 50%; margin: auto;"></div>
														</div>
														<c:choose>
															<c:when test="${loginVo ne null}">
																<div class="col-md-12">
																	<div class="form-floating" style="margin: auto;">
																		<input type="text" class="form-control" id="c_comment"
																			name="c_comment"> <label for="c_comment">댓글을
																			입력하세요</label>
																	</div>
																	<br>	
																</div>
														<div class="col-2" style="margin: auto; width: auto;">
															<button class="btn btn-primary"
																style="padding: 8px 12px !important;" type="submit">작성</button>
														</div>
															</c:when>
														</c:choose>
														<c:choose>
															<c:when test="${loginVo eq null}">
																<div class="col-md-12">
																	<div class="form-floating" style="margin: auto;">
																		<input type="text" class="form-control" id="c_comment"
																			name="c_comment" readonly> <label for="c_comment">로그인후 댓글을 입력할수 있습니다</label>
																	</div>
																	<br>
																</div>
														<div class="col-2" style="margin: auto; width: auto;">
															<button class="btn btn-primary"
																style="padding: 8px 12px !important;" type="button" onclick="nonClick(event)">작성</button>
														</div>
															</c:when>
														</c:choose>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>





		<!-- Footer Start -->
	     <%@include file="/WEB-INF/views/include/footer.jsp"%>
		<!-- Footer End -->
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
	
		function boardlikeuser(){
			let u_no = document.getElementById('u_no').value; // 변수를 블록 스코프로 변경
			$.ajax({
				type: "GET",
	   			 url: "/Boardlikeuser", // 요청 URL
	   			 data: {
    				b_idx: ${map.b_idx},
    				u_no: u_no
	   			 },
	   			success: function(response) {	    	
			        let tag = '';

		            if (response.u_no !== null && response.boardlikeuser == 0) {
		                tag += '<p style="text-align: center; font-size: 50px;"><a href="javascript:void(0);" onclick="boardLike()">🤍</a></p>';
		            } else if (response.u_no !== null && response.boardlikeuser == 1) {
		                tag += '<p style="text-align: center; font-size: 50px;"><a href="javascript:void(0);" onclick="boardUnLike()">❤️</a></p>';
		            }

		            $("#like").html(tag);
			},
	   			 error: function(jqXHR, textStatus, errorThrown) {
	 		        console.log("오류: ", textStatus, errorThrown); // 오류 정보 출력
	 		    }
			});
		}
	
	    function boardUnLike(){
	    	let u_no = document.getElementById('u_no').value; // 변수를 블록 스코프로 변경
	    	$.ajax({
				type: "DELETE",
	   			 url: "/BoardUnLike", // 요청 URL
	   			 data: {
    				b_idx: ${map.b_idx},
    				u_no: u_no
	   			 },
	   			success: function() {	
	   				console.log("성공");
			},
	   			 error: function(jqXHR, textStatus, errorThrown) {
	 		    	 boardlikeuser();
	 		    }
			});

	    }
	    
	    function boardLike(){
	    	let u_no = document.getElementById('u_no').value; // 변수를 블록 스코프로 변경
	    	$.ajax({
				type: "POST",
	   			 url: "/BoardLike", // 요청 URL
	   			 data: {
    				b_idx: ${map.b_idx},
    				u_no: u_no
	   			 },
	   			success: function() {	    
	   				console.log("성공");
	   				
			},
	   			 error: function(jqXHR, textStatus, errorThrown) {
	 		       boardlikeuser();
	 		    }
			});
	    }
     
		function goBack() {
			window.history.back();
		}
		
		
		window.onload = function() {
		    // 페이지 로드 완료 후 updatePage 함수 실행
		    updatePage();
		    boardlikeuser();
		};
		
	    let pg = '${pg}'; // 페이지네이션 정보
	    let nowPage = pg.nowPage; // 현재 페이지 번호
	    let cntPerPage = pg.cntPerPage; // 페이지당 항목 수
	    
		$(document).on('click', '#pageNum a', function(e) {
			e.preventDefault();
		    nowPage = $(this).text(); // 클릭한 버튼의 페이지 번호
		    updatePage(); // AJAX 요청 재실행
		});
	    
		$(document).on('click', '#c_comment', function(e) {
		    updatePage(); // AJAX 요청 재실행
		});
		console.log(${map.b_idx});
		    function updatePage() {  	
		    	$.ajax({
		    		type: "GET",
		   			 url: "/CommentList", // 요청 URL
		   			 data: { 
		    					nowPage: nowPage, // 페이지 번호
		        				cntPerPage: cntPerPage, // 페이지당 표시할 항목 수
		        				b_idx: ${map.b_idx}
		    },
		    success: function(response) {	    	
		        let tag = '';
		        for(let position of response.commentlist) {
		        	tag += '<div class="col-2" style="text-align: center; margin: auto;">';
		        	tag += '<div style="margin: auto; width: 80%;">';
		        	tag += '<input type="text" class="form-control" style="text-align: center;" value="' + position.U_NICKNAME + '" readonly="readonly">';
		        	tag += '</div><br></div>';

		        	tag += '<div class="col-12" style="text-align: center;">';
		        	tag += '<textarea class="form-control" readonly="readonly">' + position.C_COMMENT + '</textarea>';
		        	tag += '<br><hr><br></div>';
		        }
		        
		        // 페이지 내용 갱신
			        $("#content").html(tag);
		        
		        let page = response.pg;
		        
		    	 let pageNumTag = '';
			        if(page.startPage != 1) {
			            pageNumTag += '<a href="/CommentList?b_idx='+${map.b_idx}+'&nowPage=' + (page.startPage - 1) + '&cntPerPage=' + page.cntPerPage + '">&lt;</a>';
			        }
			        for(let p = page.startPage; p <= page.endPage; p++) {
			            if(p == page.nowPage) {
			                pageNumTag += '<a>' + p + '</a>';
			            } else {
			                pageNumTag += '<a href="/CommentList?b_idx='+${map.b_idx}+'&nowPage=' + p + '&cntPerPage=' + page.cntPerPage + '">' + p + '</a>';
			            }
			        }
			        if(response.pg.endPage != response.pg.lastPage) {
			            pageNumTag += '<a href="/CommentList?b_idx='+${map.b_idx}+'&nowPage=' + (page.endPage+1) + '&cntPerPage=' + page.cntPerPage + '">&gt;</a>';
			        }
			        // 페이지네이션 링크 갱신
			        $("#pageNum").html(pageNumTag);
		    	

		    },
		    error: function(jqXHR, textStatus, errorThrown) {
		        console.log("오류: ", textStatus, errorThrown); // 오류 정보 출력
		    }
		});
		         }
		    
		    function nonClick(event) {
		        // 기본 동작을 막음
		        event.preventDefault();

		        // 원하는 작업을 수행하지 않음
		        // (여기에 추가적인 JavaScript 로직을 작성할 수 있음)
		    }
	</script>
</body>

</html>