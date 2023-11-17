package com.kidzpark.cs.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kidzpark.cs.domain.CsVo;

public interface CsMapper {

	List<CsVo> userCsList(Map<String, Object> map);

	int countCsList(CsVo vo);

	void insertCsFile(HashMap<String, Object> map);

	void insertCsNoFile(HashMap<String, Object> map);

	List<CsVo> csView(CsVo vo);

	void csAnswer(CsVo vo);


}
