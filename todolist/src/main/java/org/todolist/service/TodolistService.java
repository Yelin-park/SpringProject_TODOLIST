package org.todolist.service;

import java.util.List;

import org.todolist.domain.TodolistVO;

public interface TodolistService {
	
	// 할일 목록 가져오기
	public List<TodolistVO> todoList(String id);
	
	// 전체 목록 가져오기
	public List<TodolistVO> completedList(String id);
	
	// 추가하기
	public int addTodolist(TodolistVO todolist);
	
	// 삭제하기
	public int deltodolist(int todono);
	
	// 체크 후 수정
	public int uptodolist(TodolistVO todolist);
}
