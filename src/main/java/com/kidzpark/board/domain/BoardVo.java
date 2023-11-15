package com.kidzpark.board.domain;

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
public class BoardVo {
	@NonNull
   private int    b_idx;
   private String b_title;
   private String b_cont;
   private String b_img;
   private int    b_like;
   private int    b_readcount;
   private String b_writedate;
   private String b_update;
   @NonNull
   private int    m_no;
   @NonNull
   private int    u_no;
   
}