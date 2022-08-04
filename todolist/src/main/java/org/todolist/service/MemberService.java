package org.todolist.service;

import org.todolist.domain.MemberDTO;

public interface MemberService {
	
	// 아이디 중복 체크
	public int idCheck(String id);
	
	// 회원가입
	public int join(MemberDTO member);
	
	// 로그인
	public MemberDTO login(MemberDTO member);
	
}
