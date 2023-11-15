package com.kidzpark.chat.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ChatController {

    @GetMapping("/error")
    public String index(){
        return "error";
    }

    @GetMapping("/ChatRoom{id}")
    public String chattingRoom(@PathVariable String id, HttpSession session, Model model){
        return "chat/chatroom";
    }
	
}
