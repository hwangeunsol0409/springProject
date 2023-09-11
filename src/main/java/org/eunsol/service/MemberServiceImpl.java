package org.eunsol.service;

import java.util.List;

import org.eunsol.domain.MemberVO;
import org.eunsol.domain.Member_authVO;
import org.eunsol.mapper.MemberMapper;
import org.eunsol.mapper.Member_authMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MemberServiceImpl implements MemberService {
	@Setter(onMethod_= {@Autowired})
	private MemberMapper mapper;
	
	@Setter(onMethod_= {@Autowired})
	private Member_authMapper amapper;
	
	//패스워드 암호화
	@Setter(onMethod_= {@Autowired})
	private PasswordEncoder pwencoder;

	@Override
	public void register(MemberVO mvo, Member_authVO mavo) {
		//패스워드 암호화해서 저장
		mvo.setPasswd(pwencoder.encode(mvo.getPasswd()));
		mapper.insert(mvo);
		amapper.insert(mavo);
	}

	@Override
	public List<MemberVO> getList() {
		log.info("리스트 출력");
		return mapper.getList();
	}
	
}
