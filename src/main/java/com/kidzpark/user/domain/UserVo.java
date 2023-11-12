package com.kidzpark.user.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class UserVo {
	private int    u_no;
	private String u_id;
	private String u_pw;
	private String u_name;
	private String u_postcode;
	private String u_address;
	private String u_detailaddress;
	private String u_extraaddress;
	private byte[] u_profileimg;
	private String u_email;
	private int    u_logincount;
	private int    u_writecount;
	private int    u_grade;
	@NonNull
	private String u_nickname;
	@NonNull
	private String u_phone;
}
