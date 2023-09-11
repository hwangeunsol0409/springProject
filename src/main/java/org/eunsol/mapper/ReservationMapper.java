package org.eunsol.mapper;

import java.util.List;

import org.eunsol.domain.ReservationVO;

public interface ReservationMapper {
	//read => all select 철
	public List<ReservationVO> getList();
	
	//create ==> insert처리
	public void insert(ReservationVO rvo);
	
	//read ==> select 처리
	public ReservationVO read(int rno);

}
