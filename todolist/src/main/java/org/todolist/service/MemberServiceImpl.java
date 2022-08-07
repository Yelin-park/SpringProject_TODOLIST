package org.todolist.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.todolist.domain.MemberVO;
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
	} // idCheck
	
	@Override
	public int join(MemberVO member) {
		int result = mapper.join(member);
		return result;
	} // join

	@Override
	public MemberVO login(MemberVO member) {
		MemberVO login = mapper.login(member);
		return login;		
	} // login

	@Override
	public int withdrawal(MemberVO member) {
		int result = mapper.withdrawal(member);
		return result;
	} // withdrawal
	
} // MemberService
