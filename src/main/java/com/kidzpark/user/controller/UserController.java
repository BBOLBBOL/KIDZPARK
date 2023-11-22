package com.kidzpark.user.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping("/UserUpdateForm")
	public ModelAndView updateForm(UserVo vo) {
		System.out.println("UserVo2 : " + vo);
		
		List<UserVo> infoList = userMapper.userInfo(vo);
		System.out.println("infoList : " + infoList);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/update");
		mv.addObject("infoList", infoList);
		return mv;
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
	
	@RequestMapping("/UpdatePwForm")
	public ModelAndView updatePwForm(UserVo vo) {
		System.out.println("UpdatePwForm in vo" + vo);
		List<UserVo> voList = new ArrayList<>();	
		voList.add(vo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/updatepw");
		mv.addObject("voList", voList);
		return mv;
	}
	
	@RequestMapping("/UpdatePw")
	public ModelAndView updatePw(UserVo vo) {
		System.out.println("UpdatePw in vo : " + vo);
		//userMapper.updatePw(vo);
		List<UserVo> infoList = userMapper.updatePw(vo);
		
		//infoList.add(vo);
		System.out.println("UpdatePw in infoList" + infoList);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/UserUpdateForm");
		mv.addObject("infoList", infoList);
		return mv;
	}
	
}
