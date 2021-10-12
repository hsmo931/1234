<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>글쓰기</h1>
<form action="write.do" method="POST">
	<table border=1>
		<tr>
			<td>글제목</td>
			<td><input type="text" class="title" name="title"
				style="width: 90%"></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input type="text" class="writer" name="writer"
				style="width: 90%"></td>
		</tr>
		<tr>
			<td colspan=2>내용</td>
		</tr>
		<tr>
			<td colspan=2><textarea rows="20" cols="100" name="content"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan=2 style="text-align: center">
				<input type="submit" value="작성">
				<input type="reset" value="다시쓰기">
			</td>
		</tr>

	</table>
</form>



</body>
</html>