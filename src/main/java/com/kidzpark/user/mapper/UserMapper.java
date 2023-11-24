package com.kidzpark.user.mapper;

import java.util.HashMap;
import java.util.List;

import com.kidzpark.user.domain.UserVo;

public interface UserMapper {

	int Check(UserVo vo);

	List<UserVo> userInfo(UserVo vo);

	void updatePw(UserVo vo);

	UserVo userInfo1(UserVo vo);

	void userUpdate1(HashMap<String, Object> map);

	void userUpdate2(HashMap<String, Object> map);

}
