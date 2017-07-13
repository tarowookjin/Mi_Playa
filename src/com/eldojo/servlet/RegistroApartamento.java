package com.eldojo.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegistroApartamento {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String preQuery="SELECT CONCAT(pe.nombre,' ',pe.apellido) AS Propietario " 
				+"FROM Propietario AS p "
				+"JOIN Persona AS pe ON p.propietario_ced=pe.cedula ";
				Connection cn=null;
				Statement stment =null;
				ResultSet resultSet = null;
				try {
					cn=iziConn.Conectar();
					stment = cn.createStatement();
					log(preQuery);
					resultSet = stment.executeQuery(preQuery);
					String str="";
					while(resultSet.next()) {
						str+="<option value=\""+resultSet.getString("Propietario")+"\">"+resultSet.getString("Propietario")+"</option>";
					}
					cn.close();
					response.setContentType("text/html");
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/web/informeIngreso.jsp");
					request.setAttribute("propietarios_disp",str);
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
		String preQuery="SELECT CONCAT(pe.nombre,' ',pe.apellido) AS Propietario " 
				+"FROM Propietario AS p "
				+"JOIN Persona AS pe ON p.propietario_ced=pe.cedula ";
		String propietario = request.getParameter("chose_propietario");
		String preQuery2="SELECT c.id_apartamento,c.fecha_entrada,c.monto "
				+"FROM Propietario AS p "
				+"JOIN Apartamento AS a ON a.id_propietario=p.id_propietario "
				+"JOIN Persona AS pe ON p.propietario_ced=pe.cedula "
				+"JOIN ClienteApartamento AS c ON a.id_apartamento=c.id_apartamento "
				+"WHERE CONCAT(pe.nombre,' ',pe.apellido) LIKE '"+propietario+"' "
				+"ORDER BY c.id_apartamento";
				Connection cn=null;
				Statement stment =null;
				ResultSet resultSet = null;
				try {
					cn=iziConn.Conectar();
					stment = cn.createStatement();
					boolean find_propie=false;
					log(preQuery);
					resultSet = stment.executeQuery(preQuery);
					String str="";
					while(resultSet.next()) {
						String tempropietario=resultSet.getString("Propietario");
						if(tempropietario.equals(propietario)) {
							find_propie=true;
						}
						
					}
					
					String str2="Propietario: "+propietario+"<tr>"
							+"<th>ID-Apartamento</th>"
							+"<th>Fecha de Alquiler</th>"
							+"<th>Monto Cobrado</th>"
							+"</tr>";
					if(find_propie) {
						resultSet = stment.executeQuery(preQuery2);
						
						while(resultSet.next()) {
							log("HEYYYYMEASEFDFGDFH");
							str2+="<tr><td>"+resultSet.getString(1)+"</td><td>"+resultSet.getString(2)
									+"</td><td>"+resultSet.getString(3)
									+"</td></tr>";
						}
					}
					cn.close();
					response.setContentType("text/html");
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/web/informeIngreso.jsp");
					request.setAttribute("lista_monto",str2);
					doGet(request, response);
					//rd.forward(request, response);
				} catch (SQLException | ClassNotFoundException e) {
					// TODO Auto-generated catch block
					System.err.println(e);
				}
				
	}

}
