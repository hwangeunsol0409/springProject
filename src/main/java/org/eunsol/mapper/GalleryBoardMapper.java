package org.eunsol.mapper;

import java.util.List;

import org.eunsol.domain.Criteria;
import org.eunsol.domain.GalleryBoardVO;

public interface GalleryBoardMapper {
	//read ==> all select 철
	public List<GalleryBoardVO> getList(Criteria cri);
	
	//create ==> insert처리
	public void insert(GalleryBoardVO gvo);
	
	//read ==> select 처리
	public GalleryBoardVO read(int gno);
	
	//delete ==>delete처리
	public int delete(int gno);
	
	//update ==> update처리
	public int update(GalleryBoardVO gvo);
	
	//전체데이터 수
	public int getTotalCount(Criteria cri);
}
