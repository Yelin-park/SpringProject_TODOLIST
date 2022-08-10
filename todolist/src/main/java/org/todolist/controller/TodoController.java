package org.todolist.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.todolist.domain.MemberVO;
import org.todolist.domain.TodolistVO;
import org.todolist.mapper.MemberMapper;
import org.todolist.service.TodolistService;

import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequiredArgsConstructor
public class TodoController {
	
	private static final Logger logger = LoggerFactory.getLogger(TodoController.class);
	
	@Autowired
	private final TodolistService todolistService;
	
	@Autowired
	private final MemberVO member;
	
	@Autowired
	private final TodolistVO todolist;
		
	@GetMapping("/")
	public String main() {
		log.info("메인 페이지  진입");
		return "main";
	} // main	
	
	@GetMapping("/todolist")
	public String todolist(HttpSession session, Model model) {
		log.info("todolist 페이지 진입");
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		if(member == null) {
			log.info("로그인 X 로그인 페이지 리다이렉트");
			return "redirect:/member/login";
		} else {
			log.info("로그인 O todolist 페이지로 이동");
			
			session.setAttribute("member", member);
			
			List<TodolistVO> todoList = todolistService.todoList(member.getId());
			model.addAttribute("todoList", todoList);
			
			List<TodolistVO> completedList = todolistService.completedList(member.getId());
			model.addAttribute("completedList", completedList);
			
			return "todolist";
		} // if
		
	} // todolist
	
	@PostMapping("/todolist")
	public String todolist(TodolistVO todolist, HttpSession session, Model model) {
		log.info("todolist 추가");
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		todolist.setId(member.getId());
		
		int result = todolistService.addTodolist(todolist);
		
		if(result == 1) {
			log.info("todolist 추가 성공");
			return "redirect:/todolist";
		} else {
			log.info("todolist 추가 실패");
			return "todolist";
		} // if
		
	} // todolist
	
	@PostMapping("/delete/todolist")
	@ResponseBody
	public int delete(@RequestParam("todono") int todono) {
		log.info("todono " + todono + "번 삭제");
		int result = todolistService.deltodolist(todono);
		return result;
	} // delete
	
	@PostMapping("/update/todolist")
	@ResponseBody
	public int update(@RequestParam int todono, @RequestParam boolean flag) {	
		int todostate  = flag ? 1 : 0;
		
		if(todostate == 1) {
			log.info("todono " + todono + "번 할 일 완료");
		} else {
			log.info("todono " + todono + "번 할 일 미완료");
		}
		
		todolist.setTodono(todono);
		todolist.setTodostate(todostate);
		
		int result = todolistService.uptodolist(todolist);
		return result;
	} // update
	
} // controller
