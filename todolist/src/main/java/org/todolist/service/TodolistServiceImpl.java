package org.todolist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.todolist.domain.TodolistDTO;
import org.todolist.mapper.TodolistMapper;

@Service
public class TodolistServiceImpl implements TodolistService{

	@Autowired
	private TodolistMapper mapper;

	@Override
	public List<TodolistDTO> todoList(String id) {
		return mapper.todoList(id);
	}

	@Override
	public List<TodolistDTO> completedList(String id) {
		return mapper.completedList(id);
	}

	@Override
	public int addTodolist(TodolistDTO todolist) {
		return mapper.addTodolist(todolist);
	}

	@Override
	public int deltodolist(int todono) {
		return mapper.deltodolist(todono);
	}

	@Override
	public int uptodolist(TodolistDTO todolist) {
		return mapper.uptodolist(todolist);
	}

}
