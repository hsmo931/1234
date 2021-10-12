package com.test.board.vo;

public class BoardVO {
private int writenum;
private String title;
private String writer;
private String content;
private String regdate;
private int viewcnt;




@Override
public String toString() {
	return "BoardVO [writenum=" + writenum + ", title=" + title + ", writer=" + writer + ", content=" + content
			+ ", regdate=" + regdate + ", viewcnt=" + viewcnt + "]";
}




public int getWritenum() {
	return writenum;
}
public void setWritenum(int writenum) {
	this.writenum = writenum;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getWriter() {
	return writer;
}
public void setWriter(String writer) {
	this.writer = writer;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public String getRegdate() {
	return regdate;
}
public void setRegdate(String regdate) {
	this.regdate = regdate;
}
public int getViewcnt() {
	return viewcnt;
}
public void setViewcnt(int viewcnt) {
	this.viewcnt = viewcnt;
}

}
