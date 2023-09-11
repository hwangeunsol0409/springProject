package org.eunsol.service;

import java.util.List;

import org.eunsol.domain.PerformanceVO;
import org.eunsol.mapper.PerformanceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class PerformanceServiceImpl implements PerformanceService{
	@Setter(onMethod_= {@Autowired})
	private PerformanceMapper performanceMapper;

	@Override
	public List<PerformanceVO> getList() {
		log.info("리스트출력");
		return performanceMapper.getList();
	}

	@Override
	public void register(PerformanceVO pvo) {
		performanceMapper.insert(pvo);
	}

	@Override
	public PerformanceVO get(int gno) {
		return performanceMapper.read(gno);
	}

}
