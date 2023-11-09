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
<h2>게시물 쓰기</h2>
<div style="margin-bottom: 20px;">
<button class="btn btn-dark" style="float: right; margin-bottom: 20px;" id="btnWrite">새 글 쓰기</button>
</div>
<form action="/Write" method="POST">
<table>
<tr>
<th>제목</th>
<td><input type="text" name="title"/></td>
</tr>
<tr>
<th>글쓴이</th>
<td><input type="text" name="writer"/></td>
</tr>
<tr>
<th>내용</th>
<td><textarea rows="8" cols="80" name="content"></textarea></td>
</tr>
<tr>
<td colspan="2">
   <input type="submit" value="등록" class="btn btn-dark"/>
</td>
</tr>
</table>

</form>

<a class="btn btn-dark" href="/">Home</a>


</div>
</body>
</html>