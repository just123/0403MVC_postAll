<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.offiMsg.model.*"%>
<%
OffiMsgVO offiMsgVO = (OffiMsgVO) request.getAttribute("OffiMsgVO");
%>

<html>
<head>
<title>�T���s�W - addOffiMsg.jsp</title></head>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>
<div id="popupcalendar" class="text"></div>

<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�T���s�W - addOffiMsg.jsp</h3>
		</td>
		<td>
		   <a href="<%=request.getContextPath()%>/select_page.jsp"><img src="images/tomcat.gif" width="100" height="100" border="1">�^����</a>
	    </td>
	</tr>
</table>

<h3>�T�����:</h3>
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

<FORM METHOD="post" ACTION="offiMsg.do" name="form1">
<table border="0">

	<tr>
		<td>�o�����u�s��:</td>
		<td><input type="TEXT" name="offiMsg_empId" size="45" 
			value="<%= (offiMsgVO==null)? "�d�ç�" : offiMsgVO.getOffiMsg_empId()%>" /></td>
	</tr>
	<tr>
		<td>�T�����D:</td>
		<td>
			<input type="TEXT" name="offiMsg_Title" size="45" 
			onfocus="if(value =='�п�J�T�����D'){value=''}"
			onblur="if(value ==''){value='�п�J�T�����D'}"
			value="<%=(offiMsgVO == null) ? "�п�J�T�����D" : offiMsgVO.getOffiMsg_Title() %>" />
		</td>
	</tr>
	<tr>
		<td>�峹���e</td>
		<td><textarea rows="10" name="offiMsg_Content" class="content"
			value="<%=(offiMsgVO == null) ? "" : offiMsgVO.getOffiMsg_Content()%>"></textarea></td>
	</tr>
	<tr>
		<%
		java.sql.Date date_SQL = new java.sql.Date(System.currentTimeMillis());
		%>
		<td>�T���o���ɶ�:</td>
		<td><input class="cal-TextBox"
			onFocus="this.blur()" size="9" readonly type="text"
			name="offiMsg_Date"
			value="<%= (offiMsgVO == null) ? date_SQL : offiMsgVO.getOffiMsg_Date()%>">
			<a class="so-BtnLink" href="javascript:calClick();return false;"
			onmouseover="calSwapImg('BTN_date', 'img_Date_OVER',true);"
			onmouseout="calSwapImg('BTN_date', 'img_Date_UP',true);"
			onclick="calSwapImg('BTN_date', 'img_Date_DOWN');showCalendar('form1','offiMsg_Date','BTN_date');return false;">
			</a></td>
	</tr>
	

</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="�e�X�s�W"></FORM>
</body>

</html>
