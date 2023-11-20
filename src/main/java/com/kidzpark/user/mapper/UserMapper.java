package com.kidzpark.user.mapper;

import java.util.List;

import com.kidzpark.user.domain.UserVo;

public interface UserMapper {

	int Check(UserVo vo);

	List<UserVo> userInfo(UserVo vo);

	void updatePw(UserVo vo);

}
