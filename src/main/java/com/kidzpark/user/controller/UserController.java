package com.kidzpark.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kidzpark.user.domain.ImgFile;
import com.kidzpark.user.domain.UserVo;
import com.kidzpark.user.mapper.UserMapper;
import com.kidzpark.user.service.MailService;

@Controller
public class UserController {
	@Autowired
	private MailService mailService;
	@Autowired
	private UserMapper userMapper;
	
	@RequestMapping("/CheckEmailForm")
	public String checkEmailForm(UserVo vo, HttpSession session) {
		return "user/checkemail";
	}
	
	@RequestMapping("/CheckEmail")
	@ResponseBody
	public String checkEmail(String u_email) {
		int number = mailService.sendMail(u_email);
	       String num = "" + number;
	       System.out.println("Checkmail 안의 num : " + num);
		return num;
	}
	
	@RequestMapping("/Check")
	@ResponseBody
	public int Check (UserVo vo) {
		System.out.println("UserVo1 : " + vo);
		int result  = userMapper.Check(vo);
		return result;
	}
	
	@RequestMapping("/UserInfo")
	public ModelAndView userInfo(UserVo vo) {
		System.out.println("userInfo in vo" + vo);
		List<UserVo> infoList = userMapper.userInfo(vo);	
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/userinfo");
		mv.addObject("infoList", infoList);
		return mv;
	}
	
	@RequestMapping("/UserUpdateForm")
	public ModelAndView updateForm(UserVo vo) {
		System.out.println("UserVo2 : " + vo);
		
		//List<UserVo> infoList = userMapper.userInfo(vo);
		//System.out.println("infoList : " + infoList);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/update");
		//mv.addObject("infoList", infoList);
		return mv;
	}
	
	@RequestMapping("/InfoList")
	@ResponseBody
	public ResponseEntity<UserVo> infoList(UserVo vo) {
		UserVo userVo = userMapper.userInfo1(vo); // 적절한 메서드로 사용자 정보를 가져오는 예시

	    if (userVo != null) {
	        return new ResponseEntity<>(userVo, HttpStatus.OK);
	    } else {
	        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	    }
	}
	
	@GetMapping("/UpdatePwForm")
	public ModelAndView updatePwForm(UserVo vo) {
		System.out.println("UpdatePwForm in vo" + vo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		mv.setViewName("user/updatepw");
		return mv;
	}
	
	@PostMapping("/UpdatePw")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> updatePw(UserVo vo) {
		System.out.println("UpdatePw in vo : " + vo);
		userMapper.updatePw(vo);
		
		String u_pw = vo.getU_pw();
		
		System.out.println("u_pw : " + u_pw);
		
		Map<String, Object> response = new HashMap<>();
        response.put("updated", true);
        response.put("u_pw", u_pw);

        return new ResponseEntity<>(response, HttpStatus.OK);
	}
	@RequestMapping("/UserUpdate")
	public ModelAndView userUpdate(@RequestParam MultipartFile u_profileimg, @RequestParam HashMap<String, Object> map, HttpServletRequest request){
		if( !u_profileimg.isEmpty() ) {
			ImgFile.save( map, request );
			System.out.println("map1 : " + map);
			userMapper.userUpdate1(map);
		} else {
			System.out.println("map2 : " + map);
			userMapper.userUpdate2(map);
		}
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/index");
		return mv;
	}
}
