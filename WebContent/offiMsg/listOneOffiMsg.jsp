<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.offiMsg.model.*"%>

<%-- �����m�߱ĥ� Script ���g�k���� --%>

<%-- ���X Concroller EmpServlet.java�w�s�Jrequest��EmpVO����--%>
<%OffiMsgVO offiMsgVO = (OffiMsgVO) request.getAttribute("OffiMsgVO");%>

<html>
<head>
<title>�T����� - listOneOffiMsg.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>�����m�߱ĥ� Script ���g�k����:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�T����� - ListOneOffiMsg.jsp</h3>
		<a href="<%=request.getContextPath()%>/select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a>
		</td>
	</tr>
</table>

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>�T���s��</th>
		<th>�o�����u</th>
		<th>�T�����D</th>
		<th>�T�����e</th>
		<th>�T���ɶ�</th>
	</tr>
	<tr align='center' valign='middle'>
	
		<td><%=offiMsgVO.getOffiMsg_Id()%></td>
		<td><%=offiMsgVO.getOffiMsg_empId()%></td>
		<td><%=offiMsgVO.getOffiMsg_Title()%></td>
		<td><%=offiMsgVO.getOffiMsg_Content()%></td>
		<td><%=offiMsgVO.getOffiMsg_Date()%></td>
	</tr>
</table>

</body>
</html>
