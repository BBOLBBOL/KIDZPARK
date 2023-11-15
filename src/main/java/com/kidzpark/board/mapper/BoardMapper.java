package com.kidzpark.board.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.kidzpark.board.domain.BoardVo;
import com.kidzpark.paging.PagingVo;

@Mapper
public interface BoardMapper {
	public void boardInsert(BoardVo vo);

	public List<BoardVo> boardList();

	public void boardWrite(HashMap<String, Object> map);

	public void boardDelete(HashMap<String, Object> map);

	public List<BoardVo> boardView(BoardVo vo);

	public void boardUpdate(HashMap<String, Object> map);

	public void hitUpdate(BoardVo vo);

	public int countboard(BoardVo vo, int m_no);

	public int countboard(Map<String, Object> map);

	public List<BoardVo> getboardlist(Map<String, Object> map);

	public String selectMenuname(Map<String, Object> map);

}
