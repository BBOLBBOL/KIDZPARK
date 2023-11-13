package com.kidzpark.login.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	@RequestMapping("/LoginForm")  
	   public String loginForm() {
	      return "login/login";
	   }
	@RequestMapping("/Login")
		public String login(
				UserVo vo, HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		String returnURL = "";

		if( session.getAttribute("loginVo") != null ) {
			session.removeAttribute("loginVo");
		}
		
		// 로그인 입력값으로 DB조회후 확인
		UserVo loginVo = loginMapper.login( vo );
		if ( loginVo != null ) {
			session.setAttribute("loginVo", loginVo);
			returnURL = "redirect:/";
		} else {
			model.addAttribute("loginFail", "아이디나 비밀번호가 잘못되었습니다. 다시 시도하세요.");
			returnURL = "redirect:/LoginForm";
		}
		
		return returnURL;
	}
	// 로그아웃
	@RequestMapping("/LogOut")
	public String logout( HttpSession session ) {
		session.invalidate();
		return "/login/login";
	}

	@RequestMapping("/JoinForm")
	public String joinForm(){
		return "login/join";
	}
	@RequestMapping("/Join")
	public ModelAndView join(
			@RequestParam HashMap<String, Object> map
			,HttpServletRequest   request){
		String u_profileimg = String.valueOf(map.get("u_profileimg"));
		if(u_profileimg != null || !u_profileimg.isEmpty() ) {
			ImgFile.save( map, request );
			System.out.println("map: " + map);
			loginMapper.insertJoin2(map);
		} else {
			loginMapper.insertJoin1(map);
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login/login");
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
