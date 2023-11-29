package com.kidzpark.login.controller;



import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kidzpark.user.domain.ImgFile;
import com.kidzpark.user.domain.UserVo;
import com.kidzpark.user.mapper.LoginMapper;
import com.kidzpark.user.service.FindService;
import com.kidzpark.user.service.MailService;

@Controller
public class LoginController {
	
	@Autowired
	private LoginMapper loginMapper;
	@Autowired
	private FindService findService;
	
	@Autowired
	private MailService mailService;
	
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
		
		// 유저 로그인 카운트 날짜 확인 

		
		
		// 로그인 입력값으로 DB조회후 확인
		UserVo loginVo = loginMapper.login( vo );
		if ( loginVo != null ) {
			session.setAttribute("loginVo", loginVo);
			System.out.println(loginVo);
			loginMapper.updateUser(loginVo);
			loginMapper.updateGrade(loginVo);

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
	//회원가입 폼 이동
	@RequestMapping("/JoinForm")
	public String joinForm(){
		return "login/join";
	}
	// 회원가입
	@RequestMapping("/Join")
	public ModelAndView join(@RequestParam MultipartFile u_profileimg,
			@RequestParam HashMap<String, Object> map
			,HttpServletRequest   request){
		

		
		if( !u_profileimg.isEmpty() ) {
			ImgFile.save( map, request );
			
			loginMapper.insertJoin2(map);
		} else {
			
			loginMapper.insertJoin1(map);
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login/login");
		return mv;
	}
	
	// 아이디 체크
	@GetMapping("/IdCheck")
	@ResponseBody
	public int  idCheck(UserVo vo) {
		String u_id = vo.getU_id();
		int result  = loginMapper.idCheck(u_id);
		return result;
	}
	// 닉네임 체크
	@GetMapping("/NCheck")
	@ResponseBody
	public int  NCheck(UserVo vo) {
		String u_nickname = vo.getU_nickname();
		int result  = loginMapper.NCheck(u_nickname);
		return result;
	}
	
	// 이메일 체크
	@GetMapping("/ECheck")
	@ResponseBody
	public int  ECheck(UserVo vo) {
		String u_email = vo.getU_email();
		int result  = loginMapper.ECheck(u_email);
		return result;
	}
	
	// 핸드폰체크
	@GetMapping("/pCheck")
	@ResponseBody
	public int  pCheck(UserVo vo) {
		String u_phone = vo.getU_phone();
		int result  = loginMapper.pCheck(u_phone);
		return result;
	}
	
	// 구글이메일 인증
	@PostMapping("/Mail")
	@ResponseBody
	public String MailSend(String u_email) {
		int number = mailService.sendMail(u_email);
	       String num = "" + number;
	       System.out.println(num);
		return num;
	}
	
	// 이메일로 아이디 찾기페이지로 이동
	@RequestMapping("/FindIdForm")
	public String findId() {
		return "login/findid";
	}
	@PostMapping("/SendId")
	public ResponseEntity<Object> sendEmail(String u_email){
		List<String> username = findService.findId(u_email);
		if(username.size() != 0) {
	    	findService.sendUsernames(u_email, username);
	    	return new ResponseEntity<Object>(HttpStatus.OK);
	    }
		return new ResponseEntity<Object>(HttpStatus.BAD_REQUEST);
	}
	
	// 비밀번호 찾기 페이지로 이동
	@GetMapping("/FindPwForm")
	public String findPw() {
		return "login/findpw";
	}
	
	// 아이디 존재 하는지 확인
	@GetMapping("/FindId")
	public ResponseEntity<String> overlapCheck(String u_id,  HttpSession session) {
		
		
		
		if(loginMapper.idCheck(u_id) != 0) {
		    Map<String, Object> authStatus = new HashMap<>();
		    authStatus.put("u_id", u_id);
		    authStatus.put("status", false);
		    
		    session.setMaxInactiveInterval(300);
		    session.setAttribute("authStatus", authStatus);
	    	return ResponseEntity.ok().body(u_id);
	    }
		return ResponseEntity.badRequest().body("아이디가 존재하지 않습니다");
	}
	
	// 인증번호 보내기 jsp
		@GetMapping("/SendPwForm")
		public ModelAndView SendPw(String u_id, HttpSession session) {
		    Map<String, Object> authStatus = (Map<String, Object>) session.getAttribute("authStatus");
		    u_id = String.valueOf(authStatus.get("u_id"));
		    
		    ModelAndView mv = new ModelAndView();
		    
		    if(authStatus == null || !u_id.equals(authStatus.get("u_id"))) {
		    	mv.setViewName("redirect:/FindPwForm");
		        return mv;
		    }
			mv.setViewName("login/sendpw");
			mv.addObject("u_id", u_id);
			
		    return mv;
		}
		
		// u_id의 이메일이 맞는지 확인 후 인증번호 전송
		@GetMapping("/SendEmail")
		public ResponseEntity<String> emailCheck(String u_id, String u_email){

		    boolean emailCheck = findService.emailCheck(u_id, u_email);
		    if(emailCheck) {
		    	int number = mailService.sendMail(u_email);
		    	 String num = "" + number;
		    	 
		    	 return new ResponseEntity<>(num, HttpStatus.OK);
		    } else {
		    	 return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		    }
		}
		@RequestMapping("/ChangePwForm")	
		public ModelAndView changePwForm(@RequestParam String u_id) {
			
			
			ModelAndView mv = new ModelAndView();
			mv.setViewName("login/changepw");
			mv.addObject("u_id", u_id);
			
			return mv;
		}
		
		@RequestMapping("/ChangePw")
		public ModelAndView changePw(UserVo vo) {
			
			
			loginMapper.updatePw(vo);
			
			ModelAndView mv = new ModelAndView();
			mv.setViewName("redirect:/LoginForm");
			
			
			return mv;
		} 
		
}
