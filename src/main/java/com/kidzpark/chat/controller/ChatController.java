package com.kidzpark.chat.controller;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChatController {

	@RequestMapping("/ChatList")
	public ModelAndView chatlist () {
		
		ModelAndView mv  =  new ModelAndView();
		mv.setViewName("chat/chatlist");
		return mv;
	}
	
	@GetMapping("/ChatRoom{id}")
	public ModelAndView chatroom(@PathVariable String id, HttpSession session) {
		ModelAndView mv  =  new ModelAndView();
		
		
		String username  =  "내가낸데";	
		mv.setViewName("chat/chatroom");
		mv.addObject("id", username);
		return mv;
	}
	
	
	
}
