package com.kidzpark.chat.service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ChatMessage {
	private int msg_id;
	private String chr_submittime;
    private int chr_no;
    private int u_no;
    private String chr_message;
    private String u_nickname;
}