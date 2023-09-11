package org.eunsol.service;

import java.util.List;

import org.eunsol.domain.ReservationVO;

import org.eunsol.mapper.ReservationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ReservationImpl implements ReservaionService{
	@Setter(onMethod_=  {@Autowired})
	private ReservationMapper reservationMapper;

	@Override
	public List<ReservationVO> getList() {
		log.info("리스트출력");
		return reservationMapper.getList();
	}

	@Override
	public void register(ReservationVO rvo) {
		reservationMapper.insert(rvo);
	}

	@Override
	public ReservationVO get(int rno) {
		return reservationMapper.read(rno);
	}
	
	
}
