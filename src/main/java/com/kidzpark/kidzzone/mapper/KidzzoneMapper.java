package com.kidzpark.kidzzone.mapper;

import java.util.List;
import java.util.Map;

import com.kidzpark.kidzzone.domain.KidzzoneVo;
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

}
