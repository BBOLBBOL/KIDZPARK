package com.kidzpark.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kidzpark.cs.domain.CsVo;
import com.kidzpark.paging.PagingVo;
import com.kidzpark.user.domain.UserVo;

@Mapper
public interface AdminMapper {

	int countAdminCsList(CsVo vo);

	List<CsVo> AdminCsList(PagingVo pds);

	List<UserVo> userList(PagingVo pds);

	int countAdminUserList(UserVo vo);

	void userListDelete(UserVo vo);

	
	
	
}
