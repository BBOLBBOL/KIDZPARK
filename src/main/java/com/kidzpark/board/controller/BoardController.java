package com.kidzpark.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kidzpark.admin.mapper.AdminMapper;
import com.kidzpark.board.domain.BoardVo;
import com.kidzpark.board.domain.CommentVo;
import com.kidzpark.board.mapper.BoardMapper;
import com.kidzpark.kidzzone.domain.KidzzoneVo;
import com.kidzpark.paging.PagingVo;

@Controller
public class BoardController {

	@Autowired
	private BoardMapper boardMapper;

	@Autowired
	private AdminMapper adminMapper;
	
	// 목록
	@RequestMapping("/BoardList")
	public ModelAndView boardlist(BoardVo vo, PagingVo pg, int m_no,
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
		List<BoardVo> getnoticelist = boardMapper.getnoticelist(map);
		mv.addObject("getnoticelist", getnoticelist);
		
		mv.addObject("getboardlist", getboardlist);
		mv.addObject("pg", pg);
		mv.addObject("m_name", m_name);
		mv.addObject("m_no", m_no);

		mv.setViewName("board/board");

		return mv;
	}

	@RequestMapping("/BoardSearchList")
	@ResponseBody
	public ModelAndView getBoardSearchList(BoardVo vo, PagingVo pg, int m_no,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam(value = "searchOption", required = false) String searchOption,
			@RequestParam(value = "searchKeyword", required = false) String searchKeyword) throws Exception {

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
			List<BoardVo> getnoticelist = boardMapper.getnoticelist(map);
			mv.addObject("getnoticelist", getnoticelist);

			mv.addObject("boardsearchlist", boardsearchlist);
			mv.addObject("pg", pg);
			mv.addObject("m_name", m_name);
			mv.addObject("m_no", m_no);

			mv.setViewName("board/boardsearch");


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

			List<KidzzoneVo> boardsearchlist = boardMapper.selectBoardSearchList(map);
			List<BoardVo> getnoticelist = boardMapper.getnoticelist(map);
			mv.addObject("getnoticelist", getnoticelist);

			mv.addObject("boardsearchlist", boardsearchlist);
			mv.addObject("pg", pg);
			mv.addObject("m_name", m_name);
			mv.addObject("m_no", m_no);
			mv.addObject("searchKeyword", searchKeyword);
			mv.addObject("searchOption", searchOption);

			mv.setViewName("board/boardsearch");


			return mv;
		}

	}

	// 새글 쓰기
	@RequestMapping("/BoardWriteForm")
	public ModelAndView BoardWriteForm(int m_no, @RequestParam HashMap<String, Object> map) {
		
		System.out.println("폼"+map);
		
		ModelAndView mv = new ModelAndView();
		
		
		if( map.get("ma") != null) {
			mv.addObject("ma", map.get("ma"));
		}
		
		// write.jsp
		String m_name = boardMapper.selectMenuname(m_no);
		mv.setViewName("board/boardwrite");
		mv.addObject("m_no", m_no);
		mv.addObject("m_name", m_name);
		
		System.out.println(mv);

		return mv;
	}

	// 새글 쓰기
	@RequestMapping("/BoardWrite")
	public ModelAndView wirte(@RequestParam MultipartFile b_img, @RequestParam HashMap<String, Object> map,
			HttpServletRequest request) {
		System.out.println(map);

		if (!b_img.isEmpty()) {
			ImgFile.save(map, request);
			boardMapper.boardWrite2(map);
		} else {
			boardMapper.boardWrite1(map);
		}

		ModelAndView mv = new ModelAndView();
		mv.addObject("map", map);
		
		if(map.get("ma") == null  ) {
			mv.setViewName("redirect:/BoardList?m_no="+ map.get("m_no"));
			return mv;
		}
		else {
			mv.setViewName("redirect:/MyArticles?m_no="+ map.get("m_no")+"&u_no="+map.get("u_no")+"&ma="+map.get("ma"));
			return mv;
		}

	}

	// 글 내용보기
	@RequestMapping("/BoardView")
	public ModelAndView view(PagingVo pg, @RequestParam HashMap<String, Object> map, 
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		
		System.out.println(map);
		
		boardMapper.updateReadcount(map);

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

		map.put("m_name", m_name);

		List<BoardVo> boardView = boardMapper.boardView(map);
		
		ModelAndView mv = new ModelAndView();

		
		mv.setViewName("board/boardview");
		mv.addObject("boardView", boardView);
		mv.addObject("map", map);
		mv.addObject("pg", pg);
		if(map.get("ma") != null) {
		mv.addObject("ma", map.get("ma"));
		}
		return mv;

	}
	
	@RequestMapping("/Boardlikeuser")
	@ResponseBody
	public Map<String, Object> boardlikeuser(@RequestParam HashMap<String, Object> map){
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		int boardlikeuser = boardMapper.countboardlikeuser(map);
		result.put("boardlikeuser", boardlikeuser);
		result.put("u_no", map.get("u_no"));
		
		System.out.println("결과"+result);
		
		return result;
	}

	// 글 지우기
	@RequestMapping("/BoardDelete")
	public ModelAndView boarddelete(@RequestParam HashMap<String, Object> map) {
		
		System.out.println(map);

		boardMapper.boardDelete(map);

		ModelAndView mv = new ModelAndView();
		if(map.get("ma") == null ) {
		mv.setViewName("redirect:/BoardList?m_no="+ map.get("m_no"));

		return mv;
		}
		else {
			mv.setViewName("redirect:/MyArticles?m_no="+ map.get("m_no")+"&u_no="+map.get("u_no"));
			return mv;
		}
	}

	// 수정 폼
	@RequestMapping("/BoardUpdateForm")
	public ModelAndView UpdateForm(@RequestParam HashMap<String, Object> map) {

		String m_name = boardMapper.selectMenuname(map);
		
	    System.out.println(map);

		map.put("m_name", m_name);

		List<BoardVo> boardView = boardMapper.boardView(map);

		ModelAndView mv = new ModelAndView();

		mv.addObject("boardView", boardView);
		mv.addObject("map", map);
		
		mv.setViewName("board/boardupdate");
		
		return mv;
	}

	// 수정 하기
	@RequestMapping("/BoardUpdate")
	public ModelAndView update(@RequestParam MultipartFile b_img, @RequestParam HashMap<String, Object> map,
			HttpServletRequest request) {


		if (!b_img.isEmpty()) {
			ImgFile.save(map, request);
			System.out.println(map);
			boardMapper.boardUpdate1(map);
		} else {
			boardMapper.boardUpdate2(map);
		}
		System.out.println(map);

		ModelAndView mv = new ModelAndView();
		if(map.get("ma") == null ) {
			mv.setViewName("redirect:/BoardView?m_no="+ map.get("m_no"));
			
			return mv;
		}
		else {
			mv.setViewName("redirect:/BoardView?m_no="+ map.get("m_no")+"&u_no="+map.get("u_no")+"&ma="+map.get("ma"));
			return mv;
		}

	}
	
	@RequestMapping("/CommentWrite")
	public ModelAndView commentwrite(@RequestParam HashMap<String, Object> map) {
	
	ModelAndView mv = new ModelAndView();
	
	boardMapper.commentWrite(map);
	
	mv.addObject("map",map);
	
	mv.setViewName("redirect:/BoardView?b_idx=" + map.get("b_idx") +"&u_no="+ map.get("u_no")+"&m_no=" + map.get("m_no"));
	
	
	
	return mv;
	}
	
	@RequestMapping("/CommentList")
	@ResponseBody
	public Map<String, Object> commentlist(@RequestParam HashMap<String, Object> map, PagingVo pg,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) throws Exception {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		
		int total = boardMapper.countCommentList(map);
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

		List<CommentVo> commentlist = boardMapper.selectCommentList(map);
		
		result.put("commentlist", commentlist);
		result.put("pg", pg);
		return result;
	}
	
	@RequestMapping("/UserNoticeList")
	public ModelAndView noticeList(BoardVo vo, PagingVo pds, int m_no,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage
			) {
		
		String m_name = boardMapper.selectMenuname(m_no);
		
		Map<String, Object> map  =  new HashMap<>();  
		map.put("m_no", m_no);
		int total  =  adminMapper.countNotice(vo);
		
		if (nowPage == null && cntPerPage == null ) {
			nowPage  = "1";
			cntPerPage = "8";
		} else if(nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "8";
		}
		
		pds  =  new PagingVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		map.put("pg", pds);
		map.put("start", pds.getStart());
		map.put("end", pds.getEnd());
		
		
		
		List<BoardVo> noticeList  =  adminMapper.noticeList(map);
		
		ModelAndView mv  =  new ModelAndView();
		mv.setViewName("board/noticelist");
		mv.addObject("noticeList", noticeList);
		mv.addObject("pg", pds);
		mv.addObject("b_idx", vo.getB_idx());
		mv.addObject("m_no", vo.getM_no());
		mv.addObject("m_name", m_name);
		
		return mv;
	}
	
		
	@RequestMapping("/BoardUnLike")
	public Map<String, Object> boardUnLike(@RequestParam HashMap<String, Object> map){
	
		boardMapper.boardUnLike(map);
		return map;
	
	}
	
	@RequestMapping("/BoardLike")
	public Map<String, Object> boardLike(@RequestParam HashMap<String, Object> map){
		
		boardMapper.boardLike(map);
		return map;
		
	}
	
	@RequestMapping("/MyArticles")
	public ModelAndView myarticles(BoardVo vo, PagingVo pg, int m_no, int u_no,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		
		ModelAndView mv = new ModelAndView();

		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("m_no", m_no);
		map.put("u_no", u_no);

		String m_name = boardMapper.selectMenuname(map);

		int total = boardMapper.countMyarticles(map);
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

		List<BoardVo> myarticles = boardMapper.getmyarticles(map);
		
		mv.addObject("myarticles", myarticles);
		mv.addObject("pg", pg);
		mv.addObject("m_name", m_name);
		mv.addObject("m_no", m_no);

		mv.setViewName("board/myarticles");

		return mv;
	}
	
	@RequestMapping("/SearchArticles")
	@ResponseBody
	public ModelAndView searcharticles(BoardVo vo, PagingVo pg, int m_no, int u_no,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam(value = "searchOption", required = false) String searchOption,
			@RequestParam(value = "searchKeyword", required = false) String searchKeyword) throws Exception {

		if (searchOption.equals("all") || searchKeyword.equals("")) {
			ModelAndView mv = new ModelAndView();

			Map<String, Object> map = new HashMap<String, Object>();

			map.put("m_no", m_no);
			map.put("u_no", u_no);

			String m_name = boardMapper.selectMenuname(map);

			int total = boardMapper.countMyarticles(map);
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

			List<BoardVo> myarticles = boardMapper.getmyarticles(map);

			mv.addObject("myarticles", myarticles);
			mv.addObject("pg", pg);
			mv.addObject("m_name", m_name);
			mv.addObject("m_no", m_no);

			mv.setViewName("board/myarticles");


			return mv;

		} else {
			

			ModelAndView mv = new ModelAndView();

			Map<String, Object> map = new HashMap<String, Object>();

			map.put("searchKeyword", searchKeyword);
			map.put("searchOption", searchOption);
			map.put("m_no", m_no);
			map.put("u_no", u_no);


			String m_name = boardMapper.selectMenuname(map);

			int total = boardMapper.countSearchArticles(map);
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

			List<BoardVo> searcharticles = boardMapper.getSearchArticles(map);

			mv.addObject("searcharticles", searcharticles);
			mv.addObject("pg", pg);
			mv.addObject("m_name", m_name);
			mv.addObject("m_no", m_no);
			mv.addObject("searchKeyword", searchKeyword);
			mv.addObject("searchOption", searchOption);

			mv.setViewName("board/searcharticles");


			return mv;
		}

	}
	
	
	
}
