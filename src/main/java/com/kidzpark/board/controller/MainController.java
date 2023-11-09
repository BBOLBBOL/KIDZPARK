package com.kidzpark.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	// 메인화면
	@RequestMapping("/")
	public String home() {
		return "index";
	}
	
	
}
