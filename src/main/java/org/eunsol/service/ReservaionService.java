package org.eunsol.service;

import java.util.List;

import org.eunsol.domain.ReservationVO;

public interface ReservaionService {
	public List<ReservationVO> getList();
	
	public void register(ReservationVO rvo);
	
	public ReservationVO get(int rno);
}
