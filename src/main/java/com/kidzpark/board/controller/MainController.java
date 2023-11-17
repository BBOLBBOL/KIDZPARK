package com.kidzpark.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	// 메인화면
	@RequestMapping("/")
	public String home( HttpSession session) {
		
		System.out.println(session);
		
		return "index";
	}
	
	
}
