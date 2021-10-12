<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		$('.bar_menu').mouseenter(function() {
			$('.submenu').slideDown(200);

		});
		$('.bar_menu').mouseleave(function() {
			$('.submenu').slideUp(200);
		});
	})

	$(function() {
		$('.boardlist').click(function() {
			location.href = "boardAll.do"
		})
		$('.ajaxboard').click(function() {
			location.href = "ajaxboard.do"
		})
	})
</script>
<style>
li a {
	text-decoration: none;
	color: white;
}

.submenu {
	color: white;
	display: none;
}

.submenu div:hover {
	background-color: #d0dddd;
	border-radius: 1px;
}

.bar {
	display: flex;
	justify-content: space-around;
	align-items: center;
	background-color: #263343;
	padding: 8px 12px;
}

.bar_menu {
	display: flex;
	list-style: none;
	padding-left: 0;
}

.bar_menu li {
	padding: 8px 12px;
}

.bar_menu li:hover {
	background-color: #d49465;
	border-radius: 6px;
}
</style>


</head>



<body>
	<div class="bar">

		<ul class="bar_menu">
			<li><a href="#">게시판</a>
				<div class="submenu">
					<div class="boardlist">일반게시판</div>
					<div class="ajaxboard">ajax게시판</div>
				</div></li>
			<li><a href="#">회원관련</a></li>
		</ul>




	</div>


	<!-- 	<button class="boardlist">게시판</button>
	<button class="ajaxboardlist">ajax게시판</button>
 -->


</body>
</html>