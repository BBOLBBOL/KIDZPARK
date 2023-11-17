package com.kidzpark.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kidzpark.chat.mapper.ChatMapper;
import com.kidzpark.chat.service.Room;
import com.kidzpark.user.domain.UserVo;

@Controller
public class ChatController {
	
	@Autowired
    private ChatMapper chatMapper;
	
	List<Room> roomList = new ArrayList<Room>();
	static int roomNumber = 0;
	
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
	public ModelAndView room() {
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
	public @ResponseBody List<Room> createRoom(@RequestParam HashMap<Object, Object> params){
		String roomName = (String) params.get("roomName");
		if(roomName != null && !roomName.trim().equals("")) {
			Room room = new Room();
			room.setRoomNumber(++roomNumber);
			room.setRoomName(roomName);
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
	public @ResponseBody List<Room> getRoom(@RequestParam HashMap<Object, Object> params){
		return roomList;
	}
	
	/**
	 * 채팅방
	 * @return
	 */
	@RequestMapping("/moveChating")
	public ModelAndView chating(@RequestParam HashMap<Object, Object> params, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		int roomNumber = Integer.parseInt((String) params.get("roomNumber"));
		
		UserVo loggedInUser = (UserVo) session.getAttribute("loginVo");
	    String userNickname = loggedInUser.getU_nickname();
		
		List<Room> new_list = roomList.stream().filter(o->o.getRoomNumber()==roomNumber).collect(Collectors.toList());
		if(new_list != null && new_list.size() > 0) {
			mv.addObject("roomName", params.get("roomName"));
			mv.addObject("roomNumber", params.get("roomNumber"));
			mv.addObject("userNickname", userNickname); // 사용자 정보를 전달
			mv.setViewName("chat/chat");
		}else {
			mv.setViewName("chat/room");
		}
		return mv;
	}
	
	@RequestMapping("/sendMessage")
    public @ResponseBody String sendMessage(@RequestParam HashMap<Object, Object> params, HttpSession session) {
        int chr_no = Integer.parseInt((String) params.get("roomNumber"));

        UserVo loggedInUser = (UserVo) session.getAttribute("loginVo");
        int    u_no         = loggedInUser.getU_no();
        String chr_message  = (String) params.get("message");

        // 메시지를 DB에 저장
        chatMapper.update(chr_no, u_no, chr_message);

        // 추가적인 작업 또는 응답 처리

        return "success";
    }

	
}