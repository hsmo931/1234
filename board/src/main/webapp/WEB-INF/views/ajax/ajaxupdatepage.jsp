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
		$('.cancel').click(function() {
			history.go(-1)
		})

	})
</script>
</head>
<body>
	<h1>ajax게시판 글 수정</h1>
	<form action="ajaxupdate.do" method="POST">
		<input type="hidden" name=writenum value="${board.writenum }">
		<table border=1>
			<tr>
				<td>글제목</td>
				<td><input type="text" class="title" name="title"
					style="width: 90%" value="${board.title}"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><label class="writer" style="width: 90%">${board.writer}</label></td>
			</tr>
			<tr>
				<td colspan=2>내용</td>
			</tr>
			<tr>
				<td colspan=2><textarea rows="20" cols="100" name="content">${board.content }</textarea>
				</td>
			</tr>
			<tr>
				<td colspan=2 style="text-align: center"><input type="submit"
					value="작성">
					<button type="button" class="cancel">취소</button></td>
			</tr>

		</table>
	</form>
</body>
</html>