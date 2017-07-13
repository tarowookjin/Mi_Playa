package com.eldojo.servlet;

import java.io.IOException;
import java.io.PrintWriter;
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
	private Apartment apartment =null;
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
			if(action.equals("Resumen"))
			{
				int id_apartment = Integer.parseInt(request.getParameter("id_apt"));
				
				for(Apartment tmpApt:apartments)
				{
					if(tmpApt.getId_apartamento()==id_apartment)
					{
						apartment =tmpApt;
						break;
					}
				}
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/web/confirmacion.jsp");
				request.setAttribute("cliente",client);
				request.setAttribute("alquiler",rent);
				request.setAttribute("apartment",apartment);
				rd.forward(request, response);
				
			}
			if(action.equals("Confirm"))
			{
				
				try
				{
					String checkPersonaQuery="SELECT * FROM Persona WHERE cedula = "+"\'"+client.getCedula()+"\'";
					String checkClienteQuery="SELECT * FROM Cliente WHERE persona_ced = "+"\'"+client.getCedula()+"\'";
					con = iziConn.Conectar();
					stment = con.createStatement();
					log(checkPersonaQuery);
					resultSet=stment.executeQuery(checkPersonaQuery);
					if(!resultSet.next())
					{
						String insertNewPersona= "INSERT INTO Persona(cedula,nombre,apellido) VALUES("
								+"\'"+client.getCedula()+"\'"+","
								+"\'"+client.getNombre()+"\'"+","
								+"\'"+client.getApellido()+"\'"+");";
						con = iziConn.Conectar();
						stment = con.createStatement();
						log(insertNewPersona);
						resultSet=stment.executeQuery(insertNewPersona);
					}
					resultSet=stment.executeQuery(checkClienteQuery);
					if(!resultSet.next())
					{
						String insertNewCliente ="INSERT INTO Cliente(persona_ced) VALUES(\'"+client.getCedula()+"\');";
						con = iziConn.Conectar();
						stment = con.createStatement();
						log(insertNewCliente );
						resultSet=stment.executeQuery(insertNewCliente);
					}
						
				String recoverClienteIdQuery="SELECT id_cliente FROM Cliente WHERE persona_ced="+"\'"+client.getCedula()+"\'";
				con = iziConn.Conectar();
				stment = con.createStatement();
				log(recoverClienteIdQuery);
				resultSet=stment.executeQuery(recoverClienteIdQuery);
				
				if(resultSet.next())
				{
					client.setCod_cli(resultSet.getInt("id_cliente"));
					
				}
					
				String insertAlquilerQuery= "INSERT INTO ClienteApartamento(cant_personas,forma_pago,monto,fecha_entrada,fecha_salida,id_cliente,id_apartamento) "
						+ "VALUES(" 
						+rent.getCantPersonas()+","
						+"\'"+rent.getTipoPago()+"\'"+","
						+apartment.getCosto_alquiler()*1.07+","
						+"\'"+rent.getFecha_entrada()+"\'"+","
						+"\'"+rent.getFecha_salida()+"\'"+","
						+client.getCod_cli()+","
						+apartment.getId_apartamento()+");";
				con = iziConn.Conectar();
				stment = con.createStatement();
				log(insertAlquilerQuery);
				resultSet=stment.executeQuery(insertAlquilerQuery);	
				response.getWriter().println("<a href=\"${pageContext.request.contextPath}/web/inicio.jsp\">TODO SALIO BIEN, REGRESAR AL INICIO</a>");
				}		
						catch(Exception e)
						{
							e.printStackTrace();
						}
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
			client.setApellido(request.getParameter("apellido"));
			client.setCedula(request.getParameter("cedula"));
			String avaibleApartmentsQuery = "SELECT * FROM Apartamento AS a LEFT JOIN ClienteApartamento AS ca on a.id_apartamento = ca.id_apartamento WHERE (ca.fecha_salida IS NULL OR ca.fecha_salida<"  
					+"\'"+rent.getFecha_entrada()+"\');";
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
						tmpApt.setId_apartamento(resultSet.getInt("id_apartamento"));
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
						availableApartmentsTable +="<td><input required type=\"radio\" name=\"id_apt\" value=\""+apt.getId_apartamento()+"\"></td>";
						availableApartmentsTable +="<td>"+apt.getId_apartamento()+"</td>";
						availableApartmentsTable +="<td>"+apt.getRecamaras()+"</td>";
						availableApartmentsTable +="<td>"+apt.getAno()+"</td>";
						availableApartmentsTable +="<td>"+apt.getCosto_alquiler()+"</td>";
						availableApartmentsTable +="<td>"+apt.getCosto_mantenimiento()+"</td>";
						availableApartmentsTable +="<td>"+apt.getEdificio()+"</td>";
						availableApartmentsTable +="</tr>";
					}
					availableApartmentsTable +="</table>";
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/web/SeleccionApartamento.jsp");
					request.setAttribute("tableApartmentDisponibles", availableApartmentsTable);
					request.setAttribute("cliente",client);
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
