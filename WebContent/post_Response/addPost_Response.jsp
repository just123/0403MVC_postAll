<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.post_Response.model.*"%>
<%
	Post_ResponseVO post_ResponseVO = (Post_ResponseVO) request.getAttribute("post_ResponseVO");
%>

<html>
<head>
<title>�^�Яd���s�W - addPost_Response.jsp</title>
</head>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>
<div id="popupcalendar" class="text"></div>

<body bgcolor='white'>

	<table border='1' cellpadding='5' cellspacing='0' width='600'>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td>
				<h3>�^�Яd���s�W - addPost_Response.jsp</h3>
			</td>
			<td>
			<a href="<%=request.getContextPath()%>/select_page.jsp">
			<img src="images/tomcat.gif" width="100" height="100" border="1">�^����</a></td>
		</tr>
	</table>

	<h3>�^�Яd�����:</h3>
	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font color='red'>�Эץ��H�U���~:
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li>${message}</li>
				</c:forEach>
			</ul>
		</font>
	</c:if>

	<FORM METHOD="post" ACTION="post_Response.do" name="form1">
		<table border="0">

			<jsp:useBean id="postSvc" scope="page" class="com.post.model.PostService" />
			<tr>
				<td>�|���s��:<font color=red><b>*</b></font></td>
				<td><select size="1" name="mem_Id">
						<c:forEach var="postVO" items="${postSvc.all}">
							<option value="${postVO.mem_Id}">${postVO.mem_Id}
						</c:forEach>
				</select></td>
			</tr>
			<tr>
					<td>�Q�װϤ峹���D:<font color=red><b>*</b></font></td>
					<td><select size="1" name="post_Id">
						<c:forEach var="postVO" items="${postSvc.all}">
							<option value="${postVO.post_Id}" ${(post_ResponseVO.post_Id==postVO.post_Id)? 'selected':'' } >${postVO.post_title}
						</c:forEach>
					</select></td>
				</tr>
			<tr>
				<td>�峹�d�����e:</td>
				<td><textarea rows="10" name="post_Response_content"
						id="content"
						value="<%=(post_ResponseVO == null) ? "" : post_ResponseVO.getPost_Response_content()%>"></textarea></td>
			</tr>

	
				

		</table>
		<%
					java.sql.Date date_SQL = new java.sql.Date(System.currentTimeMillis());
		%>
		<br> <input type="hidden" name="post_time" value="<%=date_SQL%>">
		<br> <input type="hidden" name="post_Response_upDate" value="<%=date_SQL%>">
		<br> <input type="hidden" name="action" value="insert">
		<input type="submit" value="�e�X�s�W">
	</FORM>
</body>

</html>
