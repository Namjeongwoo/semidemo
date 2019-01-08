<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무료나눔 글쓰기페이지</title>
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

/*---------------------------글쓰기 공간 css-----------------------------------*/

/*무료 나눔하기 이미지 사이즈 조절*/
#handOut {
	display: inline-block;
	margin-top: 10px;
	width: 291px;
	height: 113px;
}

/*제목,닉네임,카테고리,내용 DIV*/
#left {
	float: left;
	border: 5px solid black;
	border-radius: 10px;
}

/*이미지,file 선택 DIV*/
#right {
	float: right;
	border: 5px solid black;
	border-radius: 10px;
}

/*등록하기 , 취소하기 버튼 DIV*/
#upAndcenclebutton {
	clear: both;
}

/*메인이미지,이미지1,2,3 라벨 스타일 적용 : 라벨을 블록요소로 지정해서 버튼처럼 만들었다.*/
.fileImages {
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

/*input type="file" 숨기는 스타일 적용 : 라벨을 버튼으로 만들고 file 선택을 숨겼다.*/
.inputFiles {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

/*제목, 닉네임 text 스타일 적용*/
input {
	width: 200px;
	height: 42px;
	border-radius: 5px;
}

/*내용 textarea 스타일 적용*/
textarea {
	width: 700px;
	height: 200px;
	border-radius: 5px;
}

/*등록하기,취소하기 버튼 사이즈 조절 css*/
.uploadAndcancel {
	width: 111px;
	height: 53px;
}

#contentLabel {
	display: block;
	float: left;
	height: 200px;
	line-height: 200px;
}

/*-------------------------------------------------------------------------*/
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
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

				//파일 선택 시 메인 이미지 글쓰기 화면에서 보여주기.
				var myfile = $('#file').prop('files');
				$('#fileSelect').click(function() {
					$('#mainImage').attr("src", $(this).attr("src"));
				});

				//등록 버튼 이미지 hover 적용
				$('#uploadImage').hover(
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

				//취소 버튼 이미지 hover 적용
				$('#cancelImage').hover(
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
				
				//등록버튼 서브밋 이벤트.
				$('#uploadImage').click(function(){
					$('#writeForm').submit();
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

		<!-- ----------------------------글쓰기 DIV 시작------------------------------ -->

		<div id="content" alt="페이지마다 바뀔 DIV 요소입니다. css 설정 안해놓은 상태입니다.">
			<a href="handOutWrite.do"><img id="handOut"
				src="../semiview/PJ/handout_off.png" /></a>
			<!-- 무료나눔하기 글쓰기 페이지 구현 소스 -->
			<div id="inputContent">
				<div id="left">
					<h1>글쓰기 페이지입니다.</h1>
					<form name="writeForm" id="writeForm" method="POST"
						action="handOutWriteForm.do" enctype="multipart/form-data">
						<div class="writeContent">
							<label>제목 </label><input type="text" id="title" name="title"
								placeholder="예)아기 침대 무료 나눔해요" />
						</div>
						<div class="writeContent">
							<label>닉네임 </label><input type="text" placeholder="홍길동" name="nickname" />
							
						</div>
						<div class="writeContent">
							<label>카테고리</label> <select id="area" name="area">
								<option value="지역별">지역별</option>
								<option value="서울">서울</option>
								<option value="경기">경기</option>
								<option value="광주">광주</option>
								<option value="대구">대구</option>
								<option value="대전">대전</option>
								<option value="부산">부산</option>
								<option value="울산">울산</option>
							</select> <select id="kinds" name="kinds">
								<option value="종류">종류</option>
								<option value="가구">가구</option>
								<option value="장난감">장난감</option>
								<option value="옷">옷</option>
								<option value="신발">신발</option>
								<option value="카시트">카시트</option>
								<option value="유모차">유모차</option>
							</select> <select id="period of use" name="period of use">
								<option value="사용기간">사용기간</option>
								<option value="1개월~3개월">1개월~3개월</option>
								<option value="4개월~6개월">4개월~6개월</option>
								<option value="7개월~9개월">7개월~9개월</option>
								<option value="10개월~12개월">10개월~12개월</option>
								<option value="1년이상">1년이상</option>
							</select> <select id="Product status" name="Product status">
								<option value="상품상태">상품상태</option>
								<option value="최상">최상</option>
								<option value="상">상</option>
								<option value="중">중</option>
								<option value="하">하</option>
							</select>
						</div>
						<div class="writeContent">
							<label id="contentLabel">내용 </label>
							<textarea id="contents" name="contents"
								placeholder="무료 나눔 상품에 대해 설명해주세요"></textarea>
						</div>
				</div>
				<div id="right">
					<div class="mainImage">
						<img id="mainImage" width="200px" height="200px"
							src="../semiview/images/camera.png" /></br> 
						<label for="mainfile" class="fileImages">메인이미지</label> 
							<a href="handOutWriteForm.do" id="fileSelect" class="inputFiles">
							<input type="file" name="mainfile" id="mainfile" /></a> 
						<label for="file1" class="fileImages">이미지1</label> 
						<a href="handOutWriteForm.do" id="fileSelect" class="inputFiles">
							<input type="file" id="file1" name="file1"/></a></br> 
						<label for="file2" class="fileImages">이미지2</label>
						<a href="handOutWriteForm.do" id="fileSelect" class="inputFiles">
							<input	type="file" id="file2"  name="file2"/></a> 
						<label for="file3"	class="fileImages">이미지3</label> 
						<a href="handOutWriteForm.do" id="fileSelect" class="inputFiles">
							<input type="file" id="file3" name="file3"/></a></br>
					</div>
				</div>
				<div id="upAndcenclebutton" alt="등록/취소 버튼 div" align="center">
					 
					<input type="image"
						   src="../semiview/PJ/upload_off.png" 
						   name="submit" 
						   value="submit"
						   id="uploadImage" 
						   class="uploadAndcancel">
					 
					<a href="handOut.do"> 
					<input type="image"	
						   src="../semiview/PJ/cencel2_off.png" 
						   name="cancle" 
						   value="cancle"
						   id="cancelImage" 
						   class="uploadAndcancel">
					</a>
				</div>
				</form>
			</div>
		</div>
	</div>
	<a href="login.do"><img id="loginBtn"
		src="../semiview/images/loginBtn_off.png" /></a>

</body>
</html>