package org.todolist.mapper;

import java.util.List;

import org.todolist.domain.TodolistDTO;

public interface TodolistMapper {
	
	// 할일 목록 가져오기
	public List<TodolistDTO> todoList(String id);
	
	// 전체 목록 가져오기
	public List<TodolistDTO> completedList(String id);
	
	// 추가하기
	public int addTodolist(TodolistDTO todolist);
	
	// 삭제하기
	public int deltodolist(int todono);
	
	// 체크 후 수정하기
	public int uptodolist(TodolistDTO todolist);
}
