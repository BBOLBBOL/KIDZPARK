package com.kidzpark.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kidzpark.chat.domain.ChatMessage;
import com.kidzpark.chat.domain.Room;
import com.kidzpark.chat.mapper.ChatMapper;
import com.kidzpark.user.domain.UserVo;

@Controller
public class ChatController {
	
	@Autowired
    private ChatMapper chatMapper;
	
	List<Room> roomList = new ArrayList<Room>();
	static int chr_no = 0;
	
	@RequestMapping("/Chat")
	public ModelAndView chat() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chat/chat");
		return mv;
	}
	/**
	 * 방 페이지
	 * @return
	 */
	@RequestMapping("/room")
	public ModelAndView room(@RequestParam HashMap<Object, Object> map) {
		roomList = chatMapper.getRoom(map);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chat/room");
		
		return mv;
	}
	
	/**
	 * 방 생성하기
	 * @param params
	 * @return
	 */
	@RequestMapping("/createRoom")
	public @ResponseBody List<Room> createRoom(@RequestParam HashMap<Object, Object> map){
		String chr_title = (String) map.get("chr_title");
		if(chr_title != null && !chr_title.trim().equals("")) {
			Room room = new Room();
			room.setChr_title(chr_title);
			
			chatMapper.insertRoom(room);
			roomList.add(room);
		}
		return roomList;
	}
	
	/**
	 * 방 정보가져오기
	 * @param params
	 * @return
	 */
	@RequestMapping("/getRoom")
	public @ResponseBody List<Room> getRoom(@RequestParam HashMap<Object, Object> map){
		roomList = chatMapper.getRoom(map);
		
		return roomList;
	}
	
	/**
	 * 채팅방
	 * @return
	 */
	@RequestMapping("/moveChating")
	public ModelAndView chating(ChatMessage msg, @RequestParam HashMap<Object, Object> map, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		int chr_no = Integer.parseInt((String) map.get("chr_no"));
		
		
		
		UserVo loggedInUser = (UserVo) session.getAttribute("loginVo");
	    String u_nickname = loggedInUser.getU_nickname();
		List<Room> new_list = roomList.stream().filter(o->o.getChr_no()==chr_no).collect(Collectors.toList());
		if(new_list != null && new_list.size() > 0) {
			
			int chatusercount =  chatMapper.countChatroommember(map);
			
			if(chatusercount < 1) {
			chatMapper.joinChatroom(map);
			} 
			mv.addObject("chr_title", map.get("chr_title"));
			mv.addObject("u_id", map.get("u_id"));
			mv.addObject("chr_no", map.get("chr_no"));
			mv.addObject("u_nickname", u_nickname); // 사용자 정보를 전달
			mv.setViewName("chat/chat");
			
			List<ChatMessage> msgList = chatMapper.msgList(msg);
			mv.addObject("msgList", msgList);
			
		}else {
			mv.setViewName("chat/room");
		}
		return mv;
	}
	@RequestMapping("/saveMessageToDB")
	public @ResponseBody String saveMessageToDB(@RequestBody ChatMessage message) {
		//
	    chatMapper.insertMessage(message);
	    return "success";
	}
	
	@PostMapping("/getChatroomMembers")
	@ResponseBody
	public int getChatroomMembers(@RequestParam HashMap<Object, Object> map) {
		int members =  chatMapper.countChatroommember(map);
		
        return members;
	}
	
}