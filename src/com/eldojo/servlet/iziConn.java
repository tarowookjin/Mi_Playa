package com.eldojo.servlet;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class iziConn {

	 public static final String db = "miplaya";
	 public static final String  url = "jdbc:mariadb://186.188.166.2:3306/"+db;
	 public static final String user = "miplaya";
	 public static final String pass = "Contra1234";
	 
	 public static Connection Conectar() throws SQLException, ClassNotFoundException{

	       Connection link = null;

	       Class.forName("org.mariadb.jdbc.Driver");
	       link = DriverManager.getConnection(url, user, pass);
	       

	       return link;
	   }
}
