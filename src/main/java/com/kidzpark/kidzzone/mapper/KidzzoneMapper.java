package com.kidzpark.kidzzone.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kidzpark.kidzzone.domain.KidzzoneVo;
import com.kidzpark.kidzzone.domain.ReviewVo;
import com.kidzpark.paging.PagingVo;

public interface KidzzoneMapper {

	int countKiddzone(KidzzoneVo vo);

	List<KidzzoneVo> selectKiddzone();

	List<KidzzoneVo> selectKiddzonelist(PagingVo pg);

	List<KidzzoneVo> selectKiddzoneSearch(Map<String, Object> map);

	List<KidzzoneVo> selectKidzzoneSearchlist1(Map<String, Object> map);

	int countKiddzoneSearch1(Map<String, Object> map);

	List<KidzzoneVo> selectKidzzoneSearchlist2(Map<String, Object> map);

	int countKiddzoneSearch2(Map<String, Object> map);

	List<ReviewVo> reviewList(HashMap<String, Object> map);

	void insertReviewFile(HashMap<String, Object> map);

	void insertReviewNoFile(HashMap<String, Object> map);

	void deleteReview(HashMap<String, Object> map);

	List<HashMap<String, Object>> reviewName(HashMap<String, Object> map);

	String kz_name(HashMap<String, Object> map);

	void kidzzoneLike(HashMap<String, Object> map);

	void kidzzoneUnLike(HashMap<String, Object> map);

	int countKidzzoneLikeUser(HashMap<String, Object> map);

}
