package com.kidzpark.chat.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kidzpark.chat.mapper.ChatMapper;

@Controller
public class ChatController {

	@Autowired
	private ChatMapper chatMapper;
	
	@RequestMapping("/ChatList")
	public ModelAndView chatlist (ChatVo vo) {
		
		
		List<ChatVo> chatList  =  chatMapper.chatList(vo);
		
		ModelAndView mv  =  new ModelAndView();
		mv.addObject("list", chatList);
		mv.setViewName("chat/chatlist");
		return mv;
	}
	
	@GetMapping("/ChatRoom{id}")
	public ModelAndView chatroom(@PathVariable String id, HttpSession session, ChatVo vo) {
		ModelAndView mv  =  new ModelAndView();
		
		int chr_no  =  vo.getChr_no();
		List<ChatVo> chatList  =  chatMapper.chatList(vo);
		
		chatMapper.joinChatRoom(vo);
		
		String username  =  "내가낸데";	
		mv.setViewName("chat/chatroom");
		mv.addObject("id", username);
		mv.addObject("chr_no", chr_no);
		return mv;
	}
	
	@RequestMapping("/ChatRoomOut")
	public ModelAndView chatroomOut(ChatVo vo) {

		
		chatMapper.outChatRoom(vo);
		
		ModelAndView mv  =  new ModelAndView();
		mv.setViewName("redirect:/ChatList");
		return mv;
	}
	
	
}
