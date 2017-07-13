package com.eldojo.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/RegistroPropietario")
public class RegistroPropietario extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/web/RegistroPropietario.jsp");
		rd.forward(request, response);
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con=null;
		Statement stment =null;
		ResultSet resultSet = null;
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		String cedula = request.getParameter("cedula");
		String checkPersonaQuery="SELECT * FROM Persona WHERE cedula = "+"\'"+cedula+"\'";
		String checkPropietarioQuery="SELECT * FROM Propietario WHERE propietario_ced = "+"\'"+cedula+"\'";
		
		try {
			con = iziConn.Conectar();
			stment = con.createStatement();
			log(checkPersonaQuery);
			resultSet=stment.executeQuery(checkPersonaQuery);
			if(!resultSet.next())
			{
				String insertNewPersona= "INSERT INTO Persona(cedula,nombre,apellido) VALUES("
						+"\'"+cedula+"\'"+","
						+"\'"+nombre+"\'"+","
						+"\'"+apellido+"\'"+");";
				resultSet=stment.executeQuery(insertNewPersona);	
			}
			resultSet=stment.executeQuery(checkPropietarioQuery);
			if(!resultSet.next())
			{
				String insertNewPropietario ="INSERT INTO Propietario(propietario_ced) VALUES(\'"+cedula+"\');";
				log(insertNewPropietario );
				resultSet=stment.executeQuery(insertNewPropietario);
				response.getWriter().println("<a href=\""+request.getContextPath()+"/web/inicio.jsp\">TODO SALIO BIEN, REGRESAR AL INICIO</a>");
			}
			else
			{
				response.getWriter().println("<a href=\""+request.getContextPath()+"/web/RegistroPropietario.jsp\">El Propietario ya existe, intentelo de nuevo</a>");

			}

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	

}
