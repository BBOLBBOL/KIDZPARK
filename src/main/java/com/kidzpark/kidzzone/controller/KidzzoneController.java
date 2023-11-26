package com.kidzpark.kidzzone.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kidzpark.kidzzone.domain.ImgFile;
import com.kidzpark.kidzzone.domain.KidzzoneVo;
import com.kidzpark.kidzzone.domain.ReviewVo;
import com.kidzpark.kidzzone.mapper.KidzzoneMapper;
import com.kidzpark.paging.PagingVo;
import com.kidzpark.user.domain.UserVo;
import com.kidzpark.user.mapper.LoginMapper;

@Controller
public class KidzzoneController {

	@Autowired
	private KidzzoneMapper kidzzoneMapper;

	
	@ResponseBody
	@RequestMapping(value = "/Kidzzone", method = RequestMethod.GET)
	public ModelAndView kidzzone(KidzzoneVo vo, HttpServletRequest request) {
		
		 HttpSession session = request.getSession();
		 UserVo loginVo  =  (UserVo) session.getAttribute("loginVo");
		 int u_no  =  (loginVo != null) ? loginVo.getU_no() : 0;
		
		 
		 
		 
		List<KidzzoneVo> selectkiddzone = kidzzoneMapper.selectKiddzone(u_no);
		

		
		
		
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("selectkiddzone", selectkiddzone);

		mv.setViewName("kidzzone/kidzzone");
		
		
		ObjectMapper mapper = new ObjectMapper();

		String json = "";
		try {
			json = mapper.writeValueAsString(mv.getModel());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("json", json);
		
		

		return mv;

	}

	@RequestMapping("/KidzzoneList")
	@ResponseBody
	public Map<String, Object> getKidzzonelist(KidzzoneVo vo, PagingVo pg,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();

		int total = kidzzoneMapper.countKiddzone(vo);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}

		pg = new PagingVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

		List<KidzzoneVo> selectkiddzone = kidzzoneMapper.selectKiddzonelist(pg);
		
		

		result.put("selectkiddzone", selectkiddzone);
		result.put("pg", pg);
		return result;
	}

	@RequestMapping("/KidzzoneSearch")
	@ResponseBody
	public ModelAndView KidzzoneSearch(KidzzoneVo vo, @RequestParam("searchOption") String searchOption, HttpServletRequest request,
			@RequestParam("kz_category") String kz_category, @RequestParam("kz_location") String kz_location,
			@RequestParam("searchKeyword") String searchKeyword) {

		if (kz_category.equals("all") && kz_location.equals("all")
				&& (searchOption.equals("all") || searchKeyword.equals(""))) {
			Map<String, Object> map = new HashMap<>();
			map.put("kz_location", kz_location);
			map.put("searchKeyword", searchKeyword);
			map.put("searchOption", searchOption);
			map.put("kz_category", kz_category);
			
			 HttpSession session = request.getSession();
			 UserVo loginVo  =  (UserVo) session.getAttribute("loginVo");
			 int u_no  =  (loginVo != null) ? loginVo.getU_no() : 0;
			
			List<KidzzoneVo> selectkiddzone = kidzzoneMapper.selectKiddzone(u_no);

			ModelAndView mv = new ModelAndView();

			mv.addObject("selectkiddzone", selectkiddzone);

			mv.setViewName("kidzzone/kidzzonesearch");

			ObjectMapper mapper = new ObjectMapper();

			String json = "";
			try {
				json = mapper.writeValueAsString(mv.getModel());
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			mv.addObject("json", json);
			
			mv.addObject("map", map);

			

			return mv;

		} else {

			Map<String, Object> map = new HashMap<>();
			map.put("kz_location", kz_location);
			map.put("searchKeyword", searchKeyword);
			map.put("searchOption", searchOption);
			map.put("kz_category", kz_category);
			HttpSession session = request.getSession();
			UserVo loginVo  =  (UserVo) session.getAttribute("loginVo");
			int u_no  =  (loginVo != null) ? loginVo.getU_no() : 0;
			map.put("u_no", u_no);
			
			List<KidzzoneVo> selectkiddzone = kidzzoneMapper.selectKiddzoneSearch(map);

			ModelAndView mv = new ModelAndView();

			mv.addObject("selectkiddzone", selectkiddzone);

			mv.setViewName("kidzzone/kidzzonesearch");
			
			mv.addObject("map", map);

			ObjectMapper mapper = new ObjectMapper();

			String json = "";
			try {
				json = mapper.writeValueAsString(mv.getModel());
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			mv.addObject("json", json);

			

			return mv;
		}
	}

	@RequestMapping("/KidzzoneSearchList")
	@ResponseBody
	public Map<String, Object> getKidzzoneSearchlist(KidzzoneVo vo, PagingVo pg,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam("kz_category") String kz_category, @RequestParam("searchOption") String searchOption,
			@RequestParam("kz_location") String kz_location, @RequestParam("searchKeyword") String searchKeyword)
			throws Exception {
		
		if (kz_category.equals("all") && kz_location.equals("all")
				&& (searchOption.equals("all") || searchKeyword.equals(""))) {
			Map<String, Object> result = new HashMap<String, Object>();
			Map<String, Object> map = new HashMap<String, Object>();

			map.put("kz_location", kz_location);
			map.put("searchKeyword", searchKeyword);
			map.put("searchOption", searchOption);
			map.put("kz_category", kz_category);
			map.put("pg", pg);

			int total = kidzzoneMapper.countKiddzoneSearch1(map);
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "4";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) {
				cntPerPage = "4";
			}
			
			pg = new PagingVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

			List<KidzzoneVo> selectkiddzone = kidzzoneMapper.selectKidzzoneSearchlist1(map);

			result.put("selectkiddzone", selectkiddzone);
			result.put("pg", pg);
			
			return result;
		} else {

			Map<String, Object> result = new HashMap<String, Object>();

			Map<String, Object> map = new HashMap<String, Object>();

			map.put("kz_location", kz_location);
			map.put("searchKeyword", searchKeyword);
			map.put("searchOption", searchOption);
			map.put("kz_category", kz_category);
			

			int total = kidzzoneMapper.countKiddzoneSearch2(map);
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "4";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) {
				cntPerPage = "4";
			}
			
			pg = new PagingVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

			map.put("pg", pg);

			List<KidzzoneVo> selectkiddzone = kidzzoneMapper.selectKidzzoneSearchlist2(map);

			result.put("selectkiddzone", selectkiddzone);
			result.put("pg", pg);
			
			return result;
		}

	}
	
	@RequestMapping("/KidzzoneReview")
	@ResponseBody
	public HashMap<String, Object> kidzzoneReview(
			@RequestParam HashMap<String, Object> map
			) {
		
		
		    List<ReviewVo> reviewList  =  kidzzoneMapper.reviewList(map);
		    
		    String kz_name  =  kidzzoneMapper.kz_name(map);
		    
		    map.put("reviewList", reviewList);
		    map.put("kz_name", kz_name);
		    

			
			
			return map;
		
	}

	@RequestMapping("/SaveReview")
	@ResponseBody
	public HashMap<String, Object> saveReview(@RequestParam HashMap<String, Object> map,
			@RequestParam MultipartFile r_reviewimg,
			@RequestParam String r_review,
			@RequestParam int kz_no,
			@RequestParam int u_no,
			HttpServletRequest request
			) {
		
		map.put("kz_no", kz_no);
		map.put("u_no", u_no);
		
		if(!r_reviewimg.isEmpty()) {
			ImgFile.save(map, request);
			kidzzoneMapper.insertReviewFile(map);
		} else {
			kidzzoneMapper.insertReviewNoFile(map);
		}
		
		
		return map;
	}
	
	@DeleteMapping("/DeleteReview")
	@ResponseBody
	public HashMap<String, Object> deleteReview(@RequestParam int r_no, @RequestParam int u_no,
			@RequestParam HashMap<String, Object> map
			) {
		
		map.put("r_no", r_no);
		map.put("u_no", u_no);
		kidzzoneMapper.deleteReview(map);
		
		return map;
	}
	
	
	@RequestMapping("/KidzzoneLike") 
	@ResponseBody
		public HashMap<String, Object> kidzzoneLike(@RequestParam HashMap<String, Object> map ) {

			kidzzoneMapper.kidzzoneLike(map);
			
			
			return map;
		}
	
	@RequestMapping("/KidzzoneUnLike")
	@ResponseBody
	public HashMap<String, Object> kidzzoneUnLike(@RequestParam HashMap<String, Object> map ) {
		
		kidzzoneMapper.kidzzoneUnLike(map);
		
		
		return map;
	}
	
	@RequestMapping("/UserLikeList")
	public ModelAndView userLikeList(HashMap<String, Object> map, PagingVo pds, int u_no, ReviewVo vo,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage
			) {

		int total  =  kidzzoneMapper.countUserLikeList(vo);
		
		if (nowPage == null && cntPerPage == null ) {
			nowPage  = "1";
			cntPerPage = "8";
		} else if(nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "8";
		}
		
		pds  =  new PagingVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		map.put("pds", pds);
		map.put("start", pds.getStart());
		map.put("end", pds.getEnd());
		map.put("u_no", u_no);
		List<ReviewVo>userLikeList  =  kidzzoneMapper.userLikeList(map);
		
		
		ModelAndView mv  =  new ModelAndView();
		mv.setViewName("kidzzone/userlikelist");
		mv.addObject("LikeList", userLikeList);
		mv.addObject("pds", pds);
		return mv;
	}
	
	@RequestMapping("/UserLikeDelete")
	@ResponseBody
	public int userLikeDelete(@RequestParam(value="valueArr[]") String[] valueArr, ReviewVo vo) {
		
		for (String value : valueArr) {
			vo.setKz_no(Integer.parseInt(value));
			kidzzoneMapper.userLikeDelete(vo);
		}
		
		
		return 1;
	}
	
	
}
