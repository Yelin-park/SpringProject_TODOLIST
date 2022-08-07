package org.todolist.domain;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class TodolistVO {
	
	private int todono;
	private String todoname;
	private int todostate;
	private String id;
	
}
