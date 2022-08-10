package org.todolist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.todolist.domain.TodolistVO;
import org.todolist.mapper.MemberMapper;
import org.todolist.mapper.TodolistMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TodolistServiceImpl implements TodolistService{

	@Autowired
	private final TodolistMapper mapper;

	@Override
	public List<TodolistVO> todoList(String id) {
		return mapper.todoList(id);
	} // todoList

	@Override
	public List<TodolistVO> completedList(String id) {
		return mapper.completedList(id);
	} // completedList

	@Override
	public int addTodolist(TodolistVO todolist) {
		return mapper.addTodolist(todolist);
	} // addTodolist

	@Override
	public int deltodolist(int todono) {
		return mapper.deltodolist(todono);
	} // deltodolist

	@Override
	public int uptodolist(TodolistVO todolist) {
		return mapper.uptodolist(todolist);
	} // uptodolist

} // TodolistService
