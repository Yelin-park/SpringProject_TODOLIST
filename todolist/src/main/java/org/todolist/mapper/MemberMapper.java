package org.todolist.mapper;

import org.todolist.domain.MemberVO;

public interface MemberMapper {
	
	// 아이디 중복체크
	public int idCheck(String id);

	// 회원가입
	public int join(MemberVO member);
	
	// 로그인
	public MemberVO login(MemberVO member);
	
	// 회원탈퇴
	public int withdrawal(MemberVO member);
	
}
