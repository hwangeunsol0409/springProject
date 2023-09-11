package org.eunsol.mapper;

import java.util.List;

import org.eunsol.domain.PerformanceVO;

public interface PerformanceMapper {
	//read => all select 철
	public List<PerformanceVO> getList();
	
	//create ==> insert처리
	public void insert(PerformanceVO pvo);
	
	//read ==> select 처리
	public PerformanceVO read(int gno);

}
