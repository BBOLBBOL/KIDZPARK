package com.kidzpark.chat.controller;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ChatVo {
	
	private int chr_no;
	private String chr_message;
	private String chr_submittime;
	private int u_no;
	private String chr_title;
	private String chr_opendate;
	private int chr_peoplecount;
	
}
