listAllPost.jsp<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%--  - ${postVO.post_resNum} --%>

<%-- �����m�߱ĥ� EL ���g�k���� --%>

<jsp:useBean id="listPost_Responses_ByPost_Id" scope="request" type="java.util.Set" />
<jsp:useBean id="postSvc" scope="page" class="com.post.model.PostService" />
<html>
<head>
<title>�峹�^�Яd�� - listPost_Responses_ByPost_Id.jsp</title>
</head>
<body bgcolor='white'>

<b><font color=red>�����m�߱ĥ� EL ���g�k����:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='1200'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�峹�^�Яd�� - listPost_Responses_ByPost_Id.jsp</h3>
		<a href="<%=request.getContextPath()%>/select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a>
		</td>
	</tr>
</table>

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

<table border='1' bordercolor='#CCCCFF' width='1200'>
	<tr>
		<th>�d��(�^��)�s��</th>
		<th>�|���s��(�o���)</th>
		<th>�峹�s��</th>
		<th>�峹�d�����e</th>
		<th>�o�G�ɶ�</th>
		<th>�ק�ɶ�</th>
		<th>�峹�s�� �i�峹���D�j</th>
		<th>�ק�</th>
		<th>�R��</th>
	</tr>
	
	<c:forEach var="post_ResponseVO" items="${listPost_Responses_ByPost_Id}" >
		<tr align='center' valign='middle' ${(post_ResponseVO.res_Id==param.res_Id) ? 'bgcolor=#CCCCFF':''}><!--�N�ק諸���@���[�J����Ӥw-->
			<td>${post_ResponseVO.res_Id}</td>
			<td>${post_ResponseVO.mem_Id}</td>
			<td>${post_ResponseVO.post_Id}</td>
			<td>${post_ResponseVO.post_Response_content}</td>
			<td>${post_ResponseVO.post_time}</td>
			<td>${post_ResponseVO.post_Response_upDate}</td>	
			<td>
			<c:forEach var="postVO" items="${postSvc.all}">
                    <c:if test="${post_ResponseVO.post_Id==postVO.post_Id}">
	                    ${postVO.post_Id}�i<font color=orange>${postVO.post_title}</font>�j
                    </c:if>
                </c:forEach>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/post_Response/post_Response.do">
			    <input type="submit" value="�ק�"> 
			    <input type="hidden" name="res_Id"value="${post_ResponseVO.res_Id}">
			    <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
			    <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/post_Response/post_Response.do">
			    <input type="submit" value="�R��">
			    <input type="hidden" name="res_Id" value="${post_ResponseVO.res_Id}">
			    <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
			    <input type="hidden" name="action"value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>

<br>�����������|:<br><b>
   <font color=blue>request.getServletPath():</font> <%= request.getServletPath()%><br>
   <font color=blue>request.getRequestURI(): </font> <%= request.getRequestURI()%> </b>
</body>
</html>
