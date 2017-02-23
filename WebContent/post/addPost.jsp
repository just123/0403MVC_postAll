<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.post.model.*"%>
<%@ page import="com.post.controller.*" %>

<% String mem_Id = "1000000"; %>
<!-- ==================================下面是HEAD部分=============================== -->

<!DOCTYPE html>
<html>
<title>動物地圖討論區-新增文章資料</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<style>
body, h1, h2, h3, h4, h5 {
	font-family: "Raleway", sans-serif
}
</style>
<body class="w3-light-grey">
<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font color='red'>請修正以下錯誤:
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li>${message}</li>
				</c:forEach>
			</ul>
		</font>
	</c:if>
	<!-- w3-content defines a container for fixed size centered content, 
and is wrapped around the whole page content, except for the footer in this example -->
	<div class="w3-content" style="max-width: 1400px">

		<!-- Header -->
		<header class="w3-container w3-center w3-padding-32">
			<h1>
				<b>動物地圖討論區-新增文章資料</b>
			</h1>
			
		</header>

		<!-- Grid -->
		<div class="w3-row">
<%
	PostVO postVO = (PostVO) request.getAttribute("postVO");
%>
		<!-- ==================================下面是標題、內容=============================== -->
			<!-- Blog entries -->
			<div class="w3-col l8 s12">
	
				<!-- Blog entry -->

				<div class="w3-card-4 w3-margin w3-white">

					<img src="https://www.w3schools.com/w3images/woods.jpg"
						alt="Nature" style="width: 100%">
					<div class="w3-container w3-padding-8">
					<form METHOD="post" ACTION="<%=request.getContextPath()%>/post/post.do">
						<h3>
							發文者 :<%=mem_Id %> <a href="#" style="color: rgba(255, 0, 0, 0.49);"></a>
						</h3>
						<h4>文章分類：<font color=red><b>*</b></font>
						<td><select size="1" name="post_class_Id$post_class">
						    <option value="1-自介" ${(param.post_class_Id$post_class=='1-自介')? 'selected':'' }>自介
							<option value="2-請問" ${(param.post_class_Id$post_class=='2-請問')? 'selected':'' }>請問
							<option value="3-資訊" ${(param.post_class_Id$post_class=='3-資訊')? 'selected':'' }>資訊
							<option value="4-推薦" ${(param.post_class_Id$post_class=='4-推薦')? 'selected':'' }>推薦
							<option value="5-認養" ${(param.post_class_Id$post_class=='5-認養')? 'selected':'' }>認養
							<option value="6-協尋" ${(param.post_class_Id$post_class=='6-協尋')? 'selected':'' }>協尋
							<option value="7-捨獲" ${(param.post_class_Id$post_class=='7-捨獲')? 'selected':'' }>捨獲
							<option value="8-心得" ${(param.post_class_Id$post_class=='8-心得')? 'selected':'' }>心得
						</select></td></h4>
						
						<h4><td>文章標題：<input type="TEXT" name="post_title" size="35" 
							onfocus="if(value =='請輸入標題'){value=''}"
							onblur="if(value ==''){value='請輸入標題'}"
							value="<%=(postVO == null) ? "請輸入標題" : postVO.getPost_title() %>" />
						</td></h4>
						
						<h4><td>文章內容：</td><br>
						<td><br><textarea  name="post_content" style="width:800px;height:300px;"
						value="<%=(postVO == null) ? "" : postVO.getPost_content()%>"></textarea></td></h4>
					<div style="text-align: right" >
						<input type="hidden" name="action" value="insert">
						<input type="hidden" name="mem_Id" value="<%=mem_Id %>">
						<input type="submit" value="送出新增" class="w3-btn w3-padding-large w3-white w3-border w3-hover-border-black"></div>
					
				</form>
					</div>


				</div>

				<hr>
			
				<!-- END BLOG ENTRIES -->

			</div>








			<!-- ==================================下面是側邊的畫面=============================== -->













			<!-- Introduction menu -->
			<div class="w3-col l4">
			<div class="row" >
				<ul><a class="w3-btn w3-white w3-border w3-hover-border-black" href='<%=request.getContextPath()%>/post/listAllPost.jsp'>回討論區</a>
					<a class="w3-btn w3-white w3-border w3-hover-border-black" >AnimalMap首頁</a>
					<a class="w3-btn w3-white w3-border w3-hover-border-black" >關於AnimalMap</a>
			</ul></div>
			
				<!-- About Card -->
				<div class="w3-card-2 w3-margin w3-margin-top">
					<img src="https://www.w3schools.com/w3images/avatar_g.jpg"
						style="width: 100%">
					<div class="w3-container w3-white">
						<h4>
							<b>公告訊息</b>
						</h4>
						<p>Just me, myself and I, exploring the universe of
							uknownment. I have a heart of love and a interest of lorem ipsum
							and mauris neque quam blog. I want to share my world with you.</p>
					</div>
				</div>
				<hr>

				<!-- Posts -->
				<div class="w3-card-2 w3-margin">
					<div class="w3-container w3-padding">
						<h4>Popular Posts</h4>
					</div>
					<ul class="w3-ul w3-hoverable w3-white">
						<li class="w3-padding-16"><img src="/w3images/workshop.jpg"
							alt="Image" class="w3-left w3-margin-right" style="width: 50px">
							<span class="w3-large">Lorem</span><br> <span>Sed
								mattis nunc</span></li>
						<li class="w3-padding-16"><img src="/w3images/gondol.jpg"
							alt="Image" class="w3-left w3-margin-right" style="width: 50px">
							<span class="w3-large">Ipsum</span><br> <span>Praes
								tinci sed</span></li>
						<li class="w3-padding-16"><img src="/w3images/skies.jpg"
							alt="Image" class="w3-left w3-margin-right" style="width: 50px">
							<span class="w3-large">Dorum</span><br> <span>Ultricies
								congue</span></li>
						<li class="w3-padding-16 w3-hide-medium w3-hide-small"><img
							src="/w3images/rock.jpg" alt="Image"
							class="w3-left w3-margin-right" style="width: 50px"> <span
							class="w3-large">Mingsum</span><br> <span>Lorem ipsum
								dipsum</span></li>
					</ul>
				</div>
				<hr>

				<!-- Labels / tags -->
				<div class="w3-card-2 w3-margin">
					<div class="w3-container w3-padding">
						<h4>Tags</h4>
					</div>
					<div class="w3-container w3-white">
						<p>
							<span class="w3-tag w3-black w3-margin-bottom">Travel</span> <span
								class="w3-tag w3-light-grey w3-small w3-margin-bottom">New
								York</span> <span
								class="w3-tag w3-light-grey w3-small w3-margin-bottom">London</span>
							<span class="w3-tag w3-light-grey w3-small w3-margin-bottom">IKEA</span>
							<span class="w3-tag w3-light-grey w3-small w3-margin-bottom">NORWAY</span>
							<span class="w3-tag w3-light-grey w3-small w3-margin-bottom">DIY</span>
							<span class="w3-tag w3-light-grey w3-small w3-margin-bottom">Ideas</span>
							<span class="w3-tag w3-light-grey w3-small w3-margin-bottom">Baby</span>
							<span class="w3-tag w3-light-grey w3-small w3-margin-bottom">Family</span>
							<span class="w3-tag w3-light-grey w3-small w3-margin-bottom">News</span>
							<span class="w3-tag w3-light-grey w3-small w3-margin-bottom">Clothing</span>
							<span class="w3-tag w3-light-grey w3-small w3-margin-bottom">Shopping</span>
							<span class="w3-tag w3-light-grey w3-small w3-margin-bottom">Sports</span>
							<span class="w3-tag w3-light-grey w3-small w3-margin-bottom">Games</span>
						</p>
					</div>
				</div>

				<!-- END Introduction Menu -->
			</div>

			<!-- END GRID -->
		</div>
		<br>

		<!-- END w3-content -->
	</div>

	<!-- Footer -->
	<footer class="w3-container w3-dark-grey w3-padding-32 w3-margin-top">
		<button class="w3-btn w3-disabled w3-padding-large w3-margin-bottom">Previous</button>


		<p>
			Powered by <a href="https://www.w3schools.com/w3css/default.asp"
				target="_blank">w3.css</a>
		</p>
	</footer>

</body>
</html>