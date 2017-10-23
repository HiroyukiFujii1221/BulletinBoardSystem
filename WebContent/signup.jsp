<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>ユーザー登録</title>
	<link href="./css/signup.css" rel="stylesheet" type="text/css">
</head>
<body>
<center>
<div class="header">
<a href="./user-information">戻る</a>
</div>
<div class="signup-main-contents">
	<div class="signup-form-area">
		<center><font size="5"><b>新規登録</b></font></center><br>
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
		<form action="signup" method="post"><br />
			<label for="name" >名前 *10文字以内</label><br>
			<input name="name" size="18" value ="${user.name}"/><br>

			<label for="login_id">ログインID *半角英数字6文字以上20文字以内</label><br>
			<input name="login_id" size="40" value ="${user.login_id}"/><br>

			<label for="password1">パスワード *記号を含む半角文字6文字以上20文字以内</label><br>
			<input name="password1" size="40"/> <br>

			<label for="password1">パスワード（確認用）</label><br>
			<input name="password2" size="40"/><br>

			<label for="branch_id">支店<br></label>
				<select name="branch_id">
					<c:forEach items="${branchNames}" var="name">
						<option value="${name.branch_id}" <c:if test="${user.branch_id == name.branch_id}"> selected</c:if>>
							${name.branchName}
						</option>
					</c:forEach>
				</select><br>

			<label for="department_id">部署・役職名</label><br>
				<select name="department_id">
				 	<c:forEach items="${departmentNames}" var="name">
						<option value="${name.department_id}"
							<c:if test="${user.department_id == name.department_id}"> selected</c:if>>
								${name.departmentName}
						</option>
					</c:forEach>
				 </select><br><br>
			<input type="submit" value="登録" /> <br>
		</form>
	</div>
</div>
</center>

</body>
</html>
