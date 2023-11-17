package com.kidzpark.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kidzpark.admin.mapper.AdminMapper;
import com.kidzpark.cs.domain.CsVo;
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
	
	
}
