package com.kidzpark.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kidzpark.admin.domain.ImgFileAdmin;
import com.kidzpark.admin.mapper.AdminMapper;
import com.kidzpark.board.controller.ImgFile;
import com.kidzpark.board.domain.BoardVo;
import com.kidzpark.cs.domain.CsVo;
import com.kidzpark.kidzzone.domain.KidzzoneVo;
import com.kidzpark.paging.PagingVo;
import com.kidzpark.user.domain.UserVo;

@Controller
public class AdminController {

	@Autowired
	private AdminMapper adminMapper;
	
	@RequestMapping("/CsList")
	public ModelAndView csList(CsVo vo, PagingVo pds,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage
			) {
		
		int total  =  adminMapper.countAdminCsList(vo);  
		if (nowPage == null && cntPerPage == null ) {
			nowPage  = "1";
			cntPerPage = "8";
		} else if(nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "8";
		}
		int cs_idx  =  vo.getCs_idx();
		pds  =  new PagingVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		List<CsVo> AdminCsList  =  adminMapper.AdminCsList(pds);
		
		ModelAndView mv  =  new ModelAndView();
		mv.setViewName("admin/admincs");
		mv.addObject("admincsList", AdminCsList);
		mv.addObject("pds", pds);
		mv.addObject("cs_idx", cs_idx);
		
		
		return mv;
	}
	
	@RequestMapping("/AdminUserList")
	public ModelAndView userList(UserVo vo, PagingVo pds,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage
			) {
		
		int total  =  adminMapper.countAdminUserList(vo);  
		
		if (nowPage == null && cntPerPage == null ) {
			nowPage  = "1";
			cntPerPage = "8";
		} else if(nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "8";
		}
		
		pds  =  new PagingVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		int u_no  =  vo.getU_no();
		List<UserVo> userList  =  adminMapper.userList(pds);
		
		System.out.println(userList);
		
		ModelAndView mv  =  new ModelAndView();
		mv.setViewName("admin/userlist");
		mv.addObject("pds", pds);
		mv.addObject("userList", userList);
		mv.addObject("u_no", u_no);
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("/AdminUserDelete")
	public int userListDelete(@RequestParam(value = "valueArr[]")String[] valueArr, UserVo vo) {
		
		for (String value : valueArr) {
			 vo.setU_no(Integer.parseInt(value));
			 adminMapper.userListDelete(vo);
		}
		
		
		return 1;
	}
	
	@RequestMapping("/KzWriteForm")
	public ModelAndView kzWriteForm(KidzzoneVo vo) {
		
		ModelAndView mv  =  new ModelAndView();
		mv.setViewName("admin/kidzzonewrite");
		
		return mv;
	}
	
	@RequestMapping("/KzWrite")
	public ModelAndView kzWrite(@RequestParam MultipartFile kz_img,
			@RequestParam HashMap<String, Object> map,
			HttpServletRequest request
			) {
		
		if(!kz_img.isEmpty()) {
			ImgFileAdmin.save(map, request);
			adminMapper.insertFileKz(map);		
		} else {
			adminMapper.insertNoFileKz(map);
		}
		
		ModelAndView mv  =  new ModelAndView();
		mv.setViewName("redirect:/Kidzzone");
		
		return mv;
	}
	
	@RequestMapping("/NoticeList")
	public ModelAndView noticeList(BoardVo vo, PagingVo pds, int m_no,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage
			) {
		
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
		mv.setViewName("admin/noticelist");
		mv.addObject("noticeList", noticeList);
		mv.addObject("pg", pds);
		mv.addObject("b_idx", vo.getB_idx());
		mv.addObject("m_no", vo.getM_no());
		System.out.println("mv : " + mv);
		return mv;
	}
	
	
	@RequestMapping("/NoticeWriteForm")
	public String noticeWriteForm() {
		
		
		return "admin/noticewrite";
	}
	
	@RequestMapping("/NoticeWrite")
	public String noticeWrite(@RequestParam MultipartFile b_img,
			@RequestParam HashMap<String, Object> map,
			HttpServletRequest request
			) {
		
		if(!b_img.isEmpty()) {
			ImgFile.save(map, request);
			adminMapper.insertNoticeFile(map);	
		} else {
			adminMapper.insertNoticeNoFile(map);
		}
		
		
		return "redirect:/NoticeList?m_no=6";
	}
	
	@ResponseBody
	@RequestMapping("/AdmimBoardDelete")
	public int boardDelete(@RequestParam(value = "valueArr[]")String[] valueArr, BoardVo vo) {
		
		for (String value : valueArr) {
			 vo.setB_idx(Integer.parseInt(value));
			 adminMapper.boardDelete(vo);
		}
		
		
		return 1;
	}
	
	
}
