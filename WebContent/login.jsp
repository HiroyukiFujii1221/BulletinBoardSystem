<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>ログイン</title>
	<link href="./css/login.css" rel="stylesheet" type="text/css">
</head>
<body>
<center>
<div class="main-contents">
	<div class="form-area">
		<c:if test="${ not empty errorMessages }">
		<div class="errorMessages">
			<ul>
				<c:forEach items="${errorMessages}" var="message">
					<li><c:out value="${message}" />
				</c:forEach>
			</ul>
		</div>
		<c:remove var="errorMessages" scope="session"/>
		</c:if>
		<div class="centering">
		<form action="login" method="post"><br>
			<label for="login_id">ログインID<br></label>
			<input name="login_id" value ="${login_id}" size="25" id="login_id"/> <br>
			<label for="password">パスワード<br></label>
			<input name="password" type="password" size="25" id="password"/><br><br>
			<input type="submit" value="ログイン" /> <br>
		</form>
		</div>
	</div>
</div></center>
</body>
</html>
