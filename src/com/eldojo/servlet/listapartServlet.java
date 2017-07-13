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
import com.eldojo.servlet.iziConn;

/**
 * Servlet implementation class listapartServlet
 */
@WebServlet("/listapartServlet")
public class listapartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public listapartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		Connection cn=null;
		Statement stment =null;
		ResultSet resultSet = null;
		try {
			cn=iziConn.Conectar();
			stment = cn.createStatement();
			log("SELECT a.id_apartamento,pe.nombre,a.edificio,a.ano,a.recamaras,a.costo_alquiler "
					+"FROM Apartamento AS a JOIN Propietario AS p ON a.id_propietario=p.id_propietario " 
					+"JOIN Persona pe ON pe.cedula=p.persona_ced;");
			
			resultSet = stment.executeQuery("SELECT a.id_apartamento,pe.nombre,a.edificio,a.ano,a.recamaras,a.costo_alquiler"
					+"FROM Apartamento AS a JOIN Propietario AS p ON a.id_propietario=p.id_propietario" 
					+"JOIN Persona pe ON pe.cedula=p.persona_ced;");
			
			String str="<tr>"
					+ "<th>ID</th>"
					+ "<th>Propietario</th>"
					+ "<th>Edificio</th>"
					+ "<th>Año</th>"
					+ "<th>Recamaras</th>"
					+ "<th>Costo de Alquiler</th>"
					+ "<th>Estado</th>"
					+ "</tr>";
			
			while(resultSet.next()) {
				str+="<tr><td>"+resultSet.getString(1)+"</td><td>"+resultSet.getString(2)
						+"</td><td>"+resultSet.getString(3)
						+"</td><td>"+resultSet.getString(4)
						+"</td><td>"+resultSet.getString(5)
						+"</td><td>"+resultSet.getString(6)
						+"</td></tr>";
			}
			cn.close();
			response.setContentType("text/html");
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/web/listadoApartamentos.jsp");
			request.setAttribute("listapart",str);
			rd.forward(request, response);
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.err.println(e);
		}

		
		
	}

}
