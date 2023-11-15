package com.kidzpark.user.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FindMapper {

	List<String> findId(String u_email);

	String emailCheck(Map<String, Object> map);

}
