package com.kidzpark.cs.domain;

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
public class CsVo {

	private int cs_idx;
	private int u_no;
	private String cs_title;
	private String cs_cont;
	private String cs_img;
	private String cs_writerdate;
	private String cs_category;
	private String cs_answer;
	private String cs_answerdate;
	
}
