package com.kidzpark.login.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kidzpark.user.domain.ImgFile;
import com.kidzpark.user.domain.UserVo;
import com.kidzpark.user.mapper.LoginMapper;

@Controller
public class LoginController {
	
	@Autowired
	private LoginMapper loginMapper;
	
	@RequestMapping("/Login")  
	   public String login() {
	      return "login/login";
	   }
	
	@RequestMapping("/JoinForm")
	public String joinForm(){
		return "login/join";
	}
	@PostMapping("/Join")
	public ModelAndView join(
			@RequestParam HashMap<String, Object> map,
			HttpServletRequest   request){
		
		String u_profileimg = String.valueOf(map.get("u_profileimg"));
		//String u_profileimg = vo.getU_profileimg();
		System.out.println("map : " + map);
		//System.out.println("vo : " + vo);
		System.out.println("u_profileimg : " + u_profileimg);
		
		if(u_profileimg == null || u_profileimg.isEmpty()) {
			ImgFile.save( map, request );
			loginMapper.insertJoin1(map);
		} else {
			loginMapper.insertJoin2(map);
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Login");
		return mv;
	}
	
	@GetMapping("/IdCheck")
	@ResponseBody
	public int  idCheck(UserVo vo) {
		String u_id = vo.getU_id();
		int result  = loginMapper.idCheck(u_id);
		return result;
	}
	
	@GetMapping("/NCheck")
	@ResponseBody
	public int  NCheck(UserVo vo) {
		String u_nickname = vo.getU_nickname();
		int result  = loginMapper.NCheck(u_nickname);
		return result;
	}
	@GetMapping("/ECheck")
	@ResponseBody
	public int  ECheck(UserVo vo) {
		String u_email = vo.getU_email();
		int result  = loginMapper.ECheck(u_email);
		return result;
	}
	
	
}
