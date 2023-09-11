package org.eunsol.service;

import java.util.List;

import org.eunsol.domain.BoardVO;
import org.eunsol.domain.Criteria;
import org.eunsol.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{
	@Setter(onMethod_= {@Autowired})
	private BoardMapper mapper;

	@Override
	public void register(BoardVO board) {
		log.info( "등록하기 : "+ board);
		mapper.insert(board);
		
	}

	@Override
	public BoardVO get(Long bno) {
		log.info("조회하기 : " + bno );
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO board) {
		log.info("수정하기 : " + board );
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long bno) {
		log.info("삭제하기 : " + bno );
		return mapper.delete(bno) == 1;
	}


	@Override
	public List<BoardVO> getList(Criteria cri) {
		log.info("리스트출력");
		return mapper.getList(cri);
	}
	
	@Override
	public int getTotal(Criteria cri) {
		log.info("페이지 리스트 출력");
		return  mapper.getTotalCount(cri);
	}

	
}
