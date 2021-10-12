<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.6.0.min.js"></script>
<script>


	$(function() {
		$('.writebtn').click(function() {
			location.href = "writepage.do"
		})
	})
</script>
</head>
<body>
<div id="header">
<jsp:include page="/index.jsp"/>

</div>
	<div class="boardall">

		<div class="pagetitle">
			<h1 style="text-align:center">게시판 목록</h1>
		</div>

		<div class="boardlisttable">
			<table border="1" style="margin-left:20%;margin-right:20%; text-align:center">
				<tr>
					<td style="width:5%">글번호</td>
					<td style="width:20%">제목</td>
					<td style="width:10%">작성일</td>
					<td style="width:5%">작성자</td>
					<td style="width:5%">조회수</td>
				</tr>
				<c:forEach items="${alist}" var="list">
					<tr>
						<td>${list.writenum }</td>
						<td style="text-align:left"><a href="writingdetail.do?writenum=${list.writenum }">${list.title}</a></td>
						<td>${list.regdate}</td>
						<td>${list.writer}</td>
						<td>${list.viewcnt}</td>
					</tr>
				</c:forEach>
				<tr><td colspan="4"></td><td>
			<div class="writediv">
				<button class="writebtn">글쓰기</button>
			</div>
			</td>
			</table>
			<br>
			<div class="pageblock">
				<div style="display: block; text-align: center;">
				
					<c:if test="${paging.startPage != 1 }">
						<a
							href="boardAll.do?curPage=${paging.startPage - 1 }&pageEa=${paging.pageEa}">&lt;</a>
					</c:if>
					<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
						var="p">
						<c:choose>

							<c:when test="${p == paging.curPage }">
								<b>${p }</b>
							</c:when>
							<c:when test="${p != paging.curPage }">
								<a href="boardAll.do?curPage=${p }&pageEa=${paging.pageEa}">${p }</a>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<a
							href="boardAll.do?curPage=${paging.endPage+1 }&pageEa=${paging.pageEa}">&gt;</a>
					</c:if>
				</div>

			</div>


		</div>

	</div>
</body>
</html>