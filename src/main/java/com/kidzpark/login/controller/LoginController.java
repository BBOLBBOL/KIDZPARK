package com.kidzpark.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
	@RequestMapping("/Login")  
	   public String login() {
	      return "login/login";
	   }
	
	@RequestMapping("Join")
	public String joinForm(){
		return "login/join";
	}
}
