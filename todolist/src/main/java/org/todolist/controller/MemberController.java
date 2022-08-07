package org.todolist.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.todolist.domain.MemberVO;
import org.todolist.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Setter(onMethod_ = {@Autowired})
	private MemberService memberService;
	
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	@PostMapping("/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) {
		int result = memberService.idCheck(id);
		return result;
	} // idCheck
	
	@GetMapping("/join")
	public String join() {
		log.info("회원가입  페이지 진입");
		return "join";
	} // join	
	
	
	@PostMapping("/join")
	public String join(MemberVO member) {
		log.info("회원가입 post 요청");
		
		String inputPass = member.getPwd();
		String pwd = pwdEncoder.encode(inputPass);
		member.setPwd(pwd);
		
		int result = memberService.join(member);
		
		log.info("회원가입 완료 수 " + result);
		
		if(result == 0) {
			return "redirect:/";
		} else {
			return "redirect:/member/login";
		}
	} // join
	
	@PostMapping("/login")
	public String login(MemberVO member, HttpSession session, Model model) {
		log.info("로그인 post 요청");
				
		session.getAttribute("member");
		int result = memberService.idCheck(member.getId());
		
		if(result != 1) {
			log.info("로그인 실패 - 아이디 오류");
			model.addAttribute("msg", "idmiss");
			return "login";
		}
		
		MemberVO login = memberService.login(member);
		boolean pwdMatch = pwdEncoder.matches(member.getPwd(), login.getPwd());
		
		if(login != null && pwdMatch == true) {
			log.info("로그인 성공");
			session.setAttribute("member", login);
			return "redirect:/todolist";
		} else {
			log.info("로그인 실패 - 비밀번호 오류");
			model.addAttribute("msg", "pwdmiss");
			return "login";
		} 
	} // login
	
	@GetMapping("/login")
	public String login() {
		log.info("로그인 페이지  진입");
		return "login";
	} // login
	
	@GetMapping("/logout")
	public String logout(MemberVO member, HttpSession session) {
		log.info("로그아웃 요청");
		
		session.invalidate();
		log.info("로그아웃 완료");
		
		return "main";
	} // logout
	
	@GetMapping("/withdrawal")
	public String withdrawal() {
		log.info("회원탈퇴 페이지 진입");
		return "withdrawal";
	} // withdrawal
	
	@PostMapping("/withdrawal")
	public String withdrawal(MemberVO member, HttpSession session, Model model) {
		log.info("회원탈퇴 post 요청");
		
		session.getAttribute("member");
		int result = memberService.idCheck(member.getId());
		
		if(result != 1) {
			log.info("회원탈퇴 실패 - 아이디 오류");
			model.addAttribute("msg", "idmiss");
			return "withdrawal";
		}
		
		MemberVO withdrawalMember = memberService.login(member);
		
		boolean pwdMatch = pwdEncoder.matches(member.getPwd(), withdrawalMember.getPwd());
		
		if(withdrawalMember != null && pwdMatch == true) {
			withdrawalMember.setName("회원탈퇴");
			withdrawalMember.setTel("010-1111-1111");
			withdrawalMember.setEmail("withdrawal@withdrawal.com");
			withdrawalMember.setPwd("Withdrawal123@");
			int cnt = memberService.withdrawal(withdrawalMember);
			if(cnt == 1) {
				log.info("회원탈퇴 성공");
				log.info(withdrawalMember);
				return "redirect:/member/login";
			} else {
				log.info("회원탈퇴 실패");
				model.addAttribute("msg", "pwdmiss");
				return "withdrawal";
			}		
		} else {
			log.info("회원탈퇴 실패 - 비밀번호 오류");
			model.addAttribute("msg", "pwdmiss");
			return "withdrawal";
		}
		
	} // withdrawal
	
	
} // controller
