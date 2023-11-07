package com.board.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.board.domain.BoardVo;
import com.board.mapper.BoardMapper;


@Controller
public class BoardController {
	
	@Autowired
	private BoardMapper boardMapper; 
	
	// 목록
	@RequestMapping("/List")
	public ModelAndView list() {
		List<BoardVo> boardList = boardMapper.boardList();

		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("list");
		mv.addObject("boardList", boardList);
		
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
