<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.offiMsg.model.*"%>
<%
OffiMsgVO offiMsgVO = (OffiMsgVO) request.getAttribute("OffiMsgVO"); //OffiMsgServlet.java (Concroller), �s�Jreq��OffiMsgVO���� (�]�A�������X��OffiMsgVO, �]�]�A��J��ƿ��~�ɪ�OffiMsgVO����)
%>
<html>
<head>
<title>�T����ƭק� - update_offiMsg_input.jsp</title></head>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>
<div id="popupcalendar" class="text"></div>

<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�T����ƭק� - update_offiMsg_input.jsp</h3>
		<a href="<%=request.getContextPath()%>/select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></td>
	</tr>
</table>

<h3>�T����ƭק�:</h3>
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

<FORM METHOD="post" ACTION="emp.do" name="form1">
<table border="0">
	<tr>
		<td>�T���s��:<font color=red><b>*</b></font></td>
		<td><%=offiMsgVO.getOffiMsg_Id()%></td>
	</tr>
	<tr>
		<td>�o�����u�s��:<font color=red><b>*</b></font></td>
		<td><%=offiMsgVO.getOffiMsg_empId()%></td>
	</tr>
	<tr>
		<td>�T�����D:</td>
		<td><input type="TEXT" name="offiMsg_Title" size="45"	value="<%=offiMsgVO.getOffiMsg_Title()%>" /></td>
	</tr>
	
	<tr>
		<td>�T�����e:</td>
		<td><input type="TEXT" name="offiMsg_Content" size="45"	value="<%=offiMsgVO.getOffiMsg_Content()%>" /></td>
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
<input type="hidden" name="action" value="update">
<input type="hidden" name="offiMsg_Id" value="<%=offiMsgVO.getOffiMsg_Id()%>">
<input type="hidden" name="requestURL" value="<%=request.getParameter("requestURL")%>"><!--������e�X�ק諸�ӷ��������|��,�A�e��Controller�ǳ���椧��-->
<input type="hidden" name="whichPage" value="<%=request.getParameter("whichPage")%>">  <!--�u�Ω�:istAllEmp.jsp-->
<input type="submit" value="�e�X�ק�"></FORM>

<br>�e�X�ק諸�ӷ��������|:<br><b>
   <font color=blue>request.getParameter("requestURL"):</font> <%= request.getParameter("requestURL")%><br>
   <font color=blue>request.getParameter("whichPage"):</font> <%= request.getParameter("whichPage")%> (���d�ҥثe�u�Ω�:istAllEmp.jsp))</b>
</body>
</html>
