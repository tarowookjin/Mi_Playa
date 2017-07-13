package com.eldojo.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class listapartocuServlet
 */
@WebServlet("/listapartocuServlet")
public class listapartocuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DBUSER = "miplaya";
	private static final String DBPSWD ="Contra1234";
	private static final String DBURL="jdbc:mariadb://186.188.166.2:3306/miplaya";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public listapartocuServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String apartamentosOcupadosQuery="SELECT rip.ID_Cliente,rip.Nombre_Cliente,rip.ID_Apartamento,CONCAT(p.nombre,' ',p.apellido) AS 'Propietario',"
				+"rip.DiasRestantes,rip.Fecha_Entrada,rip.Fecha_Salida "
				+"FROM(SELECT a.id_apartamento AS 'ID_Apartamento',"
				+"a.id_propietario AS 'ID_Propietario' ,"
				+"c.id_cliente AS 'ID_Cliente' ,"
				+"ca.fecha_salida AS 'Fecha_Salida' ,"
				+"ca.fecha_entrada AS 'Fecha_Entrada',"
				+"CONCAT(pe.nombre,' ',pe.apellido) AS 'Nombre_Cliente'," 
				+"DATEDIFF(ca.fecha_salida,LOCALTIMESTAMP)as DiasRestantes "
				+"FROM ClienteApartamento AS ca "
				+"INNER JOIN Cliente AS c ON ca.id_cliente=c.id_cliente "
				+"INNER JOIN Apartamento AS a ON ca.id_apartamento=a.id_apartamento "
				+"INNER JOIN Propietario AS p ON a.id_propietario=p.id_propietario "
				+"INNER JOIN Persona As pe ON c.persona_ced=pe.cedula "
				+"WHERE LOCALTIMESTAMP<ca.fecha_salida) AS rip "
				+"INNER JOIN Propietario As prop on rip.ID_Propietario = prop.id_propietario " 
				+"INNER JOIN Persona AS p on p.cedula = prop.propietario_ced;";
		Connection con=null;
		Statement stment =null;
		ResultSet resultSet = null;
			try {
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(DBURL,DBUSER,DBPSWD);
			stment = con.createStatement();
			
			log(apartamentosOcupadosQuery);
			resultSet = stment.executeQuery(apartamentosOcupadosQuery);

			String str="<tr>"
					+ "<th>ID-Clinete</th>"
					+ "<th>Nombre</th>"
					+ "<th>ID-Apartamento</th>"
					+ "<th>Propietario</th>"
					+ "<th>Noches Restantes</th>"
					+ "<th>Dia de Entrada</th>"
					+ "<th>Dia de Salida</th>"
					+ "</tr>";
			while(resultSet.next()) {
				str+="<tr><td>"+resultSet.getString(1)+"</td><td>"+resultSet.getString(2)
						+"</td><td>"+resultSet.getString(3)
						+"</td><td>"+resultSet.getString("Propietario")
						+"</td><td>"+resultSet.getString(5)
						+"</td><td>"+resultSet.getString(6)
						+"</td><td>"+resultSet.getString(7)
						+"</td></tr>";
			}
			con.close();
			response.setContentType("text/html");
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/web/apartamentosOcupados.jsp");
			request.setAttribute("ocuapart",str);
			rd.forward(request, response);
			}
			catch(Exception e) {
				System.err.println(e);
			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}
