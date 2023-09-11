package org.eunsol.service;

import java.util.List;

import org.eunsol.domain.PerformanceVO;

public interface PerformanceService {
	//게시글 목록조회
		public List<PerformanceVO> getList();
		
		//등록 insert
		public void register(PerformanceVO pvo);
		
		//게시글 1개 조회 select
		public PerformanceVO get(int gno);
}
