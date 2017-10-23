<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>新規投稿</title>
	<link href="./css/newPost.css" rel="stylesheet" type="text/css">
</head>
<body><center>
<div class="main-contents"><center>

	<div class="header">
		<center><a href="./">ホームへ戻る</a></center><br />
		<c:if test="${ not empty loginUser }">
			<div class="profile">
				<div class="name"><b><c:out value="${loginUser.name}" /></b> としてログイン中</div>
			</div>
		</c:if>
	</div>

	<div class="form-area">
		<center><font size="5"><b>新規投稿</b></font></center>
		<c:if test="${ not empty errorMessages }">
			<div class="errorMessages">
				<ul>
					<c:forEach items="${errorMessages}" var="message">
						<li><c:out value="${message}" />
					</c:forEach>
				</ul>
			</div>
			<c:remove var="errorMessages" scope="request"/>
		</c:if>

			<form action="newPost" method="post"><br><br>
				件名 *30文字まで<br>
				<input name="title" value="${message.title}" size="57"/><br />
				カテゴリー *10文字まで<br>
				<input name="category" value="${message.category}"/><br />
				本文 *1000文字まで<br>
				<textarea name="text" cols="60" rows="5" class="tweet-box">${message.text}</textarea>
				<br />
				<input type="submit" value="投稿する">
			</form>
	</div>
</center>
</div>
</center>
</body>
</html>
