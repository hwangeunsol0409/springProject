package org.eunsol.service;

import java.util.List;

import org.eunsol.domain.MemberVO;
import org.eunsol.domain.Member_authVO;

public interface MemberService {
	//등록 insert
	public void register(MemberVO mvo, Member_authVO mavo);
	//조회
	public List<MemberVO> getList();
}
