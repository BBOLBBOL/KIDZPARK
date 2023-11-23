package com.kidzpark.kidzzone.domain;

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
public class KidzzoneVo {
	@NonNull
	private int kz_no;
	private String kz_name;
	private int kz_postcode;
	private String kz_address;
	private String kz_detailaddress;
	private String kz_extraaddress;
	private String kz_explanation;
	private String kz_openingtime;
	private String kz_img;
	private String kz_category;
	private String selectoption;
   
}