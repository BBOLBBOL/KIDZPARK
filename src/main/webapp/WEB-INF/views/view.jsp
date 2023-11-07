<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Select List</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/main.css" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
</head>
<body>
	<div id="main">
		<h2>게시물 내용</h2>
				<c:forEach var="view" items="${boardView}">
			<table>
					<tr>
						<th>제목</th>		
						<td>${view.title}</td>
				    </tr>
				    <tr>
						<th>글쓴이</th>
						<td>${view.writer}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea rows="8" cols="80" name="content" readonly="readonly">${view.content}</textarea></td>
					</tr>	
					<tr>
					    <th>날짜</th>
						<td>${view.regdate}</td>
					</tr>
					<tr>
						<th>조회수</th>
						<td>${view.hit}</td>
	                </tr> 		
			</table>


		<a class="btn btn-danger" href="/Delete?bno=${view.bno}">삭제</a>
		<a class="btn btn-danger" href="/UpdateForm?bno=${view.bno}">수정</a>
				</c:forEach>


        <br>
		<a class="btn btn-dark" href="/">Home</a>


	</div>
</body>
</html>