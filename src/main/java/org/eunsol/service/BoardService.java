package org.eunsol.service;

import java.util.List;

import org.eunsol.domain.BoardVO;
import org.eunsol.domain.Criteria;

public interface BoardService {
	//등록 insert
	public void register(BoardVO board);
	
	//게시글 1개 조회 select
	public BoardVO get(Long bno);
	
	//수정하기
	public boolean modify(BoardVO board);
	
	//삭제하기
	public boolean remove(Long bno);
	
	//게시글 목록조회
	public List<BoardVO> getList(Criteria cri);
	
	//게시글 갯수 조회
	public int getTotal(Criteria cri);
}
