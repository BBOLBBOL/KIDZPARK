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
public class CommentVo {
	@NonNull
	private int    c_idx;
	@NonNull
	private int    b_idx;
	private String c_comment;
	private String c_commentdate;
	@NonNull
	private int    u_no;

}
