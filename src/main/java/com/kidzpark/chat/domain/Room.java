package com.kidzpark.chat.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Room {
	private int chr_no;
	private String chr_title;
	private String chr_opendate;
	private int chr_peoplecount;
}