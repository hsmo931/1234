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
</head>
<script>
	$(function() {
		var curPage;
		if (curPage == null)
			curPage = 1;
		listprint(curPage)
		$('.writebtn').click(function() {
			location.href = "ajaxwritepage.do"
		})
	});

	function listprint(curPage) {
		var paging;
		var boardlistdata = $('#boardlistdata')
		var pagediv = $('.pagediv')
		var startPage;
		var pageEa;
		var endPage;
		var lastPage;

		var param = {
			"curPage" : curPage
		};
		boardlistdata.empty();
		$.ajax({
			url : "ajaxboardlist.do",
			type : "POST",
			data : JSON.stringify(param),
			dataType : 'json',
			contentType : "application/json;charset=UTF-8",
			success : function(data) {

				$.each(data.boardVO, function(data, list) {
					var datalist = '';
					datalist += '<tr><td>';
					datalist += list.writenum;
					datalist += '</td><td class=listtitle>';
					datalist += '<a href="ajaxwritingdetail.do?writenum=';
					datalist += list.writenum;
					datalist += '">';
					datalist += list.title;
					datalist += '</a></td>'
					datalist += '<td>'
					datalist += list.regdate
					datalist += '</td><td>'
					datalist += list.writer
					datalist += '</td><td>'
					datalist += list.viewcnt
					datalist += '</td></tr>'
					boardlistdata.append(datalist);
				})

				if (paging == null)
					paging = ""
				pagediv.empty();
				startPage = data.pagingVO.startPage
				pageEa = data.pagingVO.pageEa
				endPage = data.pagingVO.endPage
				curPage = data.pagingVO.curPage
				lastPage = data.pagingVO.lastPage

				if (startPage != 1) {
					paging += "<span class=pageprev onclick=listprint("
							+ (Number(startPage) - 1) + ")>&lt;</span>"
				} else
					paging += ""
				for (var i = startPage; i <= endPage; i++) {
					if (i == curPage) {
						paging += "<b>" + i + "</b>"
					}
					if (i != curPage) {
						paging += "<span class=pagenum onclick=listprint(" + i
								+ ")>" + i + "</span>"
					}
				}
				if (endPage != lastPage) {

					paging += "<span class=pagenext onclick=listprint("
							+ (Number(endPage) + 1) + ")>&gt;</span>"

				}

				pagediv.append(paging)
			},
			error : function(request, status, error) {
				alert("code = " + request.status + " message = "
						+ request.responseText + " error = " + error);
			}

		})

	}
</script>
<style>
.title{
text-align: center
}
.pagenum {
	padding: 1px;
}
.pagenum:hover{
cursor:pointer;
color:blue;
}
.pagenext:hover{
cursor:pointer;
color:blue;
}
.pageprev:hover{
cursor:pointer;
color:blue;
}
.listtitle{
text-align:left;
}
.btable{
margin-left: 20%;
margin-right: 20%;
text-align: center;
border:1px solid;
}
.bthead{
border-bottom-style: double;
}
.pagediv{
display: block; 
text-align: center;
}
.bodycontent{

width:100%;
height:700px;
}
.boardall{
margin:auto;
width:80%;
height:80%;
border-radius:2px;
background-color:white;
}
</style>
<body>
<div id="header">
<jsp:include page="/index.jsp"/>

</div>
<div class="bodycontent">
	<div class="boardall">

		<div class="pagetitle">
			<h1 class=title>ajax 게시판 목록</h1>
		</div>

		<div class="boardlisttable">
			<table class="btable">
				<thead class="bthead">
					<tr>
						<td style="width: 5%">글번호</td>
						<td style="width: 20%">제목</td>
						<td style="width: 10%">작성일</td>
						<td style="width: 5%">작성자</td>
						<td style="width: 5%">조회수</td>
					</tr>
				</thead>
				<tbody id="boardlistdata"></tbody>
				<!--sql 게시물 들어가는자리  -->
				<tr>
					<td colspan="4"></td>
					<td>
						<div class="writediv">
							<button class="writebtn">글쓰기</button>
						</div>
					</td>
			</table>
			<br>

			<div class="pagediv">
				<!-- 페이지 들어가는 자리 -->
			</div>



		</div>

	</div>
	</div>
</body>
</html>