<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.post.model.*"%>
<%@ page import="com.post.controller.*" %>>
<%
	PostVO postVO = (PostVO) request.getAttribute("postVO");
%>

<jsp:useBean id="postSvc" scope="page" class="com.post.model.PostService" />


<html>
<head>
<title>�Q�װϷs�W�峹 - addPost.jsp</title>
</head>
<style>
.content{
	width: 300px;
}
</style>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>
<div id="popupcalendar" class="text"></div>

<body bgcolor='white'>

	<table border='1' cellpadding='5' cellspacing='0' width='600'>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td>
				<h3>�Q�װϷs�W�峹 - addPost.jsp</h3>
			</td>
			<td>
			<a href="<%=request.getContextPath()%>/select_page.jsp">
			<img src="images/tomcat.gif" width="100" height="100" border="1">�^����</a></td>
		</tr>
	</table>

	<h3>�s�W�峹���:</h3>
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

	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/post/post.do" name="form1">
		<table border="0">
			<tr>
				<td>�|���s��:<font color=red><b>*</b></font></td>
				<td><select size="1" name="mem_Id">
						<c:forEach var="postVO" items="${postSvc.all}">
							<option value="${postVO.mem_Id}">${postVO.mem_Id}
						</c:forEach>
				</select></td>
			</tr>
			<tr>
			<td>�峹����:<font color=red><b>*</b></font></td>
				<td><select size="1" name="post_class_Id$post_class">
						    <option value="1-�ۤ�" ${(param.post_class_Id$post_class=='1-�ۤ�')? 'selected':'' }>�ۤ�
							<option value="2-�а�" ${(param.post_class_Id$post_class=='2-�а�')? 'selected':'' }>�а�
							<option value="3-��T" ${(param.post_class_Id$post_class=='3-��T')? 'selected':'' }>��T
							<option value="4-����" ${(param.post_class_Id$post_class=='4-����')? 'selected':'' }>����
							<option value="5-�{�i" ${(param.post_class_Id$post_class=='5-�{�i')? 'selected':'' }>�{�i
							<option value="6-��M" ${(param.post_class_Id$post_class=='6-��M')? 'selected':'' }>��M
							<option value="7-����" ${(param.post_class_Id$post_class=='7-����')? 'selected':'' }>����
							<option value="8-�߱o" ${(param.post_class_Id$post_class=='8-�߱o')? 'selected':'' }>�߱o
				</select></td>
			</tr>
			
			<tr>
				<td>�峹���D:</td>
				<td>
					<input type="TEXT" name="post_title" size="45" 
					onfocus="if(value =='�п�J���D'){value=''}"
					onblur="if(value ==''){value='�п�J���D'}"
					value="<%=(postVO == null) ? "�п�J���D" : postVO.getPost_title() %>" />
				</td>
			</tr>
			
			<tr>
				<td>�峹���e</td>
				<td><textarea rows="10" name="post_content" class="content"
						value="<%=(postVO == null) ? "" : postVO.getPost_content()%>"></textarea></td>
			</tr>

			<tr>
				<%
					java.sql.Date date_SQL = new java.sql.Date(System.currentTimeMillis());
				%>
				<td>�o���ɶ�:</td>
				<td><input class="cal-TextBox"
					onFocus="this.blur()" size="9" readonly type="text"
					name="post_time"
					value="<%= (postVO == null) ? date_SQL : postVO.getPost_time()%>">
					<a class="so-BtnLink" href="javascript:calClick();return false;"
					onmouseover="calSwapImg('BTN_date', 'img_Date_OVER',true);"
					onmouseout="calSwapImg('BTN_date', 'img_Date_UP',true);"
					onclick="calSwapImg('BTN_date', 'img_Date_DOWN');showCalendar('form1','post_time','BTN_date');return false;">
				</a></td>
			</tr>
			<tr>
				<%
					java.sql.Date date_SQL1 = new java.sql.Date(System.currentTimeMillis());
				%>
				<td style="display:none">�ק�ɶ�:</td>
				<td>
		          <input class="cal-TextBox"
			      onFocus="this.blur()" size="9" readonly type="hidden" name="post_upDate" value="<%= (postVO==null)? date_SQL1 :  postVO.getPost_upDate()%>">
			      <a class="so-BtnLink"
			      href="javascript:calClick();return false;"
			      onmouseover="calSwapImg('BTN_date1', 'img_Date_OVER',true);"
			      onmouseout="calSwapImg('BTN_date1', 'img_Date_UP',true);"
			      onclick="calSwapImg('BTN_date1', 'img_Date_DOWN');showCalendar('form1','post_upDate','BTN_date');return false;">
		       </a>
		        </td>
			</tr>
			
			<tr>
				<td>�^�мƶq:</td>
				<td><input type="TEXT" name="post_resNum" size="4"
					value="<%=(postVO == null) ? "1" : postVO.getPost_resNum()%>" /></td>
			</tr>
			
		</table>
		<br> <input type="hidden" name="action" value="insert">
		<input type="submit" value="�e�X�s�W">
	</FORM>
</body>

</html>
