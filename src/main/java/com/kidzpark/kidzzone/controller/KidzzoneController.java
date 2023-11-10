package com.kidzpark.kidzzone.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kidzpark.kidzzone.domain.KidzzonePagingVo;
import com.kidzpark.kidzzone.domain.KidzzoneVo;
import com.kidzpark.kidzzone.mapper.KidzzoneMapper;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class KidzzoneController {

	@Autowired
	private KidzzoneMapper kidzzonemapper;

	@RequestMapping("/Kidzzone")
	public ModelAndView kidzzone(KidzzoneVo vo, KidzzonePagingVo pg,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage
			) {

			int total = kidzzonemapper.countKiddzone(vo);
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "4";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) {
				cntPerPage = "4";
			}

			pg = new KidzzonePagingVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

			List<KidzzoneVo> selectkiddzone = kidzzonemapper.selectKiddzone(pg);

			ModelAndView mv = new ModelAndView();

			mv.setViewName("kidzzone/kidzzone");
			mv.addObject("selectkiddzone", selectkiddzone);
			mv.addObject("pg", pg);
			
			ObjectMapper mapper = new ObjectMapper();
			String json = "";
			try {
			    json = mapper.writeValueAsString(mv.getModel());
			    System.out.println(json);
			} catch (Exception e) {
			    e.printStackTrace();
			}
			mv.addObject("json", json);
			
			
			System.out.println("json:" + json);
			return mv;

		}

	
		/*
		 * @RequestMapping("/Kidzzone2") public ModelAndView kidzzone2(KidzzoneVo vo,
		 * KidzzonePagingVo pg,
		 * 
		 * @RequestParam(value = "nowPage", required = false) String nowPage,
		 * 
		 * @RequestParam(value = "cntPerPage", required = false) String cntPerPage,
		 * 
		 * @RequestParam("searchoption") String searchoption,
		 * 
		 * @RequestParam("kz_location") String kz_location,
		 * 
		 * @RequestParam("searchKeyword") String searchKeyword) {
		 * 
		 * String kz_category = vo.getKz_category(); if (kz_category == null ||
		 * searchoption == null || searchKeyword== null || kz_location == null ) { int
		 * total = kidzzonemapper.countKiddzone1(vo); if (nowPage == null && cntPerPage
		 * == null) { nowPage = "1"; cntPerPage = "4"; } else if (nowPage == null) {
		 * nowPage = "1"; } else if (cntPerPage == null) { cntPerPage = "4"; }
		 * 
		 * pg = new KidzzonePagingVo(total, Integer.parseInt(nowPage),
		 * Integer.parseInt(cntPerPage));
		 * 
		 * List<KidzzoneVo> selectkiddzone = kidzzonemapper.selectKiddzone1(pg, vo);
		 * 
		 * ModelAndView mv = new ModelAndView();
		 * 
		 * mv.setViewName("kidzzone/kidzzone"); mv.addObject("selectkiddzone",
		 * selectkiddzone); mv.addObject("pg", pg);
		 * 
		 * return mv;
		 * 
		 * } else { int total = kidzzonemapper.countKiddzone2(vo, searchoption,
		 * searchKeyword); if (nowPage == null && cntPerPage == null) { nowPage = "1";
		 * cntPerPage = "4"; } else if (nowPage == null) { nowPage = "1"; } else if
		 * (cntPerPage == null) { cntPerPage = "4"; }
		 * 
		 * pg = new KidzzonePagingVo(total, Integer.parseInt(nowPage),
		 * Integer.parseInt(cntPerPage));
		 * 
		 * List<KidzzoneVo> selectkiddzone = kidzzonemapper.selectKiddzone2(pg, vo,
		 * searchoption, searchKeyword);
		 * 
		 * ModelAndView mv = new ModelAndView();
		 * 
		 * mv.setViewName("kidzzone/kidzzone"); mv.addObject("selectkiddzone",
		 * selectkiddzone); mv.addObject("pg", pg); return mv; }
		 * 
		 * }
		 */

}
