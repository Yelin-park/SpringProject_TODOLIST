package org.todolist.mapper;

import org.todolist.domain.MemberDTO;

public interface MemberMapper {
	
	// 아이디 중복체크
	public int idCheck(String id);

	// 회원가입
	public int join(MemberDTO member);
	
	// 로그인
	public MemberDTO login(MemberDTO member);
	
}
