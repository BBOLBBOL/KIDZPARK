package com.kidzpark.chat.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kidzpark.chat.controller.ChatVo;

@Mapper
public interface ChatMapper {

	List<ChatVo> chatList(ChatVo vo);

	void joinChatRoom(ChatVo vo);

	void outChatRoom(ChatVo vo);

}
