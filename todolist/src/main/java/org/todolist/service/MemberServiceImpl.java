package org.todolist.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.todolist.domain.MemberDTO;
import org.todolist.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberMapper mapper;
	
	// 아이디 중복 체크
	@Override
	public int idCheck(String id) {
		int result = mapper.idCheck(id);
		return result;
	}
	
	@Override
	public int join(MemberDTO member) {
		int result = mapper.join(member);
		return result;
	}

	@Override
	public MemberDTO login(MemberDTO member) {
		MemberDTO login = mapper.login(member);
		return login;		
	}

	@Override
	public int withdrawal(MemberDTO member) {
		int result = mapper.withdrawal(member);
		return result;
	}


	
}
