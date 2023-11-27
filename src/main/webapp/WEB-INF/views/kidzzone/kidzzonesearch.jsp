<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="utf-8">

<head>
<meta charset="utf-8">
<title>Yes키즈존</title>
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
.modal-dialog {
  position: fixed !important;
  bottom: 0%;
  left: 50%; /* 화면 중앙에 위치하는 경우 */
  width: 50% !important; /* 원하는 너비로 설정 */
}

.modal-body {
  height: 300px; /* 원하는 세로 길이 설정 */
  overflow-y: auto; /* 내용이 넘칠 경우 스크롤바 추가 */
}

body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
}

.row1 {
	display: flex;
	flex-wrap: wrap;
	margin: 25px 25px auto;
}

#map {
	margin: auto;
}

.chat-list {
	width: 400px;
	margin: auto;
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

.chat-room {
	padding: 20px;
	border-bottom: 1px solid #ddd;
}

.chat-room:last-child {
	border-bottom: none; /* 마지막 채팅방의 하단 경계선 제거 */
}

.chat-room h3 {
	margin: 0;
}

.chat-room p {
	margin: 0;
}

.chat-room .last-message {
	color: #888;
}

.chat-room .timestamp {
	font-size: 12px;
	color: #888;
}


.chat-list {
	height: 50vh; /* 뷰포트의 높이를 100%로 설정 */
	overflow-y: auto; /* 수직 스크롤을 가능하게 설정 */
}

   .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 140px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 40px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
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
						style="margin-top: 13%; text-align: center;">Yes키즈존</h1>
				</div>
			</div>
		</div>
		<!-- Header End -->

		<!-- Search Start -->
		<form action="/KidzzoneSearch" method="post">
		<div class="container-fluid bg-primary mb-5 wow fadeIn"
			data-wow-delay="0.1s" style="padding: 35px;">
			<div class="container">
				<div class="row g-2">
					<div class="col-md-10">
						<div class="row g-2">
							<div class="col-md-3">
								<select class="form-select border-0 py-3" name="kz_location">
									<option value="all" selected>지역</option>
									<option value="서울">서울</option>
									<option value="부산">부산</option>
									<option value="인천">인천</option>
									<option value="대구">대구</option>
									<option value="대전">대전</option>
									<option value="광주">광주</option>
									<option value="울산">울산</option>
								</select>
							</div>
							<div class="col-md-3">
								<select class="form-select border-0 py-3" name="kz_category">
									<option value="all" selected>카테고리</option>
									<option value="카페">카페</option>
									<option value="음식점">음식점</option>
									<option value="키즈카페">키즈카페</option>
									<option value="체험활동">체험활동</option>
								</select>
							</div>
							<div class="col-md-3">
								<select class="form-select border-0 py-3" name="searchOption">
									<option value="all" selected>검색</option>
									<option value="KZ_NAME">매장 이름</option>
									<option value="KZ_ADDRESS">매장 주소</option>
								</select>
							</div>
							<div class="col-md-3">
								<input type="text" class="form-control border-0 py-3"
									name="searchKeyword" placeholder="Search Keyword">
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<button type="submit" class="btn btn-dark border-0 w-100 py-3">Search</button>
					</div>
				</div>
			</div>
		</div>
		</form>
		<!-- Search End -->
		<!-- 지도 화면 구현 -->

		<div class="container-xxl py-5">
			<div class="container">
				<div class="row1">
					<div id="map"
						style="width: 500px; height: 450px; margin-top: 3%; border-radius: 10px; border: 2px solid #000;">
					</div>

					<!-- 지도 화면 구현 끝 -->
					<div class="chat-list" style="margin-top: 3%; max-width: 300px;">
						<div id="content"></div>
						<div class="pagination" style="text-align: center;">
							<div id="pageNum" style="width: 50%; margin: auto;"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Footer Start -->
		<%@include file="/WEB-INF/views/include/footer.jsp"%>
		<!-- Footer End -->
	</div>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <!-- 리뷰 내용은 여기에 동적으로 추가됩니다. -->
        <div id="reviewContent"></div>
        
        <!-- 리뷰 작성 폼 -->
        <form id="reviewForm" enctype="multipart/form-data">
        <input type="hidden" name="u_no" value="${loginVo.u_no }" id="u_no">
        <input type="hidden" name="kz_no" id="kz_no">
          <div class="mb-3">
            <label for="reviewInput" class="form-label">리뷰 입력</label>
            <textarea class="form-control" id="reviewInput" name="r_review" rows="3"></textarea>
          </div>
           <div class="mb-3">
            <label for="imageInput" class="form-label">사진 업로드</label>
            <input type="file" class="form-control" id="imageInput" name="r_reviewimg" accept="image/*" onchange="readURL(this)">
            <br>
            <img id="preview" style="width: 100px;">
    </div>
          <!-- 추가적인 입력 폼들을 필요에 따라 추가할 수 있습니다. -->
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" onclick="saveReview()">저장</button>
      </div>
    </div>
  </div>
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
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fad561524453bbd8238a7dec3e7acb20&libraries=services"></script>
	<script>
	
	window.onload = function() {
	    // 페이지 로드 완료 후 updatePage 함수 실행
	    updatePage();
	    mysite();
	};
	
    let pg = '${pg}'; // 페이지네이션 정보
    let nowPage = pg.nowPage; // 현재 페이지 번호
    let cntPerPage = pg.cntPerPage; // 페이지당 항목 수
    
    let searchOption = '${map.searchOption}';
    let kz_location = '${map.kz_location}';
    let searchKeyword = '${map.searchKeyword}';
    let kz_category = '${map.kz_category}';
    
	$(document).on('click', '#pageNum a', function(e) {
		e.preventDefault();
	    nowPage = $(this).text(); // 클릭한 버튼의 페이지 번호
	    updatePage(); // AJAX 요청 재실행
	});
	    
	    function updatePage() {  	
	    	$.ajax({
	    		type: "GET",
	   			 url: "/KidzzoneSearchList", // 요청 URL
	   			 data: { 
	    					nowPage: nowPage, // 페이지 번호
	        				cntPerPage: cntPerPage, // 페이지당 표시할 항목 수
	        				searchOption : searchOption,
	        				kz_location : kz_location,
	        				searchKeyword : searchKeyword,
	        				kz_category : kz_category
	    },
	    success: function(response) {	    	
	    	   let tag = '';
		        for(let position of response.selectkiddzone) {
		        	 tag += '<div class="chat-room">'
		                 tag += '<h3>' + position.KZ_NAME + '</h3><p class="timestamp">' +position.KZ_EXPLANATION + '</p>'
		                 tag += '<p class="last-message">' + position.KZ_OPENINGTIME + '</p><button onclick="moveMap(\'' + position.KZ_ADDRESS + '\');">지도보기</button></div>'
		        }
	        // 페이지 내용 갱신
		        $("#content").html(tag);
	        
	        let page = response.pg;
	        
	        
	    	 let pageNumTag = '';
		        if(page.startPage != 1) {
		            pageNumTag += '<a href="/KidzzoneSearchList?nowPage=' + (page.startPage - 1) + '&cntPerPage=' + page.cntPerPage + '">&lt;</a>';
		        }
		        for(let p = page.startPage; p <= page.endPage; p++) {
		            if(p == page.nowPage) {
		                pageNumTag += '<a>' + p + '</a>';
		            } else {
		                pageNumTag += '<a href="/KidzzoneSearchList?nowPage=' + p + '&cntPerPage=' + page.cntPerPage + '">' + p + '</a>';
		            }
		        }
		        if(response.pg.endPage != response.pg.lastPage) {
		            pageNumTag += '<a href="/KidzzoneSearchList?nowPage=' + (page.endPage+1) + '&cntPerPage=' + page.cntPerPage + '">&gt;</a>';
		        }
		        // 페이지네이션 링크 갱신
		        $("#pageNum").html(pageNumTag);
	    	

	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	        console.log("오류: ", textStatus, errorThrown); // 오류 정보 출력
	    }
	});
	         }
	

	
		
	 // 지도 api	

	 var jsonStr = '${json}';
	 jsonStr = jsonStr.replace(/\n/g, "\\n");
	 var data = JSON.parse(jsonStr);

	 var positions = data.selectkiddzone;

	 var mapContainer = document.getElementById('map'); // 지도를 표시할 div
	 var mapOption = {
	     center: new kakao.maps.LatLng(35.157759003, 129.059317193), // 기본 지도 중심좌표
	     level: 3 // 지도의 확대 레벨
	 };


	 // 지도를 생성합니다
	 var map = new kakao.maps.Map(mapContainer, mapOption);

	 // 주소-좌표 변환 객체를 생성합니다
	 var geocoder = new kakao.maps.services.Geocoder();

	 var markers = []; // 마커를 담을 배열
	 var overlays = []; // 오버레이를 담을 배열

	 positions.forEach(function(position) {
			console.log("position : ", position);
			 let kz_no = position.kz_no; // 변수를 블록 스코프로 변경
			 let u_no = document.getElementById('u_no').value; // 변수를 블록 스코프로 변경
			 
		    geocoder.addressSearch(position.kz_address, function(result, status) {
		        if (status === kakao.maps.services.Status.OK) {
		            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		            var marker = new kakao.maps.Marker({
		                map: map,
		                position: coords
		            });
		            markers.push(marker);
		            
		            if (position.u_no !== null && position.kz_likeuser == 0) {
		            var content = '<div class="wrap">' + 
		            '    <div class="info">' + 
		            '        <div class="title">' + 
		            position.kz_name + 
		            '            <div class="close" onclick="closeOverlay('+(overlays.length)+')" title="닫기"></div>' + 
		            '        </div>' + 
		            '        <div class="body">' + 
		            '            <div class="img">' +
		            '                <img src="/img/'+position.kz_img+'" width="73" height="70">' +
		            '           </div>' + 
		            '            <div class="desc">' + 
		            '                <div class="ellipsis">'+position.kz_address+'</div>' +
		            '                <div class="jibun ellipsis">(우)' +position.kz_postcode +
		            '                <div><a href="javascript:void(0);" onclick="openReviewModal(\'' + position.kz_no + '\')" class="link">리뷰보기</a></div>' +  
		            '                <div id="Like">  ' +   
		            ' <p style="font-size: 20px;"><a href="javascript:void:(0);" onclick="kidzzoneLike(' + kz_no + ',' + u_no + ')">🤍'+ position.kz_like +'️</a></p>';
		            '            </div>' + 
		            '           <div>' + 
		            '            </div>' + 
		            '        </div>' + 
		            '    </div>' +    
		            '</div>';

		              } else if (position.u_no !== null && position.kz_likeuser == 1) {
		                  var content = '<div class="wrap">' + 
		                  '    <div class="info">' + 
		                  '        <div class="title">' + 
		                  position.kz_name + 
		                  '            <div class="close" onclick="closeOverlay('+(overlays.length)+')" title="닫기"></div>' + 
		                  '        </div>' + 
		                  '        <div class="body">' + 
		                  '            <div class="img">' +
		                  '                <img src="/img/'+position.kz_img+'" width="73" height="70">' +
		                  '           </div>' + 
		                  '            <div class="desc">' + 
		                  '                <div class="ellipsis">'+position.kz_address+'</div>' +
		                  '                <div class="jibun ellipsis">(우)' +position.kz_postcode +
		                  '                <div><a href="javascript:void(0);" onclick="openReviewModal(\'' + position.kz_no + '\')" class="link">리뷰보기</a></div>' +  
		                  '                <div id="Like"> '+    
		                  '<p style="font-size: 20px;"><a href="javascript:void:(0);" onclick="kidzzoneUnLike(' + kz_no + ',' + u_no + ')">❤'+ position.kz_like +'️</a></p>';
		                  '            </div>' + 
		                  '           <div>' + 
		                  '            </div>' + 
		                  '        </div>' + 
		                  '    </div>' +    
		                  '</div>';

		                  
		              }
		            var overlay = new kakao.maps.CustomOverlay({
		                content: content,
		                map: map,
		                position: marker.getPosition()
		            });
		            overlays.push(overlay);
                    overlay.setMap(null);



		            kakao.maps.event.addListener(marker, 'click', function() {
		                overlays.forEach(function(overlay) {
		                    overlay.setMap(null);
		                });
		                overlay.setMap(map);
		                
		            });
		        }
		    });
		});



		// 인덱스를 기반으로 오버레이를 닫는 함수를 정의합니다
		function closeOverlay(index) {
		    overlays[index].setMap(null); // 해당 인덱스의 오버레이만 닫음
		}


		// GeoLocation을 이용해서 접속 위치를 얻어옵니다
		function mysite(){

			navigator.geolocation.getCurrentPosition((position) => {
		        try {
		            var lat = position.coords.latitude, // 위도
		                lon = position.coords.longitude; // 경도

		            // 현재 위치로 지도 중심 이동
		            var center = new kakao.maps.LatLng(lat, lon);
		            map.setCenter(center);

		            // 마커 생성 및 표시
		            var marker = new kakao.maps.Marker({
		                map: map,
		                position: center
		            });

		            // 마커에 인포윈도우 표시
		            var infowindow = new kakao.maps.InfoWindow({
		                content: '현재 위치'
		            });
		            infowindow.open(map, marker);
		        } catch (error) {
		            console.error('Error in getCurrentPosition:', error);
		        }
		    }, function (error) {
		        console.error('Error in getCurrentPosition:', error);
		    });

		}
		function moveMap(movemap){
			geocoder.addressSearch(movemap, function (result, status) {
		        console.log(result, status);
		        // 정상적으로 검색이 완료됐으면
		          if (status === kakao.maps.services.Status.OK) {

		             var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		        	const moveLatLon = new kakao.maps.LatLng(coords.getLat(), coords.getLng());
		            map.panTo(moveLatLon);
		        }
			});
		}

				    
		function openReviewModal(kz_no) {
		    var url = '/KidzzoneReview?kz_no=' + kz_no;

		    // AJAX를 사용하여 데이터를 조회합니다.
		    $.ajax({
		        url: url,
		        method: 'GET',
		        success: function(data) {
		            console.log("data : ", data.reviewList);

		            // 데이터가 존재하는 경우
		            if (data && data.reviewList.length > 0) {
		                // 각 리뷰의 정보를 <p> 태그로 생성
		                var reviewContentHtml = '';
		                
		                let u_no = document.getElementById('u_no').value; // 변수를 블록 스코프로 변경
		                for (var i = 0; i < data.reviewList.length; i++) {
		                    var review = data.reviewList[i];
		                    var deleteButtonHtml = (review.U_NO == u_no) ? '<button class="btn btn-danger" onclick="deleteReview('+ review.KZ_NO + ',' + review.R_NO + ')">삭제</button>' : '';
		                    var reviewImgHtml = review.R_REVIEWIMG ?
		                        '<p><strong></strong> <img src="/img/' + review.R_REVIEWIMG + '" style="width: 100px;"></p>' :
		                        '';

		                    reviewContentHtml +=
		                        reviewImgHtml +
		                        '<p><strong>작성자 닉네임:</strong> ' + review.U_NICKNAME + '</p>' +
		                        '<p><strong>리뷰 작성일:</strong> ' + review.R_REVIEWDATE + '</p>' +
		                        '<p><strong>리뷰 내용:</strong> ' + review.R_REVIEW + '</p>' +
		                        deleteButtonHtml +
		                        '<hr>'; // 리뷰 간에 구분선을 추가하였습니다.
		                }

		                $('.modal-title').html(review.KZ_NAME + ' 점 리뷰');
		                
		                // 리뷰 내용을 모달에 넣기
		                $('#reviewContent').html(reviewContentHtml);
		            } else {
		                // 데이터가 없을 경우 메시지 출력
		                $('#reviewContent').html('<p>리뷰가 없습니다.</p>');
		                $('.modal-title').html( data.kz_name + '&nbsp; 점 리뷰');
		            }
		            
		            $('#kz_no').val(kz_no);
		            
		            resetReviewForm();
		            // 모달을 열기
		            $('#exampleModal').modal('show');
		        },
		        error: function(error) {
		            console.error('데이터 조회에 실패했습니다: ', error);
		        }
		    });
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

		function saveReview() {
			 var kz_no = $('#kz_no').val();
		     var formData = new FormData($('#reviewForm')[0]);
		     formData.append('kz_no', kz_no);
		    $.ajax({
		        url: '/SaveReview',
		        method: 'POST',
		        data: formData,
		        processData: false,
		        contentType: false,
		        success: function(response) {
		            console.log('리뷰가 성공적으로 저장되었습니다.');
		            console.log("받기 : " + response)
		            alert("리뷰가 등록되었습니다!.")
		            openReviewModal(kz_no);
		        },
		        error: function(error) {
		            console.error('리뷰 저장에 실패했습니다: ', error);
		            alert("로그인이 필요합니다 !.")
		        }
		    });
		}

		function resetReviewForm() {
		    // 폼 리셋
		    $('#reviewForm')[0].reset();

		    $('#preview').attr('src', ''); // 빈 문자열로 src 속성을 비움
		    
		    
		}


		function deleteReview(kz_no, r_no) {
		    // AJAX를 사용하여 리뷰를 삭제하는 요청 보내기
		    let u_no = document.getElementById('u_no').value; // 변수를 블록 스코프로 변경
		    $.ajax({
		        url: '/DeleteReview',
		        method: 'DELETE',
		        data: {
		            r_no: r_no,
		            u_no : u_no
		        },
		        success: function(response) {
		            console.log('리뷰가 성공적으로 삭제되었습니다.');
		            alert("리뷰가 삭제되었습니다!.")
		            // 삭제 후 모달을 닫거나, 삭제된 리뷰를 화면에서 갱신할 수 있습니다.
		            openReviewModal(kz_no);
		        },
		        error: function(error) {
		            console.error('리뷰 삭제에 실패했습니다: ', error);
		           	
		        }
		    });
		}




		function kidzzoneLike(kz_no, u_no) {
			$.ajax({
				type : "POST",
				url  : "/KidzzoneLike",
				data : {
					kz_no : kz_no,
					u_no  : u_no
				},
				success : function() {			
					console.log("관심매장 추가 완료 !");
					alert("관심매장이 추가되었습니다!.");
					window.location.href = "UserLikeList?u_no=" + u_no;
				
				},
				error : function(error) {
					alert("로그인이 필요합니다 !");
					console.error("관심매장 추가 실패 !", error);	
				}
			});
		}

		function kidzzoneUnLike(kz_no, u_no) {
			$.ajax({
				type : "DELETE",
				url  : "/KidzzoneUnLike",
				data : {
					kz_no : kz_no,
					u_no  : u_no
				},
				success : function() {
					console.log("관심매장 삭제 완료 !");
					alert('관심매장이 삭제 되었습니다!.');
					location.reload();
				},
				error : function(error) {
					console.error("관심매장 삭제 실패 !", error);	
					
				}
			});
		}





									
		    
	
		 

	</script>
</body>

</html>