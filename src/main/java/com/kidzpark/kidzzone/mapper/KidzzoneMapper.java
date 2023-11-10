package com.kidzpark.kidzzone.mapper;

import java.util.List;

import com.kidzpark.kidzzone.domain.KidzzonePagingVo;
import com.kidzpark.kidzzone.domain.KidzzoneVo;

public interface KidzzoneMapper {

	List<KidzzoneVo> selectKiddzone(KidzzonePagingVo pg);
	
	int countKiddzone(KidzzoneVo vo);

}
