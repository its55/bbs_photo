<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bp.Bp"%>
<%@ page import="bp.BpDAO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/style_bf_view.css">

<title>사진 커뮤니티</title>
<br>
<h1 class="title"><a href="main.jsp">moments</a></h1>
<br>
<div class="dropdown">
  <button class="dropbtn"><h2> menu</h2></button>
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
		int bpID = 0;
		if (request.getParameter("bpID") != null) {
			bpID = Integer.parseInt(request.getParameter("bpID"));
		}
		if (bpID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href='bp_bbs.jsp'");
			script.println("</script>");
		}
		Bp bp = new BpDAO().getBp(bpID);
	%>
	<br><br><br><br><br>



	<div class="container">

			<table class="table_table-striped"
				style="text-align: center; border: 1px solid #dddddd;">
				<tr>
					<td colspan="3"
						style="background-color: #eeeeee; text-align: center">게시판 글보기
					</td>
				</tr>
				<tr>
					<td style="width: 20%;">글 제목</td>
					<td colspan="2"><%=bp.getBpTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></td>
				</tr>
				<tr>
					<td style="width: 20%;">작성자</td>
					<td colspan="2"><%=bp.getUserID()%></td>
				</tr>
				<tr>
					<td style="width: 20%;">작성일자</td>
					<td colspan="2"><%=bp.getBpDate().substring(0, 11) + bp.getBpDate().substring(11, 13) + "시"
					+ bp.getBpDate().substring(14, 16) + "분"%></td>
				</tr>
				<tr>
					<td style="width: 20%;">내용</td>
					<td colspan="2" style="min-height: 200px; text-align: left;">
					<%=
					bp.getBpContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") 
					%></td>
				</tr>
			</table>
			<a href="bp.jsp" class="btn btn-primary">목록</a>
			<%
				if(userID != null && userID.equals(bp.getUserID())){
			%>
				<a href="bp_update.jsp?bpID=<%= bpID %>" class="btn btn-primary">수정</a>
				<a onclick="return confirm('정말로 삭제하시겠습니까?')"  href="bp_deleteAction.jsp?bpID=<%= bpID %>" class="btn btn-primary">삭제</a>
			
			<%
				}
			%>
		</div>

</body>
</html>