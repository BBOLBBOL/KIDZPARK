<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

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
                        <a class="btn btn-link text-white-50" href="/Kidzzone">예스키즈존</a>
                        <a class="btn btn-link text-white-50" href="/BoardList?m_no=1">게시판</a>
                        <c:if test="${loginVo eq null }">
                        <script>
                        function showLoginAlert(event) {
                     alert("로그인이 필요합니다!");
                     event.preventDefault();
                  }
                        </script>
                        <a class="btn btn-link text-white-50" href="/room" onclick="showLoginAlert(event)">채팅방</a>
                        <a class="btn btn-link text-white-50" href="/UserCsList?u_no=${loginVo.u_no }" onclick="showLoginAlert(event)">고객문의</a>
                        <a class="btn btn-link text-white-50" href="/CheckEmailForm" onclick="showLoginAlert(event)">마이 페이지</a>
                        </c:if>
                        <c:if test="${loginVo ne null }">
                          <a class="btn btn-link text-white-50" href="/room" >채팅방</a>
                        <a class="btn btn-link text-white-50" href="/UserCsList?u_no=${loginVo.u_no }" >고객문의</a>
                        <a class="btn btn-link text-white-50" href="/CheckEmailForm" >마이 페이지</a>                        
                        </c:if>
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
                            <a class="btn btn-outline-light btn-social" href="https://twitter.com/?lang=ko"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-outline-light btn-social" href="https://www.facebook.com/?locale=ko_KR"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-light btn-social" href="https://www.youtube.com/"><i class="fab fa-youtube"></i></a>
                            <a class="btn btn-outline-light btn-social" href="/"><i class="fab fa-linkedin-in"></i></a>
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
                                <a href="/">Home</a>
                                <a href="/BoardList?m_no=1">게시판</a>
                                <c:if test="${loginVo eq null }">
                                <a href="/room" onclick="showLoginAlert(event)">채팅방</a>
                                <a href="/UserCsList?u_no=${loginVo.u_no }" onclick="showLoginAlert(event)">고객센터</a>
                                </c:if>
                                <c:if test="${loginVo ne null }">
                                 <a href="/room" >채팅방</a>
                                <a href="/UserCsList?u_no=${loginVo.u_no }" >고객센터</a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


</body>
</html>