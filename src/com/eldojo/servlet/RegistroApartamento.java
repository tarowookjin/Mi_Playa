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
@WebServlet("/RegistroApartamento")
public class RegistroApartamento extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String propietaryNamesQuery="SELECT CONCAT(pe.nombre,' ',pe.apellido)AS Propietario,p.id_propietario AS id_prop " 
				+"FROM Propietario AS p "
				+"JOIN Persona AS pe ON p.propietario_ced=pe.cedula ";
				Connection cn=null;
				Statement stment =null;
				ResultSet resultSet = null;
				try {
					cn=iziConn.Conectar();
					stment = cn.createStatement();
					log(propietaryNamesQuery);
					resultSet = stment.executeQuery(propietaryNamesQuery);
					String propietaryNamesSelect="";
					while(resultSet.next()) {
						propietaryNamesSelect+="<option value=\""+resultSet.getString("id_prop")+"\">"+resultSet.getString("Propietario")+"</option>";
					}
					cn.close();
					response.setContentType("text/html");
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/web/RegistroApartamento.jsp");
					request.setAttribute("propietarios_disp",propietaryNamesSelect);
					rd.forward(request, response);
				} catch (SQLException | ClassNotFoundException e) {
					// TODO Auto-generated catch block
					System.err.println(e);
				}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String id_prop = request.getParameter("id_prop");
		double costo_alquiler = Double.parseDouble(request.getParameter("costo_alquiler"));
		double costo_mantenimiento = Double.parseDouble(request.getParameter("costo_mantenimiento"));
		int ano = Integer.parseInt(request.getParameter("ano"));
		int recamaras = Integer.parseInt(request.getParameter("recamaras"));
		int edificio= Integer.parseInt(request.getParameter("edificio"));
		String insertNewApartmentQuery = "INSERT INTO Apartamento(ano,costo_alquiler,costo_mantenimiento,edificio,recamaras,id_propietario) "
				+"VALUES("
				+ano+","
				+costo_alquiler+","
				+costo_mantenimiento+","
				+edificio+","
				+recamaras+","
				+id_prop
				+");";
				Connection cn=null;
				Statement stment =null;
				ResultSet resultSet = null;
				try {
					cn=iziConn.Conectar();
					stment = cn.createStatement();
					log(insertNewApartmentQuery);
					resultSet = stment.executeQuery(insertNewApartmentQuery);
					cn.close();
					response.getWriter().println("<a href=\""+request.getContextPath()+"/web/inicio.jsp\">TODO SALIO BIEN, REGRESAR AL INICIO</a>");
				} catch (SQLException | ClassNotFoundException e) {
					// TODO Auto-generated catch block
					System.err.println(e);
				}
				
	}
}
