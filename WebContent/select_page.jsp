  <%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="postSvc" scope="page" class="com.post.model.PostService" />
 <jsp:useBean id="post_ResponseSvc" scope="page" class="com.post_Response.model.Post_ResponseService" />
 <jsp:useBean id="offiMsgSvc" scope="page" class="com.offiMsg.model.OffiMsgService" />



<html>
<head><title>IBM POST: Home</title></head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
  <tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
  
    <td><h3>IBM post_Response : Home</h3><font color=red>( MVC )</font></td>
  </tr>
</table>

<p>This is the Home page for IBM post_Response: Home</p>

<h3>��Ƭd��:</h3>
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

<ul>
  <li><a href='<%=request.getContextPath()%>/post_Response/listAllPost_Response.jsp'>List</a> all post_Responses. </li> 
  <br>
  
 
 <li><a href='<%=request.getContextPath()%>/post/listAllPost.jsp'>List</a> all Posts.</li> 
 <br>
  <li><a href='<%=request.getContextPath()%>/offiMsg/listAllOffiMsg.jsp'>List</a> all offiMsgs.</li> 
 
  <br> 
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/post_Response/post_Response.do" >
        <b>��J�^�нs�� (�p1):</b>
        <input type="text" name="res_Id">
        <input type="submit" value="�e�X">
        <input type="hidden" name="action" value="getOne_For_Display">
    </FORM>
  </li>

   
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/post_Response/post_Response.do" >
       <b>��ܦ^�нs��:</b>
       <select size="1" name="res_Id">
         <c:forEach var="post_ResponseVO" items="${post_ResponseSvc.all}" > 
          <option value="${post_ResponseVO.res_Id}">${post_ResponseVO.res_Id}
         </c:forEach>   
       </select>
       <input type="submit" value="�e�X">
       <input type="hidden" name="action" value="getOne_For_Display">
    </FORM>
  </li>
  
<!--     <li> -->
<%--      <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/post/post.do" > --%>
<!--        <b>��ܤ峹�s��:</b> -->
<!--        <select size="1" name="post_Id"> -->
<%--          <c:forEach var="postVO" items="${postSvc.all}" >  --%>
<%--           <option value="${postVO.post_Id}">${postVO.post_Id} --%>
<%--          </c:forEach>    --%>
<!--        </select> -->
<!--        <input type="submit" value="�e�X"> -->
<!--        <input type="hidden" name="action" value="getOne_For_Display"> -->
<!--      </FORM> -->
<!--   </li> -->
  
    <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/post_Response/post_Response.do" >
       <b>��ܤ峹�s��:</b>
       <select size="1" name="res_Id">
         <c:forEach var="postVO" items="${post_ResponseSvc.all}" > 
          <option value="${postVO.res_Id}">${postVO.post_Id}
         </c:forEach>   
       </select>
       <input type="submit" value="�e�X">
       <input type="hidden" name="action" value="getOne_For_Display">
     </FORM>
  </li>

<!-- �ƦX�d��   -->
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/post/post.do" >
       <b><font color=orange>��ܤ峹�s��(�Ҧ��d��)):</font></b>
       <select size="1" name="post_Id">
         <c:forEach var="postVO" items="${postSvc.all}" > 
          <option value="${postVO.post_Id}">${postVO.post_Id}
         </c:forEach>   
       </select>
       <input type="submit" value="�e�X">
       <input type="hidden" name="action" value="listPost_Responses_ByPost_Id_A">
     </FORM>
     
  </li>
</ul>

 <h3>�T���޲z</h3>

<ul>
  <li><a href='<%=request.getContextPath()%>/offiMsg/addOffiMsg.jsp'>Add</a> a new OffiMsg.</li>
</ul>
 
 
 

<h3>�^�Яd���޲z</h3>

<ul>
  <li><a href='<%=request.getContextPath()%>/post_Response/addPost_Response.jsp'>Add</a> a new Post_Response.</li>
</ul>

<h3>�Q�װϤ峹�޲z</h3>

<ul>
  <li><a href='<%=request.getContextPath()%>/post/addPost.jsp'>Add</a> a new Post.</li>
</ul>


<h3><font color=orange>�Q�װϺ޲z</font></h3>

<ul>
  <li><a href='<%=request.getContextPath()%>/post/listAllPost.jsp'>List</a> all Posts. </li>
</ul>

</body>

</html>
