<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/style_login.css">

<title>사진 커뮤니티</title>
<br>
<h1 class="title"><a href="login.jsp">login</a></h1>
<br>
<div class="dropdown">
  <button class="dropbtn"><h2>  menu</h2></button>
  <div class="dropdown-content">
  			<a href="main.jsp">메인</a>
			<a href="join.jsp">회원가입</a>
			<a href="bp_bbs.jsp">사진</a>
			<a href="bbs.jsp">자유게시판</a>
			<a href="login.jsp">로그인</a>
			<a href="logoutAction.jsp">로그아웃</a>
		</div>
	</div>
</head>
<body>
	<br><br><br><br><br>
	<div class=login_form>
	<form action="loginAction.jsp" method="post">

		아이디 : <input type="text" name="userID" size="20"><br>
		비밀번호 : <input type="password" name="userPassword" size="20"><br>
		
		<input type="submit" value="로그인">
	</form>	
	</div>

</body>
</html>