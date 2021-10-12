package com.test.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.board.service.BoardService;
import com.test.board.vo.BoardVO;
import com.test.board.vo.PagingVO;

@Controller
public class BoardController {
	@Resource(name = "boardService") /////////////////
	private BoardService boardService; ///////////////

	@RequestMapping(value = "/boardAll.do")
	public String boardAll(PagingVO pagingVO, Model model,
			@RequestParam(value = "curPage", required = false) String curPage,
			@RequestParam(value = "pageEa", required = false) String pageEa) {
		int total = boardService.btcnt();
		if (curPage == null & pageEa == null) {
			curPage = "1";
			pageEa = "10";
		} else if (curPage == null) {
			curPage = "1";
		} else if (pageEa == null) {
			pageEa = "10";
		}
		pagingVO = new PagingVO(total, Integer.parseInt(curPage), Integer.parseInt(pageEa));
		model.addAttribute("paging", pagingVO);
		model.addAttribute("alist", boardService.paging(pagingVO));
		/* System.out.println(boardService.paging(pagingVO)); VO test */
		return "boardlist";

	}

	@RequestMapping(value = "/writepage.do")
	public String writepage() {
		return "writepage";

	}

	@RequestMapping(value = "/writingdetail.do")
	public String getOneDetail(@RequestParam("writenum") int writenum, Model model) {

		model.addAttribute("writingdetail", boardService.getOneDetail(writenum));
		boardService.viewcntUp(writenum);
		return "writingdetail";

	}

	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	public String insertOneWrite(@ModelAttribute("boardVO") BoardVO boardVO) {
		boardService.insertOneWrite(boardVO);
		return "redirect:/writingdetail.do?writenum=" + boardVO.getWritenum();

	}

	@RequestMapping(value = "/updatepage.do")
	public String updatepage(@RequestParam("writenum") int writenum, Model model) {
		model.addAttribute("board", boardService.getOneDetail(writenum));
		return "updatepage";

	}

	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public String updateOne(@RequestParam("writenum") int writenum, BoardVO boardVO) {
		boardService.updateOne(boardVO);
		return "redirect:/writingdetail.do?writenum=" + writenum;
	}

	@RequestMapping(value = "/delete.do")
	public String deleteOne(@RequestParam("writenum") int writenum) {
		boardService.delete(writenum);
		return "redirect:/boardAll.do";
	}
	/* ajax게시판 관련 */

	@RequestMapping(value = "/ajaxboard.do")
	public String ajaxboard() {
		return "/ajax/ajaxboard";
	}

	@RequestMapping(value = "/ajaxboardlist.do", method = RequestMethod.POST)
	public ResponseEntity<HashMap<String, Object>> ajaxboardlist(PagingVO pagingVO, ArrayList<BoardVO> boardVO,
			@RequestBody(required = false) Map<String, Object> param, String curPage, String pageEa, Model model) {
		HashMap<String, Object> result = new HashMap<>();
		int total = boardService.btcnt();
		pageEa = "10";
	/*	System.out.println(param);*/
		curPage = String.valueOf(param.get("curPage"));
		pagingVO = new PagingVO(total, Integer.parseInt(curPage), Integer.parseInt(pageEa));
		boardVO = boardService.paging(pagingVO);
		result.put("pagingVO", pagingVO);
		result.put("boardVO", boardVO);

		/* System.out.println(boardService.paging(pagingVO)); VO test */
		return ResponseEntity.ok(result);

	}
	@RequestMapping(value = "/ajaxwritepage.do")
	public String ajaxwritepage() {
		return "/ajax/ajaxwritepage";

	}
	@RequestMapping(value = "/ajaxwritingdetail.do")
	public String getajaxOneDetail(@RequestParam("writenum") int writenum, Model model) {

		model.addAttribute("writingdetail", boardService.getOneDetail(writenum));
		boardService.viewcntUp(writenum);
		return "/ajax/ajaxwritingdetail";

	}

	@RequestMapping(value = "/ajaxwrite.do", method = RequestMethod.POST)
	public String ajaxinsertOneWrite(@ModelAttribute("boardVO") BoardVO boardVO) {
		boardService.insertOneWrite(boardVO);
		return "redirect:/ajaxwritingdetail.do?writenum=" + boardVO.getWritenum();

	}

	@RequestMapping(value = "/ajaxupdatepage.do")
	public String ajaxupdatepage(@RequestParam("writenum") int writenum, Model model) {
		model.addAttribute("board", boardService.getOneDetail(writenum));
		return "/ajax/ajaxupdatepage";

	}

	@RequestMapping(value = "/ajaxupdate.do", method = RequestMethod.POST)
	public String ajaxupdateOne(@RequestParam("writenum") int writenum, BoardVO boardVO) {
		boardService.updateOne(boardVO);
		return "redirect:/ajaxwritingdetail.do?writenum=" + writenum;
	}

	@RequestMapping(value = "/ajaxdelete.do")
	public String ajaxdeleteOne(@RequestParam("writenum") int writenum) {
		boardService.delete(writenum);
		return "redirect:/ajaxboard.do";
	}
}
