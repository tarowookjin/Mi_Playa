package com.eldojo.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet{
	private static final String DBUSER = "miplaya";
	private static final String DBPSWD ="Contra1234";
	private static final String DBURL="jdbc:mysql://localhost/miplaya";
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con=null;
		Statement stment =null;
		ResultSet resultSet = null;
		//get request parameters for userID and password
		String user = request.getParameter("uname");
		String pwd = request.getParameter("psw");
		
		//get servlet config init params
		//String userID = 
		//String password = 
		//logging example
		log("User="+user+"::password="+pwd);
		
		try {
			boolean goodLogin=false;

			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(DBURL, DBUSER, DBPSWD);
			stment = con.createStatement(); 
			log(""+stment.executeQuery("SELECT usuario FROM Empleado;").getFetchSize());
			log("SELECT usuario FROM Empleado WHERE usuario=\'"+user+"\';");
			resultSet = stment.executeQuery("SELECT usuario,contrasena FROM Empleado WHERE usuario=\'"+user+"\';");
	
			while(resultSet.next())
			{	
				String resultUser = resultSet.getString("usuario");
				String resultPass = resultSet.getString("contrasena");
				if(resultUser.equals(user) && resultPass.equals(pwd))
				{
					goodLogin=true;
					break;
				}
			}
			if(goodLogin){
				System.out.println(resultSet.getString("usuario"));
				response.sendRedirect("web/inicio.jsp");
			}else{
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/web/login.jsp");
				PrintWriter out= response.getWriter();
				out.println("<font color=red>Either user name or password is wrong.</font>");
				rd.include(request, response);
				
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
}

