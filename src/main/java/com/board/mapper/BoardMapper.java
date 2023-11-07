package com.board.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.servlet.ModelAndView;

import com.board.domain.BoardVo;

@Mapper
public interface BoardMapper {
	public void boardInsert(BoardVo vo);

	public List<BoardVo> boardList();

	public void boardWrite(HashMap<String, Object> map);

	public void boardDelete(HashMap<String, Object> map);

	public List<BoardVo> boardView(BoardVo vo);

	public void boardUpdate(HashMap<String, Object> map);

	public void hitUpdate(BoardVo vo);

}
