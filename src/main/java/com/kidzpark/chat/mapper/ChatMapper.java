package com.kidzpark.chat.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kidzpark.chat.service.ChatMessage;
import com.kidzpark.chat.service.Room;

@Mapper
public interface ChatMapper {

	void update(int chr_no, int u_no, String chr_message);

	void insertRoom(Room room);

	Room roomlist(int chr_no);

	List<Room> getRoom(HashMap<Object, Object> map);

	List<ChatMessage> msgList(ChatMessage msg);

	void insertMessage(ChatMessage message);


}
