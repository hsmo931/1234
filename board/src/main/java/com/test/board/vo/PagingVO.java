package com.test.board.vo;

public class PagingVO {
	
	         // 현재페이지,시작페이지(블럭),끝페이지(블럭),게시글 총 갯수,페이지당 글 갯수,마지막페이지,start, end
	private int curPage, startPage, endPage, total, pageEa, lastPage, start, end;
	// 페이지 블럭 몇개까지 보일지 ex) cntPage=6 -> 1 2 3 4 5 6 > , cntPage =3 -> 1 2 3 >
	private int cntPage = 5;
	public PagingVO() {
	}
	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getPageEa() {
		return pageEa;
	}

	public void setPageEa(int pageEa) {
		this.pageEa = pageEa;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getCntPage() {
		return cntPage;
	}

	public void setCntPage(int cntPage) {
		this.cntPage = cntPage;
	}
	
	
	public PagingVO(int total, int curPage, int pageEa) {
		setTotal(total);
		setPageEa(pageEa);
		setCurPage(curPage);
		LastPageCal(getTotal(),getPageEa());
		StartEndPageCal(getCurPage(),cntPage);
		StartEndCal(getCurPage(),getPageEa());
	}
	
	public void LastPageCal(int total,int pageEa) {
		setLastPage((int)Math.ceil( (double)total/(double)pageEa) );
	}
	public void StartEndPageCal(int curPage,int cntPage) {
		
		setEndPage( ( (int)Math.ceil( (double)curPage/(double)cntPage ) )*cntPage);
		if(getLastPage()<getEndPage()) {
			setEndPage(getLastPage());
		}
		setStartPage(getEndPage()-cntPage+1);
		if(getStartPage() < 1) {
			setStartPage(1);
		}
		
	}
	public void StartEndCal(int curPage,int pageEa) {
		setEnd(curPage * pageEa);
		setStart(getEnd()-pageEa+1);
		
	}
	
	@Override
	public String toString() {
		return "PagingVO [curPage=" + curPage + ", startPage=" + startPage + ", endPage=" + endPage + ", total=" + total
				+ ", pageEa=" + pageEa + ", lastPage=" + lastPage + ", start=" + start + ", end=" + end + ", cntPage="
				+ cntPage + "]";
	}
	
	
	
}
	