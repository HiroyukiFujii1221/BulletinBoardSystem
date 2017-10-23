<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>ユーザー情報編集</title>
	<link href="./css/settings.css" rel="stylesheet" type="text/css">
</head>
<body><center>

	<div class="main-contents">
		<div class="header">
			<a href="user-information">戻る</a>
			<a href="./">ホーム</a><br>
		</div>
		<div class="form-area">
			<center><font size="5"><b>ユーザー情報の編集</b></font></center><br>
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

			<form action="settings" method="post" enctype="multipart/form-data"><br>
				<label for="name">名前 *10文字以内<br></label>
				<input name="name" size="18" value="${editUser.name}" id="name"/><br>
				<label for="login_id">ログインID *半角英数字6文字以上20文字以内<br></label>
				<input name="login_id"  size="40" value="${editUser.login_id}"id="login_id"/><br>

				<label for="password1">パスワード *記号を含む半角文字6文字以上20文字以内<br></label>
				<input name="newPassword1" size="40" id="password1"/><br>
				<label for="password2">パスワード（確認用）<br></label>
				<input name="newPassword2" size="40" id="password2"/><br>


				<c:if test="${editUser.id != loginUser.id}">
				<label for="branch_id">支店<br></label>
				<select name="branch_id">
					<c:forEach items="${branchNames}" var="name">
						<option value="${name.branch_id}" <c:if test="${editUser.branch_id == name.branch_id}"> selected</c:if>>
							${name.branchName}
						</option>
					</c:forEach>
				</select><br>

				<label for="department_id">部署・役職<br></label>
				 <select name="department_id">
				 	<c:forEach items="${departmentNames}" var="name">
						<option value="${name.department_id}"
							<c:if test="${editUser.department_id == name.department_id}"> selected</c:if>>
								${name.departmentName}
						</option>
					</c:forEach>
				 </select><br><br>
				 </c:if>
				 <c:if test="${editUser.id == loginUser.id}">
				 	<input type="hidden" name="branch_id" value="${editUser.branch_id}" />
				 	<input type="hidden" name="department_id" value="${editUser.department_id}" />
				 </c:if>

				<input type="hidden" name="id" value="${editUser.id}">

				<input type="submit" value="変更する" /><br>
			</form>
		</div>
	</div>
</center></body>
</html>
