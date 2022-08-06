package org.todolist.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.todolist.domain.MemberDTO;
import org.todolist.domain.TodolistDTO;
import org.todolist.mapper.TodolistMapper;
import org.todolist.service.TodolistService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class TodoController {
	
	private static final Logger logger = LoggerFactory.getLogger(TodoController.class);
	
	@Setter(onMethod_ = {@Autowired})
	private TodolistService todolistService;
	
	@Setter(onMethod_ = {@Autowired})
	private MemberDTO member;
	
	@Setter(onMethod_ = {@Autowired})
	private TodolistDTO todolist;

	@GetMapping("/")
	public String main() {
		
		log.info("메인 페이지  진입");
		
		return "main";
	}	
	
	@GetMapping("/todolist")
	public String todolist(HttpSession session, Model model) {
		
		log.info("todolist 페이지 진입");
		
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		
		if(member == null) {
			log.info("로그인 X 로그인 페이지 리다이렉트");
			return "redirect:/member/login";
		} else {
			log.info("로그인 O todolist 페이지로 이동");
			
			session.setAttribute("member", member);
			
			List<TodolistDTO> todoList = todolistService.todoList(member.getId());
			model.addAttribute("todoList", todoList);
			
			List<TodolistDTO> completedList = todolistService.completedList(member.getId());
			model.addAttribute("completedList", completedList);
			
			return "todolist";
		}
	}
	
	@PostMapping("/todolist")
	public String todolist(TodolistDTO todolist, HttpSession session, Model model) {
		
		log.info("todolist 추가");
		
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		System.out.println(member.getId());
		todolist.setId(member.getId());
		
		int result = todolistService.addTodolist(todolist);
		
		if(result == 1) {
			log.info("todolist 추가 성공");
			return "redirect:/todolist";
		} else {
			log.info("todolist 추가 실패");
			return "todolist";
		}
		
	}
	
	@PostMapping("/delete/todolist")
	@ResponseBody
	public int delete(@RequestParam("todono") int todono) {
		System.out.println(todono);
		int result = todolistService.deltodolist(todono);
		return result;
	}
	
	@PostMapping("/update/todolist")
	@ResponseBody
	public int update(@RequestParam int todono, @RequestParam boolean flag) {
		
		System.out.println(todono);
		
		int todostate  = flag ? 1 : 0;
		System.out.println(flag);
		System.out.println(todostate);
		
		todolist.setTodono(todono);
		todolist.setTodostate(todostate);
		
		int result = todolistService.uptodolist(todolist);
		return result;
	}

	
	
	
	
	
}
