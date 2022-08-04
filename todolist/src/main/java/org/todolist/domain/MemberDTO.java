package org.todolist.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class MemberDTO {
	
	private String id;
	private String pwd;
	private String name;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birth;
	private String gender;
	private String email;
	private String tel;
	private int use_status;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date regdate;

}
