<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>掲示板</title>
	<link href="./css/style.css" rel="stylesheet" type="text/css">
</head>
<body><center>
	<div class="main-contents">
		<div class="header"><center>
			<c:if test="${ empty loginUser }">
				<a href="login">ログイン</a>
			</c:if>
			<c:if test="${ loginUser.department_id == 1}">
				<a href="user-information">ユーザー管理</a>
			</c:if>
			<c:if test="${ not empty loginUser }">
				<a href="newPost">新規投稿</a>
				<a href="logout">ログアウト</a>
			</c:if>
			<p><b>${loginUser.name}</b> でログイン中</p>
			</center>
		</div>

		<script>
		    function submitChk () {
		        var flag = confirm ( "削除してよろしいですか？");
		        return flag;
		    }
		</script>
			<div  class="errorMessages">
				<c:if test="${ not empty errorMessages }">
					<ul>
						<c:forEach items="${errorMessages}" var="message">
							<c:out value="${message}" />
						</c:forEach>
					</ul>
				<c:remove var="errorMessages" scope="session"/>
				</c:if>
			</div>
		<c:if test="${ not empty noMessages }">
			<div class="noMessages">
				<c:out value="${noMessages}" />
			</div>
			<c:remove var="noMessages" scope="request"/>
		</c:if>

			<div class="form-area">
				<form action="./" method="get">
					<center><b>投稿の絞り込み</b></center><br><br>
					時期：<input type="date" name="startDate" value="${startDate}">から
						  <input type="date" name="endDate" value="${endDate}">まで<br><br>

					カテゴリー：<input name="category" list="keywords" ><br />
					<datalist id="keywords">
						<c:forEach items="${categoryNames}" var="category">
							<option value="${category}">
			     		</c:forEach>
			     	</datalist><br>

					<input id="submit_button" type="submit" value="絞り込み">
				</form><br>
				<form action="./" method="get">
					<input type="hidden" name="category"  >
					<input type="hidden" name="startDate" >
					<input type="hidden" name="endDate" >
					<input type="submit" class="reset-button" value="リセット">
		 		</form>
			</div>
			<c:forEach items="${messages}" var="message">
				<div class="post"><center><b>投稿</b></center><br>
					<div class="title">
						<span class="title"><b>件名：<c:out value="${message.title}" /></b><br></span>
					</div>
					<div class="category">
						<span class="category"><b>カテゴリー：</b><c:out value="${message.category}" /></span><br><br>
					</div>
					<div class="text">
						<span class="text">
							<c:forEach items="${fn:split(message.text,'
							')}" var="text">
								<c:out value="${text}" ></c:out><br />
							</c:forEach>
						</span>
					</div>
					<div class="name">
						<form action="ajax" method="get">
							<span class="name">投稿者：<b><c:out value="${message.name}" /></b>
							</span>
						</form>
					</div>
					<div class="date"><fmt:formatDate value="${message.created_at}" pattern="yyyy/MM/dd HH:mm" />
					</div>
					<form action="deletePost" method="post" onsubmit="return submitChk()">
						<input type="hidden" value="${message.id}" name="id"/>
						<c:if test="${loginUser.id == message.user_id || loginUser.department_id == 2}">
							<input type="submit" value="削除"/>
						</c:if>
						<c:if test="${loginUser.branch_id == message.branch_id && loginUser.department_id == 3
							&& message.department_id == 4}">
							<input type="submit" value="削除"/>
						</c:if>
					</form><br />
				</div>

				<c:forEach items="${comments}" var="comment">
					<c:if test="${comment.post_id == message.id}">
						<div class="comment">
							<div class="text">
								<center><b>コメント</b></center><br>
								<span class="text">
									<c:forEach items="${fn:split(comment.text,'
									')}" var="splittedText">
										<c:out value="${splittedText}" ></c:out><br>
									</c:forEach>
								</span>
								<br>
							</div>
							<div class="name">
								<span class="name"><b><c:out value="${comment.name}" /></b></span>
							</div>
							<div class="date"><fmt:formatDate value="${comment.created_at}" pattern="yyyy/MM/dd HH:mm" />
							</div>
							<form action="deleteComment" method="post" onsubmit="return submitChk()">
								<input type="hidden" value="${comment.id}" name="id"/>
								<input type="hidden" value="${comment.post_id}" name="post_id">
								<c:if test="${loginUser.id == comment.user_id || loginUser.department_id == 2}">
									<input type="submit" value="削除"/><br><br>
								</c:if>
								<c:if test="${loginUser.branch_id == comment.branch_id && loginUser.department_id == 3
									&& comment.department_id == 4}">
									<input type="submit" value="削除" /><br><br>
								</c:if>
							</form>
						</div>
					</c:if>
				</c:forEach>
				<form action="newComment" method="post">
					<textarea name="comment" cols="80" rows="5" class="comment-box">${comment.text}</textarea>
					<input type="hidden"value="${message.id}" name="post_id"><br/>
					<input type="submit" value="コメント" />*500文字以内
				</form><br />
			</c:forEach>
		</div>
	</div>
	</center>
</body>
</html>
