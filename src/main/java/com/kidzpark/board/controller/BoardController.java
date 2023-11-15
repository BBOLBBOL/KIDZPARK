package com.kidzpark.board.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kidzpark.board.domain.BoardVo;
import com.kidzpark.board.mapper.BoardMapper;
import com.kidzpark.paging.PagingVo;


@Controller
public class BoardController {
	
	@Autowired
	private BoardMapper boardMapper; 
	
	// 목록
	@RequestMapping("/boardlist")
	public ModelAndView boardlist( BoardVo vo, PagingVo pg, int m_no,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> map = new HashMap<String, Object>(); 
		
		map.put("m_no", m_no);
		map.put("vo", vo);
		
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
	
	//새글 쓰기
	@RequestMapping("/WriteForm")
	public ModelAndView wirteForm() {
		
		// write.jsp
		ModelAndView mv = new ModelAndView();
		mv.setViewName("write");
		
		return mv;
	}
	
	//새글 쓰기
	@RequestMapping("/Write")
	public ModelAndView wirte(@RequestParam HashMap<String, Object> map) {
		
		boardMapper.boardWrite(map);
		
		// write.jsp
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/List");
		
		return mv;
		
	}
	
	// 글 내용보기
	@RequestMapping("/View")
	public ModelAndView view(BoardVo vo) {
		
		boardMapper.hitUpdate(vo);
		
		List<BoardVo> boardView = boardMapper.boardView(vo);
		
		ModelAndView mv = new ModelAndView();
	
		mv.setViewName("view");
		mv.addObject("boardView",boardView);
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
		public ModelAndView UpdateForm(BoardVo vo) {
			
			ModelAndView mv = new ModelAndView();
			List<BoardVo> boardView = boardMapper.boardView(vo);
			
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
