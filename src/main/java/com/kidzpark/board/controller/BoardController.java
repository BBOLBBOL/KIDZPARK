package com.kidzpark.board.controller;


import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kidzpark.board.domain.BoardVo;
import com.kidzpark.board.mapper.BoardMapper;
import com.kidzpark.kidzzone.domain.KidzzoneVo;
import com.kidzpark.paging.PagingVo;


@Controller
public class BoardController {
	
	@Autowired
	private BoardMapper boardMapper; 
	
	// 목록
	@RequestMapping("/BoardList")
	public ModelAndView boardlist( BoardVo vo, PagingVo pg, int m_no,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> map = new HashMap<String, Object>(); 
		
		map.put("m_no", m_no);
		
		String m_name = boardMapper.selectMenuname(map);
		
		int total = boardMapper.countboard(map);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		
		pg = new PagingVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

		map.put("pg", pg);
		
		List<BoardVo> getboardlist = boardMapper.getboardlist(map);
		
		mv.addObject("getboardlist", getboardlist);
		mv.addObject("pg", pg);
		mv.addObject("m_name", m_name);
		mv.addObject("m_no", m_no);
		
		mv.setViewName("board/board");
		
		System.out.println(mv);

		
		return mv;
	}
	
	@RequestMapping("/BoardSearchList")
	@ResponseBody
	public ModelAndView getBoardSearchList(BoardVo vo, PagingVo pg, int m_no,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			 @RequestParam(value = "searchOption", required = false) String searchOption,
			@RequestParam(value = "searchKeyword", required = false) String searchKeyword)
			throws Exception {
		
		if (searchOption.equals("all") || searchKeyword.equals("")) {
			ModelAndView mv = new ModelAndView();
			
			Map<String, Object> map = new HashMap<String, Object>(); 
			
			map.put("m_no", m_no);
			
			String m_name = boardMapper.selectMenuname(map);
			
			int total = boardMapper.countboard(map);
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "5";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) {
				cntPerPage = "5";
			}
			
			pg = new PagingVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

			map.put("pg", pg);
			
			List<BoardVo> boardsearchlist = boardMapper.getboardlist(map);
			
			mv.addObject("boardsearchlist", boardsearchlist);
			mv.addObject("pg", pg);
			mv.addObject("m_name", m_name);
			mv.addObject("m_no", m_no);
			
			mv.setViewName("board/boardsearch");
			

			System.out.println(mv);
			System.out.println("전체검색");
			
			return mv;
			
		} else {
			
			ModelAndView mv = new ModelAndView();

			Map<String, Object> map = new HashMap<String, Object>();

			map.put("searchKeyword", searchKeyword);
			map.put("searchOption", searchOption);
			map.put("m_no", m_no);
			
			String m_name = boardMapper.selectMenuname(map);

			int total = boardMapper.countBoardSearchList(map);
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "5";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) {
				cntPerPage = "5";
			}
			
			pg = new PagingVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

			map.put("pg", pg);

			List<KidzzoneVo>boardsearchlist = boardMapper.selectBoardSearchList(map);

			mv.addObject("boardsearchlist", boardsearchlist);
			mv.addObject("pg", pg);
			mv.addObject("m_name", m_name);
			mv.addObject("m_no", m_no);
			mv.addObject("searchKeyword", searchKeyword);
			mv.addObject("searchOption", searchOption);
			
			mv.setViewName("board/boardsearch");
			
			System.out.println(mv);
			System.out.println("검색어검색");
			
			return mv;
		}

	}
	
	//새글 쓰기
	@RequestMapping("/BoardWriteForm")
	public ModelAndView BoardWriteForm(int m_no) {
		
		// write.jsp
		ModelAndView mv = new ModelAndView();
		String m_name = boardMapper.selectMenuname(m_no);
		mv.setViewName("board/boardwrite");
		mv.addObject("m_no", m_no);
		mv.addObject("m_name", m_name);
		
		
		return mv;
	}
	
	//새글 쓰기
	@RequestMapping("/BoardWrite")
	public ModelAndView wirte(@RequestParam MultipartFile b_img,
			@RequestParam HashMap<String, Object> map, HttpServletRequest request ) {
		
		if(!b_img.isEmpty() ) {
			ImgFile.save( map, request );
			boardMapper.BoardWrite2(map);
		} else {
			boardMapper.BoardWrite1(map);
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/BoardList?m_no="+map.get("m_no"));
		return mv;
		
	}
	
	// 글 내용보기
	@RequestMapping("/BoardView")
	public ModelAndView view(@RequestParam HashMap<String, Object> map) {
		
		System.out.println(map);
		
		
		boardMapper.updateReadcount(map);
		
		String m_name = boardMapper.selectMenuname(map);
		
		map.put("m_name", m_name);
		
		List<BoardVo> boardView = boardMapper.boardView(map);
		
		ModelAndView mv = new ModelAndView();
		
		map.put("m_name", m_name);
	
		mv.setViewName("board/boardview");
		mv.addObject("boardView",boardView);
		mv.addObject("map", map);
		System.out.println(mv);
	
		return mv;
		
	}
	
	// 글 지우기
	@RequestMapping("/Delete")
	public ModelAndView delete(@RequestParam HashMap<String, Object> map) {
		
		boardMapper.boardDelete(map);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/List");

		return mv;
	}
	
	//  수정 폼
		@RequestMapping("/UpdateForm")
		public ModelAndView UpdateForm(@RequestParam HashMap<String, Object> map) {
			
			ModelAndView mv = new ModelAndView();
			List<BoardVo> boardView = boardMapper.boardView(map);
			
			mv.setViewName("update");
			mv.addObject("update", boardView);
			
			return mv;
		}
		
	// 수정 하기
	@RequestMapping("/Update")
	public ModelAndView update(@RequestParam HashMap<String, Object> map) {
		
		boardMapper.boardUpdate(map);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/View?bno="+map.get("bno"));
		
		
		return mv;
	}
	

}
