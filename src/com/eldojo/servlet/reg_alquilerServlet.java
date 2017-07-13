package com.eldojo.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eldojo.entities.*;


/**
 * Servlet implementation class reg_alquilerServlet
 */
@WebServlet("/RegistroAlquiler")
public class reg_alquilerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Rent rent = null;
	private Client client = null;
	private ArrayList<Apartment> apartments = null;
	private Integer paso = null; 
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public reg_alquilerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/web/registroAlquiler.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con=null;
		Statement stment =null;
		ResultSet resultSet = null;
		String action = request.getParameter("action");
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		if(action!=null)
		{
			if(action.equals("back"))
			{
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/web/registroAlquiler.jsp");
				request.setAttribute("cliente",client);
				request.setAttribute("alquiler",rent);
				rd.forward(request, response);
			}
			
		}
		else
		{
		
		
		
			if(rent==null)
			{
				rent = new Rent();
				
			}
			rent.setFecha_entrada(request.getParameter("fecha_entrada"));
			rent.setFecha_salida(request.getParameter("fecha_salida"));
			rent.setCantPersonas(Integer.parseInt(request.getParameter("cant_personas")));

			rent.setTipoPago(request.getParameter("pago"));
			if(client==null)
			{
				client =new Client();
			}
			client.setNombre(request.getParameter("nombre"));
			client.setCedula(request.getParameter("cedula"));
			String avaibleApartmentsQuery = "SELECT * FROM Apartamento AS a INNER JOIN ClienteApartamento AS ca on a.id_apartamento = ca.id_apartamento WHERE ca.fecha_salida<"  
					+"\'"+rent.getFecha_salida()+"\'";
				try
				{
					con = iziConn.Conectar();
					stment = con.createStatement();
					log(avaibleApartmentsQuery);
					resultSet=stment.executeQuery(avaibleApartmentsQuery);
					apartments = new ArrayList<Apartment>();
					while(resultSet.next())
					{
						Apartment tmpApt = new Apartment();
						tmpApt.setCosto_alquiler(resultSet.getDouble("costo_alquiler"));
						tmpApt.setAno(resultSet.getInt("ano"));
						tmpApt.setCosto_mantenimiento(resultSet.getDouble("costo_mantenimiento"));
						tmpApt.setEdificio(resultSet.getInt("edificio"));
						tmpApt.setRecamaras(resultSet.getInt("recamaras"));
				
						apartments.add(tmpApt);
					}
					String availableApartmentsTable = "<table><tr><th>Seleccion</th><th>ID</th><th>Recamaras</th><th>ano</th><th>Costo Alquiler</th><th>Costo Mantenimiento</th><th>Edificio</th></tr>";
					for(Apartment apt: apartments)
					{
						availableApartmentsTable +="<tr>";
						availableApartmentsTable +="<td><input type=\"radio\" name=\"id_apt\" value=\""+apt.getId_apartamento()+"\"></td>";
						availableApartmentsTable +="<td>"+apt.getId_apartamento()+"</td>";
						availableApartmentsTable +="<td>"+apt.getRecamaras()+"</td>";
						availableApartmentsTable +="<td"+apt.getAno()+"</td>";
						availableApartmentsTable +="<td>"+apt.getCosto_alquiler()+"</td>";
						availableApartmentsTable +="<td>"+apt.getCosto_mantenimiento()+"</td>";
						availableApartmentsTable +="<td>"+apt.getEdificio()+"</td>";
						availableApartmentsTable +="</tr>";
					}
					availableApartmentsTable +="</table>";
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/web/SeleccionApartamento.jsp");
					request.setAttribute("tableApartmentDisponibles", availableApartmentsTable);
					request.setAttribute("clientes",client);
					request.setAttribute("alquiler",rent);
					rd.forward(request, response);
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
			
		}	
	}

}
