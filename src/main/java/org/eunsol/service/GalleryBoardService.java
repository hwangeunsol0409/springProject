package org.eunsol.service;

import java.util.List;

import org.eunsol.domain.Criteria;

import org.eunsol.domain.GalleryBoardVO;

public interface GalleryBoardService {
	//등록 insert
	public void register(GalleryBoardVO gvo);
	//게시글 1개 조회 select
	public GalleryBoardVO get(int gno);
	//수정하기
	public boolean modify(GalleryBoardVO gvo);
	//삭제하기
	public boolean remove(int gno);
	//게시글 목록조회
	public List<GalleryBoardVO> getList(Criteria cri);
	//게시글 갯수 조회
	public int getTotal(Criteria cri);
}
