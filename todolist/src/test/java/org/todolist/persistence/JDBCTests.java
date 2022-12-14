package org.todolist.persistence;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {

	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void test(){
		try(Connection con = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:xe",
				"todolist",
				"list1234")){
			
			log.info(con);
			
		} catch(Exception e){
			e.printStackTrace();
		}// try
		
	} // test

} // class
