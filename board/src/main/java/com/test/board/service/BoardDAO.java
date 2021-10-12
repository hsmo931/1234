package com.test.board.service;

import java.util.ArrayList;


import com.test.board.vo.BoardVO;
import com.test.board.vo.PagingVO;



public interface BoardDAO {
ArrayList<BoardVO> getAllList();
BoardVO getOneDetail(int writenum);
int insertOneWrite(BoardVO boardVO);
public boolean updateOne(BoardVO boardVO);
public boolean delete(int writenum);
public boolean viewcntUp(int writenum);
//게시물 총 갯수
public int btcnt();

//페이징 처리 게시글 조회
public ArrayList<BoardVO> paging(PagingVO pagingVO);


}