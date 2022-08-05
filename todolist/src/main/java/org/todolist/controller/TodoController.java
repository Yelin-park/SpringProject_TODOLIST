package org.todolist.controller;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.todolist.domain.MemberDTO;
import org.todolist.mapper.TodolistMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class TodoController {
	
	private static final Logger logger = LoggerFactory.getLogger(TodoController.class);
	
	@Setter(onMethod_ = {@Autowired})
	private TodolistMapper mapper;
	
	@Setter(onMethod_ = {@Autowired})
	private MemberDTO member;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Locale locale, Model model) {
		log.info("메인 페이지  진입");
		return "main";
	}	
	
	@RequestMapping(value = "/todolist", method = RequestMethod.GET)
	public String todolist(Locale locale, HttpSession session, Model model) {
		log.info("todolist 페이지 진입");
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		if(member == null) {
			log.info("로그인 X 로그인 페이지 리다이렉트");
			return "redirect:/member/login";
		} else {
			log.info("로그인 O todolist 페이지로 이동");
			return "todolist";
		}
	}
	
	
}
