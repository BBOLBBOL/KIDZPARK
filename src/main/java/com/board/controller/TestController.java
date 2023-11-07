package com.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {
	@RequestMapping("/")
	public String home(Model model, String name) {
		
		//String name = "김영준";
		
		model.addAttribute("irum", name);
	
		return "index";
	}
	
	@RequestMapping("/test")
	@ResponseBody
	public  String  test(String str) {
		String header = str;
		return "<h2>"+header+"</h2>";
	}
}
