<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bp.BpDAO"%>
<%@ page import="bp.Bp"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/style_bbs.css">

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
	<br><br><br><br><br>

	<%
		String userID = null;
		if ((String) session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1;
		if(request.getParameter("pageNumber")!= null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>


	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd;">
				<tr>
					<th style="background-color: #eeeeee; text-align: center">번호</th>
					<th style="background-color: #eeeeee; text-align: center">제목</th>
					<th style="background-color: #eeeeee; text-align: center">작성자</th>
					<th style="background-color: #eeeeee; text-align: center">작성일</th>
				</tr>
					<%
						BpDAO bpDAO = new BpDAO();
						ArrayList<Bp> list = bpDAO.getList(pageNumber);
						for(int i=0; i < list.size(); i++){
					%>
						<tr>
							<td><%= list.get(i).getBpID() %></td>
							<td><a href="bp_view.jsp?bpID=<%= list.get(i).getBpID() %>"><%= list.get(i).getBpTitle()%></td>
							<td><%= list.get(i).getUserID()%></td>
							<td><%= list.get(i).getBpDate().substring(0,11) + list.get(i).getBpDate().substring(11,13)+"시" + list.get(i).getBpDate().substring(14,16)+"분"%></td>
						</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<%
				if(pageNumber != 1){
			%>
			<a href="bp.jsp?pageNumber=<%= pageNumber-1 %>" class="btn btn-success btn-arrow-left">이전</a>
			<%
				} if(bpDAO.nextPage(pageNumber+1)){
			%>
			<a href="bp.jsp?pageNumber=<%= pageNumber+1 %>" class="btn btn-success btn-arrow-right">다음</a>
			<%		
				}
			%>
			<a href="bp_write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
</body>
</html>