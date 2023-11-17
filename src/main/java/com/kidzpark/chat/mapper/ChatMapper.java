package com.kidzpark.chat.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChatMapper {

	void update(int chr_no, int u_no, String chr_message);

}
