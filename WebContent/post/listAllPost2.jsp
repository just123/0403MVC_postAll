<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.post_Response.model.*"%>
<%@ page import="com.post.model.*"%>
<%@ page import="com.post.controller.*" %>
<%-- �����m�߱ĥ� EL ���g�k���� --%>
<!-- �Q��list���X�x����� item���� -->
<%  
PostService postSvc = new PostService();
List<PostVO> list = postSvc.getAll();
pageContext.setAttribute("list",list);
%>
<%-- <jsp:useBean id="postSvc" scope="page" class="com.post.model.PostService" /> --%>

<html>
<head>
<title>�Ҧ��Q�װϤ峹 - listAllPost.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>�����m�߱ĥ� EL ���g�k����:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='1200'>
	<tr bgcolor='orange' align='center' valign='middle' height='20'>
		<td>
		<h3>�Ҧ��Q�װϤ峹 - listAllPost.jsp</h3>
		<a href="<%=request.getContextPath()%>/select_page.jsp">
		<img src="images/back1.gif" width="100" height="32" border="0">�^����</a>
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

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>�峹�s��</th>
		<th>�|���s��</th>
		<th>�峹����</th>
		<th>�峹�����s��</th>
		<th>�峹���D</th>
		<th>�峹���e</th>
		<th>�o�G�ɶ�</th>
		<th>�ק�ɶ�</th>
		<th>�^�мƶq</th>
		<th>�ק�</th>
		<th>�R��<font color=red>(���p���ջP���-�p��)</font></th>
		<th>�d�߯d��</th>
	</tr>
	
	<%@ include file="page/page1.file" %> 
	<c:forEach var="postVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr align='center' valign='middle' ${(postVO.post_Id==param.post_Id) ? 'bgcolor=#CCCCFF':''}><!--�N�ק諸���@���[�J����Ӥw-->
		<td>${postVO.post_Id}</td>
		<td>${postVO.mem_Id}</td>
		<td>${postVO.post_class}</td>
		<td>${postVO.post_class_Id}</td>
		<td>${postVO.post_title}</td>
		<td>${postVO.post_content}</td>
		<td>${postVO.post_time}</td>
		<td>${postVO.post_upDate}</td>
		<td>${postVO.post_resNum}</td>
					
<%-- 		<td><c:forEach var="postVO" items="${postSvc.all}"> --%>
<%--             <c:if test="${post_ResponseVO.post_Id==postVO.post_Id}"> --%>
<%-- 	            ${postVO.post_Id}�i${postVO.post_title}�j --%>
<%--            	</c:if> --%>
<%--             </c:forEach> --%>
<!-- 		</td> -->
		<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/post/post.do">
			     <input type="submit" value="�ק�"> 
			     <input type="hidden" name="post_Id" value="${postVO.post_Id}">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
			    <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--�e�X��e�O�ĴX����Controller-->
			    <input type="hidden" name="action"	value="getOne_For_Update">
			</td></FORM>
		<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/post/post.do">
			    <input type="submit" value="�R��">
			    <input type="hidden" name="post_Id" value="${postVO.post_Id}">
			    <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
			    <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--�e�X��e�O�ĴX����Controller-->
			    <input type="hidden" name="action"value="delete_Post">
			</td></FORM>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/post/post.do">
			    <input type="submit" value="�e�X�d��"> 
			    <input type="hidden" name="post_Id" value="${postVO.post_Id}">
			    <input type="hidden" name="action" value="listPost_Responses_ByPost_Id_B">
			</td></FORM>
	</tr>
	</c:forEach>
</table>
	<%@ include file="page/page2.file"%>


<%if (request.getAttribute("listPost_Responses_ByPost_Id")!=null){%>
       <jsp:include page="listPost_Responses_ByPost_Id.jsp" />
<%} %>


<br>�����������|:<br><b>
   <font color=blue>request.getServletPath():</font> <%= request.getServletPath()%><br>
   <font color=blue>request.getRequestURI(): </font> <%= request.getRequestURI()%> </b>
</body>
</html>
