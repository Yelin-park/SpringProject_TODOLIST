package org.todolist.persistence;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests2 {

	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void test(){
		try(Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/overload",
				"overload",
				"Todo1234")){
			
			log.info(con);
			
		} catch(Exception e){
			e.printStackTrace();
		}// try
		
	} // test

} // class
