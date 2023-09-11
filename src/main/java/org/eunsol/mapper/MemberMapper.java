package org.eunsol.mapper;

import java.util.List;

import org.eunsol.domain.MemberVO;

public interface MemberMapper {
	public void insert(MemberVO mvo);
	public List<MemberVO> getList();
	public MemberVO read(String userid);
}
