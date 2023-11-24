package com.kidzpark.kidzzone.domain;

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
public class ReviewVo {

	private String r_review;
	private String r_reviewdate;
	private String r_reviewimg;
	private int kz_no;
	private int u_no;
	private String u_nickname;
	
	
}
