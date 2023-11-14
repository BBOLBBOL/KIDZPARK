package com.kidzpark.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.kidzpark.user.mapper.FindMapper;

@Service
public class FindService {
	
	@Autowired
	FindMapper findMapper;
	@Autowired
	JavaMailSender mailSender;

	
	public List<String> findId(String u_email) {
	    return findMapper.findId(u_email);
	}
	
	public void sendUsernames(String u_email, List<String> username) {
		SimpleMailMessage simpleMailMessage = new  SimpleMailMessage();
		simpleMailMessage.setTo(u_email);
		simpleMailMessage.setSubject("아이디 찾기");
		
		StringBuffer sb = new StringBuffer();
		sb.append("가입하신 아이디는");
		sb.append(System.lineSeparator());
		
		for(int i=0;i<username.size()-1;i++) {
			sb.append(username.get(i));
			sb.append(System.lineSeparator());
		}
		sb.append(username.get(username.size()-1)).append("입니다");
		
		simpleMailMessage.setText(sb.toString());
		
		
		new Thread(new Runnable() {
			public void run() {
				mailSender.send(simpleMailMessage);
			}
		}).start();
	}

	public boolean emailCheck(String u_id, String u_email) {
		 Map<String, Object> map = new HashMap<>();
		    map.put("u_id", u_id);
		    map.put("u_email", u_email);
		    String result = findMapper.emailCheck(map);
		    if("1".equals(result)) {
		        return true;
		    }
		    return false;
	}
	
}