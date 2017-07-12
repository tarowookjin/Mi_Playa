package com.eldojo.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class listclientServlet
 */
@WebServlet("/listclientServlet")
public class listclientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DBUSER = "miplaya";
	private static final String DBPSWD ="Contra1234";
	private static final String DBURL="jdbc:mariadb://186.188.166.2:3306/miplaya";
	
    public listclientServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		Connection con=null;
		Statement stment =null;
		ResultSet resultSet = null;
			try {
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(DBURL,DBUSER,DBPSWD);
			stment = con.createStatement();
			response.setContentType("text/html");
			resultSet = stment.executeQuery("SELECT id_cliente,persona_ced FROM Cliente;");
			String str="<tr><th>ID-Cliente</th><th>Cedula</th></tr>";
			while(resultSet.next()) {
				str+="<tr><td>"+resultSet.getString(1)+"</td><td>"+resultSet.getString(2)+"</td></tr>";
			}
			con.close();
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB/listadoClientes.jsp");
			request.setAttribute("clientes",str);
			rd.forward(request, response);
			}
			catch(Exception e) {
				System.err.println(e);
			}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}
