<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무료나눔상세페이지</title>
<style type="text/css">
.layer {
	position: absolute;
	top: 0;
	left: 15%;
}

#topbannerDiv {
	width: 1000px;
	height: 150px;
}

#topmenu {
	background-color: orange;
	width: 1000px;
	height: 50px;
}

#topbannerDiv img {
	position: relative;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}

#topmenu a {
	text-align: center;
	line-height: 50px;
}

#loginBtn {
	display: block;
	position: absolute;
	left: 90%;
	width: 150px;
	height: 75px;
}

/*-----------------------------메뉴바 css------------------------------*/
.menubar {
	border: none;
	border: 0px;
	margin: 0px;
	padding: 0px;
	font: 67.5% "Lucida Sans Unicode", "Bitstream Vera Sans",
		"Trebuchet Unicode MS", "Lucida Grande", Verdana, Helvetica,
		sans-serif;
	font-size: 14px;
	font-weight: bold;
}

.menubar ul {
	/*기본 설정 rgb(109, 109, 109)*/
	background: #FF5675;
	height: 50px;
	list-style: none;
	margin: 0;
	padding: 0;
}

.menubar li {
	float: left;
	padding: 0px;
}

.menubar li a {
	background: #FF5675;
	color: #cccccc;
	display: block;
	font-weight: normal;
	line-height: 50px;
	margin: 0px;
	padding: 0px 25px;
	text-align: center;
	text-decoration: none;
}

.menubar li a:hover, .menubar ul li:hover a {
	background: #FF607F;
	color: #FFFFFF;
	text-decoration: none;
}

.menubar li ul {
	background: #FF607F;
	display: none; /* 평상시에는 드랍메뉴가 안보이게 하기 */
	height: auto;
	padding: 0px;
	margin: 0px;
	border: 0px;
	position: absolute;
	width: 200px;
	z-index: 200;
}

.menubar li:hover ul {
	display: block; /* 마우스 커서 올리면 드랍메뉴 보이게 하기 */
}

.menubar li li {
	background: #FF607F;
	display: block;
	float: none;
	margin: 0px;
	padding: 0px;
	width: 200px;
}

.menubar li:hover li a {
	background: none;
}

.menubar li ul a {
	display: block;
	height: 50px;
	font-size: 12px;
	font-style: normal;
	margin: 0px;
	padding: 0px 10px 0px 15px;
	text-align: left;
}

.menubar li ul a:hover, .menubar li ul li:hover a {
	background: #FF6A89;
	border: 0px;
	color: #ffffff;
	text-decoration: none;
}

/*-------------------------------------------------------------------------*/

/*---------------------------게시글 css --------------------------------------*/

#inputContent {
	background-color: gray;
	width: 1000px;
	height: 500px;
	margin: auto;
}
table{
	width: 100%;
	height: 100%;
}
table tr,td{
	border: 1px solid black;
}

img {
	width: 200px;
	height: 200px;
}

#buttonGroup{
	float: right;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script type="text/javascript" src="../semiview/handOut/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				//로그인 이미지 hover 적용
				$('#loginBtn').hover(
						function() {
							$(this).attr(
									"src",
									$(this).attr("src").replace("off.png",
											"on.png"));
						},
						function() {
							$(this).attr(
									"src",
									$(this).attr("src").replace("on.png",
											"off.png"));
						});
				//무료나눔하기 이미지 hover 적용
				$('#handOut').hover(
						function() {
							$(this).attr(
									"src",
									$(this).attr("src").replace("off.png",
											"on.png"));
						},
						function() {
							$(this).attr(
									"src",
									$(this).attr("src").replace("on.png",
											"off.png"));
						});
				
				//목록
				$('#list').on('click', function(){
					$('form').attr('action', 'handOut.do'); 
				    $('form').submit();
				});
				
				//수정
				$('#update').on('click', function(){
					$('form').attr('action', 'handOutUpdateWrite.do'); 
				    $('form').submit();
				});
				
				//삭제
				$('#del').on('click', function(){
					$('form').attr('action', 'handOutDelete.do'); 
				    $('form').submit();
				});
				
			});
</script>
</head>
<body>
	<div class="layer" id="wrap">
		<div id="topbannerDiv">
			<img id="momsRecipe" src="../semiview/images/mammaLogo.png" />

		</div>
		<div class="menubar">
			<ul>
				<li><a href="*">홈</a></li>
				<li><a href="recipe.do" id="current">레시피</a>
					<ul>
						<li><a href="#">초기이유식(4~6개월)</a></li>
						<li><a href="#">중기이유식(7~9개월)</a></li>
						<li><a href="#">후기이유식(10~12개월)</a></li>
						<li><a href="#">완료기이유식(12개월이후)</a></li>
					</ul></li>
				<li><a href="momTalk.do">커뮤니티</a></li>
				</li>
				<li><a href="handOut.do">무료나눔</a></li>
				<li><a href="info.do">육아정보</a></li>
				<li><a href="question.do">고객센터</a></li>
			</ul>
		</div>
		<div id="content" alt="페이지마다 바뀔 DIV 요소입니다. css 설정 안해놓은 상태입니다.">
			<div id="inputContent">
				<table>
					<tr>
						<td>닉네임</td>
						<td>${dto.nickname}</td>
						<td>조회수</td>
						<td>${dto.readcount}</td>
					</tr>

					<tr>
						<td>제목</td>
						<td colspan="3">${dto.title}</td>
					</tr>

					<tr>
						<td>지역</td>

						<td colspan="3">${dto.area}</td>
					</tr>
					<tr>
						<td>종류</td>

						<td colspan="3">${dto.type_list}</td>
					</tr>
					<tr>
						<td>사용기간</td>

						<td colspan="3">${dto.period_list}</td>
					</tr>

					<tr>
					<tr>
						<td>내용</td>

						<td colspan="3">${dto.content}</td>
					</tr>
						<td>메인이미지</td>
						<td colspan="3"><img id="main_image" width="200px" height="200px"
							src="../semiview/images/handout/${dto.main_picture}" /></td>
					</tr>
					<tr>
						<td>서브이미지1</td>
						<td colspan="3"><img id="sub_image1"
							src="../semiview/images/handout/${dto.picture1}" /></td>
					</tr>
					
					<tr>
						<td>서브이미지2</td>
						<td colspan="3"><img id="sub_image2"
							src="../semiview/images/handout/${dto.picture2}" /></td>
					</tr>
					<tr>
						<td>서브이미지3</td>
						<td colspan="3"><img id="sub_image3"
							src="../semiview/images/handout/${dto.picture3}" /></td>
					</tr>
				</table>
				<div id="buttonGroup">
				<form name="frm" method="POST">
				<input type="hidden" name="handout_post_num" value="${dto.handout_post_num}" />
				<input type="hidden" name="pageNum" value="${param.pageNum}" />
				
							
				<input type="button" id="list" name="list" value="목록"/>
				<input type="button" id="update" name="update" value="수정"/>
				<input type="button" id="del" name="del" value="삭제"/>
				</form>
				</div>
			</div>
			<!-- 댓글 입력/댓글 내용 출력 -->
			<div id="commentDiv">

				<div id="commentList" name="commentList" alt="댓글내용 출력 DIV입니다.">
					<script type="text/javascript">
						//num값의 해당하는 댓글들 가져올거야
						listView("${requestScope.dto.handout_post_num}")
					</script>
				</div>
			</div>
		</div>
	</div>
	<a href="login.do"><img id="loginBtn"
		src="../semiview/images/loginBtn_off.png" /></a>

</body>
</html>