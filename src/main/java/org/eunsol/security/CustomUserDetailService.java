package org.eunsol.security;


import org.eunsol.domain.MemberVO;
import org.eunsol.mapper.MemberMapper;
import org.eunsol.security.domain.CustomUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailService implements UserDetailsService{
	@Setter(onMethod_= {@Autowired})
	private MemberMapper mapper;
	@Override
	public UserDetails loadUserByUsername(String name) throws UsernameNotFoundException {
		// MemberMapper를 사용해서 MemberVO를 조회하고
		MemberVO mvo = mapper.read(name);
		log.info("mvo 는 : " +mvo);
		//MemberVO 인스턴스가 있으면 UserDetails으로 변환해서 반환한다.
		//return null;
		return mvo == null ? null : new CustomUser(mvo);
	}
}
