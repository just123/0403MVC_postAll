<%@ page contentType="text/html; charset=Big5"%>
<%@ page import="com.post_Response.model.*"%>
<%@ page import="com.post.model.*"%>>
<%-- �����m�߱ĥ� Script ���g�k���� --%>

<%-- //Post_ResponseServlet.java(Concroller)�w�s�Jrequest��EmpVO����--%>
<%	
Post_ResponseVO post_ResponseVO = (Post_ResponseVO) request.getAttribute("post_ResponseVO");
%>

<%-- ���X ������PostVO����--%>
<%
  PostService postSvc = new PostService();
  PostVO postVO = postSvc.getOnePost(post_ResponseVO.getPost_Id());
%>
<html>
<head>
<title>�d����� - listOnePost_Response.jsp</title>
</head>
<body bgcolor='white'>

	<table border='1' cellpadding='5' cellspacing='0' width='800'>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td>
				<h3>�d����� - listOnePost_Response.jsp</h3>
				<a href="<%=request.getContextPath()%>/select_page.jsp">
				<img src="images/back1.gif" width="100" height="32" border="0">�^����</a>
			</td>
		</tr>
	</table>

	<table border='1' bordercolor='#CCCCFF' width='800' height='30'>
		<tr>
			<th>�d��(�^��)�s��</th>
			<th>�|���s��(�o���)</th>
			<th>�峹�s��</th>
			<th>�峹�d�����e</th>
			<th>�o�G�ɶ�</th>
			<th>�ק�ɶ�</th>
		</tr>
		<tr align='center' valign='middle'>
			<td><%=post_ResponseVO.getRes_Id()%></td>
			<td><%=post_ResponseVO.getMem_Id()%></td>
			<td><%=post_ResponseVO.getPost_Id()%></td>
			<td><%=post_ResponseVO.getPost_Response_content()%></td>
			<td><%=post_ResponseVO.getPost_time()%></td>
			<td><%=post_ResponseVO.getPost_Response_upDate()%></td>

		</tr>
	</table>

</body>
</html>
