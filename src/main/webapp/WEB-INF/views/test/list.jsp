<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Select List</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link rel="stylesheet" href="/css/main.css"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</head>
<body>
<div id="main">
<h2>게시물 목록</h2>
<button class="btn btn-dark" style="float: right; margin-bottom: 20px;" id="btnWrite">새 글 쓰기</button>

<table class="table table-dark table-hover">
  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">제목</th>
      <th scope="col">글쓴이</th>
      <th scope="col">날짜</th>
      <th scope="col">조회수</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="board" items="${boardList}">
    <tr>
      <td><a href="/View?bno=${board.bno}">${board.bno}</a></td>
      <td><a href="/View?bno=${board.bno}">${board.title}</a></td>
      <td><a href="/View?bno=${board.bno}">${board.writer}</a></td>
      <td><a href="/View?bno=${board.bno}">${board.regdate}</a></td>
      <td><a href="/View?bno=${board.bno}">${board.hit}</a></td>
    </tr>
    </c:forEach>
  </tbody>
  
  
</table>
   <a class="btn btn-dark" href="/">Home</a>
<script>
const btnWriteEl = document.querySelector('#btnWrite');
      btnWriteEl.addEventListener('click', function(){
    	  location.href = '/WriteForm'
    	  
      })



</script>

</div>
</body>
</html>