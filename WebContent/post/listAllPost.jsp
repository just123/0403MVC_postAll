<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.post.model.*"%>

<!-- ==================================下面是HEAD部分=============================== -->

<!DOCTYPE html>
<html>
<title>動物地圖討論區</title>
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

	<!-- w3-content defines a container for fixed size centered content, 
and is wrapped around the whole page content, except for the footer in this example -->
	<div class="w3-content" style="max-width: 1400px">

		<!-- Header -->
		<header class="w3-container w3-center w3-padding-32">
			<h1>
				<b>動物地圖討論區</b>
			</h1>

		</header>

		<!-- Grid -->
		<div class="w3-row">

			<!-- ==================================下面是標題、內容=============================== -->
			<!-- Blog entries -->
			<div class="w3-col l8 s12">
				<%
					PostService postSvc = new PostService();
					List<PostVO> list = postSvc.getAll();
					request.setAttribute("list", list);
				%>
				<!-- Blog entry -->
				<%@ include file="page/page1.file"%>
				<c:forEach var="postVO" items="${list}" begin="<%=pageIndex%>"
					end="<%=pageIndex+rowsPerPage-1%>">

					<div class="w3-card-4 w3-margin w3-white">

						<img src="images/dog.jpg" alt="Nature" style="width: 90%;height:35 0px;">
							
						<div class="w3-container w3-padding-8">
							<h3>
								發文者 : <a href="#" style="color: rgba(255, 0, 0, 0.49);">${postVO.mem_Id}</a>
							</h3>
							<h5>${postVO.post_title}, <span class="w3-opacity">${postVO.post_time}</span>
							</h5>
						</div>

						<div class="w3-container">
							<p>${postVO.post_content}</p>
							<div class="w3-row">
								<div class="w3-col m8 s12">
									<p>
									<FORM METHOD="post"
										ACTION="<%=request.getContextPath()%>/post/post.do">
										<input type="submit" value="READ MORE »"
											class="w3-btn w3-padding-large w3-white w3-border w3-hover-border-black">
										<input type="hidden" name="post_Id"
											value="${postVO.post_Id }"> <input type="hidden"
											name="action" value="listPost_Responses_ByPost_Id_B">
									</FORM>

									</p>
								</div>
								
							</div>


						</div>

					</div>
				</c:forEach>
				<hr>
			
				
				<!-- END BLOG ENTRIES -->
			</div>
		







			<!-- ==================================下面是側邊的畫面=============================== -->













			<!-- Introduction menu -->
			<div class="w3-col l4">
				<div class="row">
					<ul>
						<a class="w3-btn w3-white w3-border w3-hover-border-black"
							href='<%=request.getContextPath()%>/post/addPost.jsp'>新增文章</a>
						<a class="w3-btn w3-white w3-border w3-hover-border-black">AnimalMap首頁</a>
						<a class="w3-btn w3-white w3-border w3-hover-border-black">關於AnimalMap</a>
					</ul>
				</div>

				<!-- About Card -->
				<div class="w3-card-2 w3-margin w3-margin-top">
					<img src="images/images.jpg" style="width: 100%">
					<div class="w3-container w3-white">
						<h4>
							<b>公告訊息</b>
						</h4>
						<p>以領養代替購買，以結紮代替撲殺<br>
							To adopt instead of buying, ligation instead of culling</p>
					</div>
				</div>
				<hr>

				<!-- Posts -->
			<div class="w3-card-2 w3-margin">
		<div class="w3-container w3-padding">
			<h4>可愛的毛小孩 Posts</h4>
		</div>
		<ul class="w3-ul w3-hoverable w3-white">
			<li class="w3-padding-16">
			<img src="images/dog1.png" alt="Image" class="w3-left w3-margin-right" style="width: 110px">
				<span class="w3-large">毛小孩-柴犬</span><br>
				<span>我們很可愛很乖,別丟棄我們</span></li>
			<li class="w3-padding-16">
			<img src="images/dog1_1.png" alt="Image" class="w3-left w3-margin-right" style="width: 110px">
				<span class="w3-large">毛小孩-柯基犬</span><br>
				<span>雖然我腿短~但我很萌~</span></li>
			<li class="w3-padding-16">
			<img src="images/dog1-2.png" alt="Image" class="w3-left w3-margin-right" style="width: 110px">
				<span class="w3-large">毛小孩-臘腸狗</span><br>
				<span>雖然身體長腿短,但我有優雅的姿態<</span></li>
	
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
							<span class="w3-tag w3-black w3-margin-bottom">狗狗</span> <span
								class="w3-tag w3-light-grey w3-small w3-margin-bottom">貓咪</span>
							<span class="w3-tag w3-light-grey w3-small w3-margin-bottom">認養</span>
							<span class="w3-tag w3-light-grey w3-small w3-margin-bottom">流浪狗</span>
							<span class="w3-tag w3-light-grey w3-small w3-margin-bottom">流浪貓咪</span>
							<span class="w3-tag w3-light-grey w3-small w3-margin-bottom">AnimalMap</span>
							<span class="w3-tag w3-light-grey w3-small w3-margin-bottom">哈士奇</span>
							<span class="w3-tag w3-light-grey w3-small w3-margin-bottom">黃金獵犬</span>
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
		<div class="row">			
					<%@ include file="page/page2.file"%>
				</div>

		<p>Powered by <a href="#" target="_blank">AnimalMap</a></p>
	</footer>

</body>
</html>