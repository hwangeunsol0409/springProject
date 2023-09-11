package org.eunsol.service;

import java.util.List;

import org.eunsol.domain.Criteria;
import org.eunsol.domain.GalleryBoardVO;
import org.eunsol.mapper.GalleryBoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class GalleryBoardServiceImpl implements GalleryBoardService {
	@Setter(onMethod_= {@Autowired})
	private GalleryBoardMapper galleryBoardMapper;
	
	@Override
	public void register(GalleryBoardVO gvo) {
		galleryBoardMapper.insert(gvo);
		
	}
	@Override
	public GalleryBoardVO get(int gno) {
		return galleryBoardMapper.read(gno);
	}
	@Override
	public boolean modify(GalleryBoardVO gvo) {
		return galleryBoardMapper.update(gvo) == 1;
	}

	@Override
	public boolean remove(int gno) {
		return galleryBoardMapper.delete(gno) == 1;
	}
	@Override
	public List<GalleryBoardVO> getList(Criteria cri) {
		log.info("리스트출력");
		return galleryBoardMapper.getList(cri);
	}
	@Override
	public int getTotal(Criteria cri) {
		return galleryBoardMapper.getTotalCount(cri);
	}
	
}
