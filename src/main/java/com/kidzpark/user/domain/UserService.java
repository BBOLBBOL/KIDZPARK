package com.kidzpark.user.domain;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.kidzpark.user.mapper.LoginMapper;

@Service
public class UserService {

	@Autowired
	private LoginMapper loginMapper;

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	public void insertJoin2(HashMap<String, Object> map) {
		String rawPassword  =  (String) map.get("u_pw");
		String encodedPassword  =  passwordEncoder.encode(rawPassword);
		
		map.put("u_pw", encodedPassword);
		
		loginMapper.insertJoin2(map);
		
	}

	public void insertJoin1(HashMap<String, Object> map) {
		String rawPassword  =  (String) map.get("u_pw");
		String encodedPassword  =  passwordEncoder.encode(rawPassword);
		
		map.put("u_pw", encodedPassword);
		loginMapper.insertJoin1(map);
	}

	
}
