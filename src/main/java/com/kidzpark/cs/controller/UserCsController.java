package com.kidzpark.cs.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kidzpark.cs.domain.CsVo;
import com.kidzpark.cs.domain.ImgFile;
import com.kidzpark.cs.mapper.CsMapper;
import com.kidzpark.paging.PagingVo;

@Controller
public class UserCsController {

	@Autowired
	private CsMapper csMapper;
	
	
	@RequestMapping("/UserCsList")
	public ModelAndView userCsList(CsVo vo, PagingVo pds,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage
			) {
		
		int total  =  csMapper.countCsList(vo);
		
		if (nowPage == null && cntPerPage == null ) {
			nowPage  = "1";
			cntPerPage = "8";
		} else if(nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "8";
		}
		
		int u_no  =  vo.getU_no();
		
		Map<String, Object> map  =  new HashMap<>();
		pds  =  new PagingVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));		
		map.put("pds", pds);
		map.put("u_no", u_no);
		map.put("start", pds.getStart());
		map.put("end", pds.getEnd());
		map.put("vo", vo);
		
		
		
		List<CsVo> userCsList  =  csMapper.userCsList(map);
		System.out.println("tqtq : " + userCsList);
		
		ModelAndView mv  =  new ModelAndView();
		mv.setViewName("cs/usercs");
		mv.addObject("csList", userCsList);
		mv.addObject("pg", pds);
		mv.addObject("u_no", u_no);
		
		return mv;
	}
	
	@RequestMapping("/UserCsWriteForm")
	public String csWriteForm() {
		
		return "cs/usercswrite";
	}
	
	@PostMapping("/UserCsWrite")
	public ModelAndView csWrtie(
			@RequestParam MultipartFile cs_img,
			@RequestParam HashMap<String, Object> map,
			HttpServletRequest request
			) {
		
		if(!cs_img.isEmpty() ) {
			ImgFile.save(map, request);
			System.out.println("map 1 : " + map);
			csMapper.insertCsFile(map);
		} else {
			System.out.println("map 2 : " + map);
			csMapper.insertCsNoFile(map);
		}
		
		
		
		ModelAndView mv  =  new ModelAndView();
		mv.setViewName("redirect:/UserCsList?u_no=1");
		return mv;
	}
	
	@RequestMapping("/UserCsView")
	public ModelAndView csView(CsVo vo) {
		
		List<CsVo> csView  =  csMapper.csView(vo);
		System.out.println("csView : " + csView);
		ModelAndView mv  =  new ModelAndView();
		mv.setViewName("cs/usercsview");
		mv.addObject("view", csView);
		return mv;
	}
	
	@PostMapping("/CsAnswer")
	@ResponseBody
	public ModelAndView csAnswer(CsVo vo) {
		
		System.out.println(vo);
		csMapper.csAnswer(vo);
		
		ModelAndView mv  =  new ModelAndView();
		mv.setViewName("redirect:/UserCsView?cs_idx=" + vo.getCs_idx());
		
		return mv; 
	}
	
	
}
