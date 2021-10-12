package com.test.board.service;

import java.util.ArrayList;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.board.vo.BoardVO;
import com.test.board.vo.PagingVO;


@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boarddao;

	@Override
	public ArrayList<BoardVO> getAllList() {
		// TODO Auto-generated method stub
		return boarddao.getAllList();
	}

	@Override
	public BoardVO getOneDetail(int writenum) {
		// TODO Auto-generated method stub
		return boarddao.getOneDetail(writenum);
	}


	@Override
	public int insertOneWrite(BoardVO boardVO) {
/*		String title=boardVO.getTitle();
		String content=boardVO.getContent();
		String writer=boardVO.getWriter();
		title=title.replace("<", "&lt;");
		title=title.replace(">","&gt;");
		writer=writer.replace("<","&lt;");
		writer=writer.replace(">", "&gt;");
		title=title.replace("  ", "&nbsp;&nbsp;");
		writer=writer.replace("  ","&nbsp;&nbsp;");
		content=content.replace("\n", "<br>");
		boardVO.setTitle(title);
		boardVO.setContent(content);
		boardVO.setWriter(writer);*/
		return boarddao.insertOneWrite(boardVO);
		// TODO Auto-generated method stub	
	
	}

	@Override
	public boolean updateOne(BoardVO boardVO) {
		// TODO Auto-generated method stub
		return boarddao.updateOne(boardVO);
	}

	@Override
	public boolean delete(int writenum) {
		// TODO Auto-generated method stub
		return boarddao.delete(writenum);
	}

	@Override
	public boolean viewcntUp(int writenum) {
		// TODO Auto-generated method stub
		return boarddao.viewcntUp(writenum);
	}



	@Override
	public int btcnt() {
		// TODO Auto-generated method stub
		return boarddao.btcnt();
	}

	@Override
	public ArrayList<BoardVO> paging(PagingVO pagingVO) {
		// TODO Auto-generated method stub
		return boarddao.paging(pagingVO);
	}



	


}
