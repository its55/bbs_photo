<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/style_main.css">

<title>사진 커뮤니티</title>
<br>
<h1 class="title"><a href="main.jsp">moments</a></h1>
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


	<%
		String userID = null;
		if ((String) session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>
	<br>
	
			<table>
				<td><img alt="main_picture_01" src="images/main_picture_01.jpg" ></td>
				<td><img alt="main_picture_02" src="images/main_picture_02.jpg" ></td>
				<td><img alt="main_picture_03" src="images/main_picture_03.jpg" ></td>
			</table>

</body>
</html>