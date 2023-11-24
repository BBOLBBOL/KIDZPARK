package com.kidzpark.board.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.kidzpark.board.domain.BoardVo;
import com.kidzpark.board.domain.CommentVo;
import com.kidzpark.kidzzone.domain.KidzzoneVo;
import com.kidzpark.paging.PagingVo;

@Mapper
public interface BoardMapper {
	public void boardInsert(BoardVo vo);

	public List<BoardVo> boardList();

	public void boardWrite(HashMap<String, Object> map);

	public void boardDelete(HashMap<String, Object> map);

	public List<BoardVo> boardView(HashMap<String, Object> map);

	public void boardUpdate(HashMap<String, Object> map);

	public void hitUpdate(BoardVo vo);

	public int countboard(BoardVo vo, int m_no);

	public int countboard(Map<String, Object> map);

	public List<BoardVo> getboardlist(Map<String, Object> map);

	public String selectMenuname(Map<String, Object> map);

	public List<KidzzoneVo> selectBoardSearchList(Map<String, Object> map);

	public int countBoardSearchList(Map<String, Object> map);

	public String selectMenuname(int m_no);

	public void boardWrite1(HashMap<String, Object> map);

	public void boardWrite2(HashMap<String, Object> map);

	public void updateReadcount(HashMap<String, Object> map);

	public void boardUpdate1(HashMap<String, Object> map);

	public void boardUpdate2(HashMap<String, Object> map);

	public void commentWrite(HashMap<String, Object> map);

	public List<CommentVo> selectCommentList(HashMap<String, Object> map);

	public int countCommentList(HashMap<String, Object> map);

	public List<BoardVo> getnoticelist(Map<String, Object> map);

	public List<BoardVo> likeCheck(HashMap<String, Object> map);

	public int countboardlikeuser(HashMap<String, Object> map);

	public void boardUnLike(HashMap<String, Object> map);

	public void boardLike(HashMap<String, Object> map);

	public int countMyarticles(Map<String, Object> map);

	public List<BoardVo> getmyarticles(Map<String, Object> map);

	public int countSearchArticles(Map<String, Object> map);

	public List<BoardVo> getSearchArticles(Map<String, Object> map);




}
