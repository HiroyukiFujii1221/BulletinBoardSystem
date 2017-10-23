<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>ユーザー管理</title>
	<link href="./css/user-information.css" rel="stylesheet" type="text/css">
</head>
<body><center>
<div class="main-contents">

	<div class="header">
		<c:if test="${ empty loginUser }">
			<a href="login">ログイン</a>
			<a href="signup">登録する</a>
		</c:if>
		<c:if test="${ not empty loginUser }">
			<a href="./">ホーム</a>
			<a href="signup">新規登録</a>
			<a href="logout">ログアウト</a><br /><br /><br /><br />
		</c:if>
		<font size="5"><b>ユーザー管理</b></font><br><br>
	</div>
	<c:if test="${ not empty errorMessages }">
		<div class="errorMessages">
			<ul>
				<c:forEach items="${errorMessages}" var="message">
					<c:out value="${message}" />
				</c:forEach>
			</ul>
		</div>
		<c:remove var="errorMessages" scope="session"/>
	</c:if>
	<script>
			function submitChkStop () {
			var flag = confirm ( "停止させてよろしいですか？\n\n停止させない場合は[キャンセル]ボタンを押して下さい");
			return flag;
			}
		</script>
		<script>
			function submitChkUnStop () {
			var flag = confirm ( "復活させてよろしいですか？\n\n復活させない場合は[キャンセル]ボタンを押して下さい");
			return flag;
			}
	</script>

	<table border="1">
		<tr>
			<th scope="col">ユーザー</th>
			<th scope="col">ログインID</th>
			<th scope="col">支店</th>
			<th scope="col">部署・役職</th>
			<th scope="col">停止・復活</th>
			<th scope="col">編集</th>
		</tr>
			<c:forEach items="${usersInformation}" var="userInformation">
			<tr>
				<th scope="row"><c:out value="${userInformation.name}" /></th>
				<td><c:out value="${userInformation.login_id}" /></td>
				<td><c:out value="${userInformation.branchName}" /></td>
				<td><c:out value="${userInformation.departmentName}" /></td>
				<td>
					<c:if test="${userInformation.id == loginUser.id}">
					ログイン中
					</c:if>
					<c:if test="${userInformation.id != loginUser.id}">
					<c:if test="${userInformation.is_Working == 1}">
						<form action="user-information"method ="post" onsubmit="return submitChkStop()">
							<input type="hidden" name="user_id" value="${userInformation.id}"/>
							<input type="hidden" name="is_Working" value="0"/>
							<input type="submit" value="停止">
						</form>
					</c:if>
					<c:if test="${userInformation.is_Working == 0}">
						<form action="user-information"method ="post" onsubmit="return submitChkUnStop()">
							<input type="hidden" name="user_id" value="${userInformation.id}">
							<input type="hidden" name="is_Working" value="1"/>
							<input type="submit" value="復活">
						</form>
					</c:if>
					</c:if>
				</td>
				<td>
					<form action="settings" method="get">
						<input type="hidden" name="id" value="${userInformation.id}">
						<input type="submit" value="編集">
					</form>
				</td>
			</tr>
			</c:forEach>
	</table>
</div>
</center></body>
</html>
