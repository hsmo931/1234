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
		
		$('.boardlist').click(function() {
			location.href = "boardAll.do"
		})
		$('.updatepage').click(function(){
			location.href="updatepage.do?writenum="+${writingdetail.writenum}
		})
		$('.delete').click(function(){
			if(confirm("정말로 삭제하시겠습니까?")){
				location.href="delete.do?writenum="+${writingdetail.writenum}	
			}else{
			}
		})
	})
</script>
</head>
<body>
<h1>글내용 보기</h1>
<table border=1>
<tr>
<td>글제목 </td><td>${writingdetail.title}</td>
</tr>
<tr>
<td>작성자</td><td>${writingdetail.writer }</td>
</tr>
<tr>
<td colspan=2>내용</td>
</tr>
<tr>
<td colspan=2>
<pre>
${writingdetail.content}
</pre>
</td>
</tr>
<tr>
<td colspan=2 style="text-align:center"> 
<button class="boardlist">목록으로</button>
<button class="updatepage">수정</button>
<button class="delete">지우기</button></td>
</tr>


</table>


</body>
</html>