package com.kidzpark.admin.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.kidzpark.board.domain.BoardVo;
import com.kidzpark.cs.domain.CsVo;
import com.kidzpark.kidzzone.domain.KidzzoneVo;
import com.kidzpark.paging.PagingVo;
import com.kidzpark.user.domain.UserVo;

@Mapper
public interface AdminMapper {

	int countAdminCsList(CsVo vo);

	List<CsVo> AdminCsList(PagingVo pds);

	List<UserVo> userList(PagingVo pds);

	int countAdminUserList(UserVo vo);

	void userListDelete(UserVo vo);

	void insertFileKz(HashMap<String, Object> map);

	void insertNoFileKz(HashMap<String, Object> map);

	int countNotice(BoardVo vo);

	List<BoardVo> noticeList(Map<String, Object> map);

	void insertNoticeFile(HashMap<String, Object> map);

	void insertNoticeNoFile(HashMap<String, Object> map);

	void boardDelete(BoardVo vo);

	List<KidzzoneVo> kzList(PagingVo pds);

	int countKz(KidzzoneVo vo);

	void kidzzoneDelete(KidzzoneVo vo);

	KidzzoneVo updateView(KidzzoneVo vo);

	void KidzzoneUpdateFile(HashMap<String, Object> map);

	void KidzzoneUpdateNoFile(HashMap<String, Object> map);

	
	
	
}
