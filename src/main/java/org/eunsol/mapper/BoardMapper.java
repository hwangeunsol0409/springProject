package org.eunsol.mapper;

import java.util.List;

import org.eunsol.domain.BoardVO;
import org.eunsol.domain.Criteria;

public interface BoardMapper {
	
	public void insert(BoardVO bvo); 
	
	public BoardVO read(Long bno);
	
	//delete 처리
	public int delete(Long bno);
	
	//update 처리
	public int update(BoardVO board);
	//전체 데이터 개수
	public int getTotalCount(Criteria cri);
	//게시글 목록조회
	public List<BoardVO> getList(Criteria cri);
	
	
}
